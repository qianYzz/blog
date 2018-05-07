package com.blog.controller;

import java.util.List;

import com.blog.component.Blog;
import com.blog.component.User;
import com.blog.service.BlogService;
import com.blog.service.CommentService;
import com.jfinal.core.Controller;

public class CommentController extends Controller{
	public void index(){
		
	}
	public void addComment(){
		Boolean b = false;
		String comments = null;
		String type = getPara("type");
		System.out.println("type--------------------:"+type);
		String userid = getPara("userid");
		String blogid = getPara("blogid");
		comments = getPara("comments");
		String fromuserid = getPara("fromuserid");
		if(type=="0"){
			 int index1 = comments.lastIndexOf(":");
			 comments = comments.substring(index1);	
			 System.out.println("comments:----------------------:"+comments);
			 b = CommentService.addComment(userid, comments, fromuserid);
		}else{
			 b = CommentService.addComment(userid, comments, blogid);
		}
		if(b==true){
			setAttr("id", blogid);
			redirect("/viewblog?id="+blogid+"");
		}else{
			renderText("服务器异常稍后重试,或者联系网站管理员");
		}
	}
	public void reply(){
		String userid = getPara("userid");
		User u = User.dao.findById(userid);
		String id = getPara("id");
		Blog blog = BlogService.queryById(id);
		List<User> commentlist = BlogService.queryBlogComById(id);
		List<Blog> runklist = BlogService.queryRunk();
		System.out.println(commentlist);
		System.out.println(commentlist.size());
		setAttr("counts", commentlist.size());
		setAttr("blog", blog);
		setAttr("runklist", runklist);
		setAttr("commentlist", commentlist);
		setAttr("username", "@"+u.getName()+":");
		setAttr("type", "0");
		render("/view/main/viewblog.jsp");
	}
}
