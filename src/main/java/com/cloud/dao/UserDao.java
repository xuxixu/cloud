package com.cloud.dao;

import com.cloud.pojo.User;
import com.cloud.utils.C3P0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {


	// 根据用户名查找用户密码
	public User findUser(String username) {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from panuser where user=?";
		User user = null;
		try {
			user = queryRunner.query(sql,new BeanHandler<User>(User.class),username);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

 		return user;
	}

	//查询所有
	public List<User> findAll() {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from panuser";
		List<User> users= new ArrayList<User>();
		try {
			users = queryRunner.query(sql,new BeanListHandler<User>(User.class));
			System.out.println(users);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		return users;
	}
	// 添加用户
	public boolean addUser(String username, String psw) {

		String sql = "INSERT INTO panuser(user,password) VALUES(?,?)";
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		int i=0;
		try {
			i = queryRunner.update(sql,username,psw);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		if(i==0) return false;
		return true;
	}

	public boolean updataUser(String username, String psw) {

		String sql = "UPDATE panuser SET password = ? WHERE user = ? ";
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		int i=0;
		try {
			i = queryRunner.update(sql,psw,username);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}
		if(i==0) return false;
		return true;
	}
}
