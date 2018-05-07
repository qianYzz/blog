package com.blog.service;

import java.util.List;

import com.blog.component.User;
import com.jfinal.core.Controller;

public class RegisterService extends Controller{
	public void index(){
		
	}
	public void validName(){
		User u = new User();
		String name = getPara("name");
		System.out.println("name");
		List<User> ulist =  u.find("select * from demo_user where name = ?",name);
		if(ulist.size()>0){
			renderText("no");
		}
	}
	public void validEmail(){
		User u = new User();
		String phoneoremail = getPara("phoneoremail");
		List<User> ulist =  u.find("select * from demo_user where phoneoremail = ?",phoneoremail);
		if(ulist.size()>0){
			renderText("no");
		}
	}
	
	
}
