package com.blog.controller;


import java.io.File;
import java.util.Calendar;

import com.blog.service.ModelService;
import com.blog.util.DBHelper;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

public class ModelController extends Controller{
	private ModelService modelservice = new ModelService();
	
	public void index(){
		upfile();
	}
	public void upfile(){
		String id = DBHelper.getUUID();
		String userid="admin";
		Calendar now = Calendar.getInstance(); 
		int year = now.get(Calendar.YEAR);  
		int month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);   
		String path=year+"/"+month+"/"+day+"/"+userid+"/"+id; 
		UploadFile upFile = getFile("file", path);
		upFile.getFile().renameTo(new File(DBHelper.getUUID().toString()));
		String sfilename= upFile.getOriginalFileName();
		String type = sfilename.substring(sfilename.lastIndexOf(".") + 1);	
		modelservice.savemodelinfo(id,path,sfilename,type);
		modelservice.listmodel();
		render("/view/upfile/index.jsp");
	}
	public void ajaxupload(){
		UploadFile file = getFile();
		renderJson("imageurl","http://localhost/upload/"+file.getFileName());
	}
}
