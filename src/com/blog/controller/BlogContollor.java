package com.blog.controller;

import java.util.Calendar;
import java.util.Date;

import com.blog.component.Blog;
import com.blog.service.BlogService;
import com.blog.util.DBHelper;
import com.blog.util.HTDateUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;

public class BlogContollor extends Controller{
	public void index(){
		add();
	}
	public void add(){
		//String selectError = getPara("selectError");
		String id = DBHelper.getUUID();
		Calendar now = Calendar.getInstance(); 
		int year = now.get(Calendar.YEAR);  
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);   
		String path=year+"/"+month+"/"+day+"/"+id; 
		UploadFile upFile = getFile("fileInput", path);
		String title = getPara("title");
		String content = getPara("content");
		String brief = getPara("ckeditor_standard");
		String classid = getPara("selectError");
		String top = getPara("checkbox");
		System.out.println("000000000000000000000:"+top);
		String sfilename= "";
		String type = ""; 
		Blog b = new Blog();
		if(upFile!=null||top!=null){
			sfilename= upFile.getOriginalFileName();
			type = sfilename.substring(sfilename.lastIndexOf(".") + 1);
			b.setImagename(path+"/"+sfilename);
			b.setTop(top);
		}else{
			b.setImagename("view/picture/e792c4fd2bc0873ac68ef94b83ad2429.jpg");
			
		}
		b.setId(id);
		b.setTitle(title);
		b.setContent(content);
		b.setCoverimagpath(path);		
		b.setCreateTime(HTDateUtil.getNowDateTime());
		b.setBrief(brief);
		b.setClassid(classid);
		b.save();
		query();		
	}
	public void delete(){
		String id = getPara("id");
		Db.deleteById("demo_blog", id);
		query();
	}
	public void updata(){	
		Calendar now = Calendar.getInstance(); 
		int year = now.get(Calendar.YEAR);  
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH); 
		String path=year+"/"+month+"/"+day+"/"+DBHelper.getUUID(); 
		UploadFile upFile = getFile("fileInput", path);
		String id= getPara("id");
		String title = getPara("title");
		String content = getPara("content");
		String brief = getPara("ckeditor_standard");
		String classid = getPara("selectError");
		String top = getPara("checkbox");
		System.out.println("000000000000000000000:"+top);
		String sfilename= "";
		String type = ""; 
		Blog b = new Blog();
		if(upFile!=null||top!=null){
			sfilename= upFile.getOriginalFileName();
			type = sfilename.substring(sfilename.lastIndexOf(".") + 1);
			b.setImagename(path+"/"+sfilename);
			b.setTop(top);
		}else{
			b.setImagename("view/picture/e792c4fd2bc0873ac68ef94b83ad2429.jpg");
			
		}
		b.setId(id);
		b.setTitle(title);
		b.setContent(content);
		b.setCoverimagpath(path);		
		b.setCreateTime(HTDateUtil.getNowDateTime());
		b.setBrief(brief);
		b.setClassid(classid);
		b.update();
		query();			
	}
	public void findedit(){
		String id = getPara("id");
		Blog b = BlogService.queryById(id);
		setAttr("b", b);
		render("edit.jsp");
	}
	public void query(){
		String str = getPara("searchstr");
		int pageNumber = getParaToInt(0, 1);
		Page<Blog> userlist = BlogService.queryall(pageNumber, 5, str);
		setAttr("userlist", userlist);
		render("index.jsp");
	}
}
