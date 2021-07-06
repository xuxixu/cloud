package com.cloud.servlet;

import com.cloud.dao.HdfsDao;
import com.cloud.dao.UserDao;
import com.cloud.pojo.User;
import org.apache.hadoop.fs.FileStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Modifypassword")
public class ModifyPasswordServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;
 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		// 接收表单信息
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		String npassword = request.getParameter("npassword");
		User user = new UserDao().findUser(username);
		if (user != null) {
			if (user.getPassword().equals(password)) {

//				request.getSession().setAttribute("user", user);
				boolean b = new UserDao().updataUser(username, npassword);
				request.getRequestDispatcher("password.jsp").forward(request, response);
//				response.sendRedirect("index.jsp");
			} else {
				// （1）只弹出弹窗
				response.getWriter()
						.write("<script>alert('旧密码错误！！'); window.location='password.jsp'; window.close();</script>");
				response.getWriter().flush();
//				response.getWriter().write("<script>alert('弹窗要显示的内容！');</script>");
//				request.setAttribute("loginError", "* 密码错误");
//				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} else {
			response.getWriter()
					.write("<script>alert('用户不存在！！'); window.location='password.jsp'; window.close();</script>");
			response.getWriter().flush();
//			request.setAttribute("loginError", "* 用户不存在");
//			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
 
}
