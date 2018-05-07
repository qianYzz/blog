package com.blog.service;

import java.util.List;

import com.blog.component.Comment;
import com.blog.util.DBHelper;
import com.blog.util.HTDateUtil;
import com.jfinal.core.Controller;

public class CommentService extends Controller{
	public static Boolean addComment(String userid,String comments,String blogid){
		Comment c = new Comment();
		c.setId(DBHelper.getUUID());
		c.setUserid(userid);
		c.setBlogid(blogid);
		c.setComments(comments);
		c.setCreateTime(HTDateUtil.getNowDateTime());
		Boolean b = c.save();	
		return b;
	}
	public static List<Comment> queryCom(){
		Comment c = new Comment();
		String sql = "";
		List<Comment> clist = c.find(sql );
		return clist;
	}
}
