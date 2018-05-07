package com.blog.util;

import java.util.UUID;

/**  
 * @Description:数据库帮助类
 * @author: baojun
 * @date:2016年03月15日
 * @version: V1.0 
 * @Copyright: All Rights Reserved. Copyright (C) 2013 HOTEAMSOFT, Ltd
 */
public class DBHelper {
	
	/**
	 * 得到一个UUID
	 * @return String 
	 * @throws
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}
	
}

