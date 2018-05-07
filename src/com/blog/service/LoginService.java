package com.blog.service;

import com.blog.component.User;

public class LoginService {
	public Boolean login(String name,String pwd){
		User u = new User();
		User m = u.findFirst("select * from demo_user where (name = '"+name+"' or phoneoremail = '"+name+"')and password = ?" , pwd);
		if(m==null){
			return false;
		}
		return true;
	}
}
