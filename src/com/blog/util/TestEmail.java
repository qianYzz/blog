package com.blog.util;

import com.blog.component.User;

public class TestEmail {
	public static void main(String[] args) {
		User u = new User();
		u.setPhoneOrEmail("ly_yang_t@sina.com");
		Sendmail s = new Sendmail(u, "123");
		s.start();
	}
}
