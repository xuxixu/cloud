package com.cloud.servlet;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.hadoop.fs.FileStatus;

import com.cloud.dao.HdfsDao;
@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String fileName = request.getParameter("fileName");
		//创建在当前路径
		String a=(String) request.getParameter("thisPath");
		String filePath1=a+"/"+ fileName;
		System.out.println("删除文件:"+filePath1);
		HdfsDao.DeleteFile(filePath1);
		
		HttpSession session = request.getSession();
		String username=(String)session.getAttribute("username");
		if(a.equals(username)) {
			FileStatus[] documentList = HdfsDao.ShowFiles(a);
			request.setAttribute("documentList", documentList);
			System.out.println("得到list数据"+ Arrays.toString(documentList));
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getHeader("Referer"));
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request, response);
	}
}