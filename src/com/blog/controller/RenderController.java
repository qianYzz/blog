package com.blog.controller;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;

public class RenderController extends Controller{
	public void index(){
		render("index.jsp");
	}
	public void redirect(){
		setAttr("name", "123");
		renderJson();
	}
	public void jsontest(){
		JSONObject resultJson = new JSONObject();
		resultJson.put("name", "小名");
		renderJson(resultJson);
	}
}