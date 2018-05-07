package com.blog.service;

import java.io.File;
import java.util.List;
import java.util.UUID;
import com.blog.component.Model;
import com.blog.component.User;
import com.blog.util.HTDateUtil;

public class ModelService {
	public void savemodelinfo(String id , String path , String filename ,String type){
		Model m =  new Model();	
		File f = new File(path+"/"+filename);
		System.out.println(path+"/"+filename);
		m.setId(id);
		m.setUserId("admin");
		m.setPath(path+id); 
		m.setCreateTime(HTDateUtil.getNowDateTime());
		m.setFileName(filename);
		m.setType(type);
		System.out.println("文件大小是："+f.length());
		m.save();
	}
	public void listmodel(){
		List<Model> listmodel = Model.dao.find("select * from demo_model");	
		for(Model attribute : listmodel) {
			  System.out.println("11111111111"+attribute);
			}
	}
}
