package com.blog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.blog.component.User;
import com.blog.service.LoginService;
import com.blog.util.DBHelper;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
public class UserController extends Controller{
	public  void index() {
			render("/view/login/login.jsp");
	}	
	public  void add(){
			User u = getModel(User.class);
			u.setName(getPara("user.name"));
			u.setId(DBHelper.getUUID());
			u.setPassword(getPara("user.password"));
			getPara("comparepassword");
			boolean b =  u.save();
			if(b==true){
				setSessionAttr("user", u);
				list();
			}else{
				setAttr("errMsg", "注册失败稍后重试");
				render("/register");
			}			
	}
	public  void delete() {
		String id = getPara("id");
/*		User.dao.deleteById(id);
		Record record = new Record();*/
		Boolean b = Db.deleteById("demo_user", id);
		System.out.println("0000000000000000000000:"+b);
		redirect("/platform");
	}
	public  void update() {
/*		User u = new User();
		u.set("id", getPara("id"));
		u.set("name", getPara("name"));
		u.set("age", getPara("age"));
		u.update();*/
		Record u = new Record();
		u.set("id", getPara("id"));
		u.set("name", getPara("name"));
		u.set("age", getPara("age"));
		Db.update("demo_user", u);
	}
	public  void list() {
		String str = getPara("searchstr");
		int pageNumber = getParaToInt(0, 1);
		if(pageNumber<0){
			pageNumber = 1;
		}
		if(str==null){
			Page<User> userlist = User.dao.paginate(pageNumber, 2, "select * ", " from demo_user ");
			setAttr("userlist", userlist);
		}else{
			keepPara();
			Page<User> userlist = User.dao.paginate(pageNumber, 2, "select *", " from demo_user where name like '%"+str+"%'");
			setAttr("userlist", userlist);
		}
		render("userlist.jsp");
	}
	public  void update1() {
		String id = getPara("id");
		System.out.println(id);
		User userlist = User.dao.findById(id);
		System.out.println(userlist);
		setAttr("id", id);
		setAttr("name", userlist.getStr("name"));
		setAttr("age", userlist.getStr("age"));
		render("upuser.jsp");
	}	
	public void signin(){
		String name = getPara("name");
		String password = getPara("password");
		if(!(name==null)&&!(password==null)){
			boolean  login = new LoginService().login(name, password);
			if(login==true){
				List<User> user = User.dao.find("select * from demo_user where name=?",name);
				User u = user.get(0);
				HttpSession  session = getSession();
				session.setAttribute("user", u);
				session.setMaxInactiveInterval(30 * 60);
				if(name.equals("admin")){
					redirect("/platform");
				}else{
					redirect("/");
				}
			}else{
				setAttr("errMsg", "账号或者密码错误");
				keepPara();
				render("/view/login/login.jsp");
			}
		}else{
			setAttr("errMsg", "账号密码空了");
			render("/view/login/login.jsp");
		}
	}
} 
