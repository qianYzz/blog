package com.blog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.blog.component.Blog;
import com.blog.component.User;
import com.blog.service.BlogService;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;

public class MainContollor extends Controller {
	@Before(EvictInterceptor.class)
	@CacheName("blog")
	public void index(){
		String str = getPara("keyboard");
		int pageNumber = getParaToInt(0, 1);
		Page<Blog> userlist =BlogService.queryfromcache(pageNumber, 6, str);
		System.out.println(userlist);
		if(userlist==null){
			userlist = BlogService.queryall(pageNumber, 6, str);
			CacheKit.put("blog", "userlist", userlist);
		}
		List<Blog> runklist = BlogService.queryRunk();
		List<Blog> toplist = BlogService.queryTop();
		setAttr("userlist", userlist);
		setAttr("runklist", runklist);
		setAttr("toplist", toplist);
		for(Blog attr : userlist.getList()) {
			  String path = attr.getCoverimagpath()+"/"+attr.getImagename();
			  setAttr("path", path);
			}
		render("main/main.jsp");
	}
	public void register(){
		this.render("user/reguser/register.jsp");
	}
	public void delSession(){
		HttpSession  session = getSession();
		session.removeAttribute("user");
		redirect("/user/list");
	}
	public void platform(){
		String str = getPara("searchstr");
		int pageNumber = getParaToInt(0, 1);
		Page<Blog> userlist = BlogService.queryall(pageNumber, 5, str);
		setAttr("userlist", userlist);
		render("admin/index.jsp");
	}
	public void platformform(){
		this.render("admin/form.jsp");
	}
	public void viewblog(){
		String id = getPara("id");
		Blog blog = BlogService.queryById(id);
		List<User> commentlist = BlogService.queryBlogComById(id);
		List<Blog> runklist = BlogService.queryRunk();
		setAttr("counts", commentlist.size());
		setAttr("blog", blog);
		setAttr("runklist", runklist);
		setAttr("commentlist", commentlist);
		render("main/viewblog.jsp");
	}
	public void about(){
		render("main/about.jsp");
	}
	public void counts(){
		int count = BlogService.queryTopCount();
		renderText(Integer.toString(count));
	}
}