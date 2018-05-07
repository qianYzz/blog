package com.blog.intercept;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

public class AuthInterceptor implements Interceptor {

	public void intercept(Invocation inv) {
		// TODO Auto-generated method stub
		System.out.println("调用AuthInterceptor");
		String path = inv.getViewPath();
		String action = inv.getActionKey();
		String controller = inv.getControllerKey();
		System.out.println(path);
		System.out.println(action);
		System.out.println(controller);
		inv.invoke();
		System.out.println("调用AuthInterceptor完成");
	}


}
