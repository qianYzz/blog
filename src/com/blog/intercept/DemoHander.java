package com.blog.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jfinal.handler.Handler;

public class DemoHander extends Handler{

	@Override
	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		// TODO Auto-generated method stub
		if(target.lastIndexOf(".html")!=-1){
			target = target.substring(0,target.indexOf(".html"));
		}
		nextHandler.handle(target, request, response, isHandled);
	}

}
