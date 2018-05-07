package com.blog.service;

import com.blog.component.Blog;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheName;
import com.jfinal.plugin.ehcache.EvictInterceptor;

public class BlogCacheService extends Controller{
	@Before(EvictInterceptor.class)
	@CacheName("blogList")
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
}
