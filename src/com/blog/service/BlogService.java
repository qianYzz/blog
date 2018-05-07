package com.blog.service;

import java.util.List;

import com.blog.component.Blog;
import com.blog.component.User;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;

public class BlogService extends Controller{
	public static Page<Blog> queryall(int pageNumber,int pageSize ,String str){
			String selectsql = "SELECT b.*,c.genre ";
			StringBuffer fromsql = new StringBuffer();
			if(str==null||str==""){
				fromsql.append(" FROM demo_blog b LEFT JOIN demo_class c ON  b.classid = c.id ORDER BY createTime DESC ");
			}else{
				fromsql.append(" FROM demo_blog b LEFT JOIN demo_class c ON  b.classid = c.id where title like '%"+str+"%' order by createTime desc");
			}
			Page<Blog> userlist = Blog.dao.paginate(pageNumber, pageSize, selectsql,fromsql.toString());
			return userlist;
	}
	
	public static Page<Blog> queryfromcache(int pageNumber,int pageSize ,String str){
		Page<Blog> userlist = CacheKit.get("blog", "userlist");
		return userlist;
}
	public static List<Blog> queryRunk(){
		String selectsql = "select * from demo_blog order by viewcount desc limit 6";
		List<Blog> userlist = Blog.dao.find(selectsql);
		return userlist;
	}
	public static Blog queryById(String id){
		Blog b = new Blog();
		return b.findById(id);
	}
	public static List<Blog> queryTop(){
		String selectsql = "select * from demo_blog where top ='1'";
		Blog b = new Blog();
		return b.find(selectsql);
	}
	public static int  queryTopCount(){
		String selectsql = "select * from demo_blog where top ='1'";
		Blog b = new Blog();
		return b.find(selectsql).size();
	}
	public static List<User> queryBlogComById(String id){
		User b = new User();
		String selectsql = "SELECT   c.comments,u.name,c.createTime,u.id as userid,b.id as blogid  FROM demo_comments c  "
							+ "LEFT JOIN demo_blog b  ON c.blogid = b.id "
							+ "LEFT JOIN demo_user u ON c.userid=u.id "
							+ "WHERE b.id=?";		
		return b.find(selectsql,id);
	}
}