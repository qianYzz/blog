package com.blog.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @ClassName: HTValidate
 * @Description:  验证类
 * @author: zhanqihang
 * @date: 2016年12月8日
 * @version V1.0
 */

public class HTValidate {
	
	/*
	 * 正则表达式：验证上传文件的后缀名
	 */
	public static final String REGEX_SUPPORT_FILE_TYPE = "prt|zsvl|svl|doc|docx|jpg|png|pdf|ppt|pptx";
	/*
	 * 正则表达式：验证上传文件的后缀名----Office文件需要调用永中的服务
	 */
	public static final String REGEX_SUPPORT_OFFICE_FILE_TYPE = "doc|docx|jpg|png|pdf|ppt|pptx";
	/*
	 * 正则表达式：是否是需要转换的Cad文件
	 */
	public static final String REGEX_FILE_TYPE = "prt|svl";
	
	/*
	 * 正则表达式：验证手机号
	 */
	public static final String REGEX_MOBILE = "^1[3|4|5|7|8]\\d{9}$";

	/*
	 * 正则表达式：验证邮箱
	 * (一个或多个数字或字母开头，紧跟着0个或多个数字、字母、"_"、"-"、或".",然后跟着一个数字或字母)
	 */
	public static final String REGEX_EMAIL = "^[a-z0-9A-Z]+([a-z0-9A-Z]|_|-|\\.)*[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";


	/**
	 * 校验手机号
	 * 
	 * @param mobile
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isMobile(String mobile) {
		return Pattern.matches(REGEX_MOBILE, mobile);
	}

	/**
	 * 校验邮箱
	 * 
	 * @param email
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isEmail(String email) {
		return Pattern.matches(REGEX_EMAIL, email);
	}
	
	

	/**
	 * @Title: fileOfficeSupportTypeMatch
	 * @Description: 校验上传文件的后缀名--Office文件需要调用永中的服务
	 * @param fileType
	 * @return
	 * @return boolean 
	 */
	public static boolean fileOfficeSupportTypeMatch(String fileType) {
		Pattern allowType = Pattern.compile(REGEX_SUPPORT_OFFICE_FILE_TYPE, Pattern.CASE_INSENSITIVE);
		Matcher matcherType = allowType.matcher(fileType);
		if (matcherType.find()) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * @Title: fileTypeMatch
	 * @Description: 校验上传文件的后缀名
	 * @param type
	 * @return
	 * @return boolean
	 */
	public static boolean fileSupportTypeMatch(String type) {
		Pattern allowType = Pattern.compile(REGEX_SUPPORT_FILE_TYPE, Pattern.CASE_INSENSITIVE);
		Matcher matcherType = allowType.matcher(type);
		if (matcherType.find()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * @Title: fileCadTypeMatch
	 * @Description: 校验上传文件的后缀名
	 * @param type
	 * @return
	 * @return boolean
	 */
	public static boolean fileCadTypeMatch(String type) {
		Pattern allowType = Pattern.compile(REGEX_FILE_TYPE, Pattern.CASE_INSENSITIVE);
		Matcher matcherType = allowType.matcher(type);
		if (matcherType.find()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 判断object是否是空
	 * 
	 * @param object
	 * @return 为空返回true,不为空返回false
	 */
	public static boolean isNull(Object object) {
		return (object == null) || ("null".equals(object.toString().trim()))
				|| ("".equals(object.toString().trim()));
	}

	/**
	 * 判断object不为空
	 * 
	 * @param object
	 * @return 不为空返回true,为空返回false
	 */
	public static boolean noNull(Object object) {
		return !isNull(object);
	}

	/**
	 * 如果为空则设为默认值
	 * 
	 * @param object
	 *            判断该对象是否为空
	 * @param defaultObject
	 *            如果object是空则默认的对象
	 * @return 不为空的一个对象
	 */
	public static Object nullToDefault(Object object, Object defaultObject) {
		if (noNull(object)) {
			return object;
		}
		return defaultObject;
	}
}
