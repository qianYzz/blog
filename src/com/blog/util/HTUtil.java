package com.blog.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;


/**
 * @Description:常用工具类
 * @author: zhanqihang
 * @date: 2016年11月8日
 * @version: V1.0
 */
public class HTUtil {
	

	/**
	 * @Title: getFileSHA1
	 * @Description: 计算文件的 SHA1 值
	 * @param inputFile
	 * @return: String
	 */
	public static String getFileSHA1(File inputFile) {
		// 缓冲区大小（这个可以抽出一个参数）
		int bufferSize = 1024;
		FileInputStream fileInputStream = null;
		DigestInputStream digestInputStream = null;
		try {
			// 拿到一个MD5转换器（同样，这里可以换成SHA1）
			MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
			// 使用DigestInputStream
			fileInputStream = new FileInputStream(inputFile);
			digestInputStream = new DigestInputStream(fileInputStream, messageDigest);
			// read的过程中进行MD5处理，直到读完文件
			byte[] buffer = new byte[bufferSize];
			while (digestInputStream.read(buffer) > 0) {
				// 获取最终的MessageDigest
				messageDigest = digestInputStream.getMessageDigest();
			}
			// 拿到结果，也是字节数组，包含16个元素
			byte[] resultByteArray = messageDigest.digest();
			// 同样，把字节数组转换成字符串
			return byteArrayToHex(resultByteArray);
		} catch (Exception e) {
			return null;
		} finally {
			try {
				digestInputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @Title: encode2bytes
	 * @Description: 将源字符串使用MD5加密为字节数组
	 * @param source
	 * @return: byte[]
	 */
	public static byte[] encode2bytes(String source) {
		byte[] result = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.reset();
			md.update(source.getBytes("UTF-8"));
			result = md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * @Title: getFileMD5
	 * @Description: 计算文件的 MD5 值
	 * @param inputFile
	 * @return: String
	 */
	public static String getFileMD5(File inputFile) {
		// 缓冲区大小（这个可以抽出一个参数）
		int bufferSize = 1024;
		FileInputStream fileInputStream = null;
		DigestInputStream digestInputStream = null;
		try {
			// 拿到一个MD5转换器（同样，这里可以换成SHA1）
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			// 使用DigestInputStream
			fileInputStream = new FileInputStream(inputFile);
			digestInputStream = new DigestInputStream(fileInputStream, messageDigest);
			// read的过程中进行MD5处理，直到读完文件
			byte[] buffer = new byte[bufferSize];
			while (digestInputStream.read(buffer) > 0) {
				// 获取最终的MessageDigest
				messageDigest = digestInputStream.getMessageDigest();
			}
			// 拿到结果，也是字节数组，包含16个元素
			byte[] resultByteArray = messageDigest.digest();
			// 同样，把字节数组转换成字符串
			return byteArrayToHex(resultByteArray);
		} catch (Exception e) {
			return null;
		} finally {
			try {
				digestInputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 下面这个函数用于将字节数组换成成16进制的字符串
	public static String byteArrayToHex(byte[] byteArray) {
		// 首先初始化一个字符数组，用来存放每个16进制字符
		char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
		// new一个字符数组，这个就是用来组成结果字符串的（解释一下：一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方））
		char[] resultCharArray = new char[byteArray.length * 2];
		// 遍历字节数组，通过位运算（位运算效率高），转换成字符放到字符数组中去
		int index = 0;
		for (byte b : byteArray) {
			resultCharArray[index++] = hexDigits[b >>> 4 & 0xf];
			resultCharArray[index++] = hexDigits[b & 0xf];
		}
		// 字符数组组合成字符串返回
		return new String(resultCharArray);
	}

	/**
	 * @Title: downloadFile
	 * @Description: 下载远程文件并保存到本地
	 * @param url
	 *            远程文件路径
	 * @param filePath
	 *            本地文件路径
	 * @throws IOException
	 * @return: String
	 */
	public static File downloadFile(String url, String saveFilePath) throws IOException {
		URL theURL;
		URLConnection con;
		File saveFile = null;
		try {
			theURL = new URL(url);
			con = theURL.openConnection();
			String urlPath = con.getURL().getFile();
			String fileName = urlPath.substring(urlPath.lastIndexOf("/") + 1);
			if (fileName != null) {
				byte[] buffer = new byte[4 * 1024];
				int read;
				String path = saveFilePath + "/" + URLDecoder.decode(fileName, "UTF-8");
				File fileFolder = new File(saveFilePath);
				if (!fileFolder.exists()) {
					fileFolder.mkdirs();
				}
				InputStream in = con.getInputStream();
				saveFile = new File(path);
				FileOutputStream os = new FileOutputStream(saveFile);
				while ((read = in.read(buffer)) > 0) {
					os.write(buffer, 0, read);
				}
				os.close();
				in.close();
			}
		} catch (IOException e) {
			throw e;
		} 
		return saveFile;
	}
	
	/**
	 * @Title: sendGet
	 * @Description: 访问带参数的url并返回值，get方式
	 * @param url
	 * @return: String
	 */
	public static String sendGet(String url) {
		String result = "";
		try {
			String urlName = url;
			URL U = new URL(urlName);
			URLConnection connection = U.openConnection();
			connection.connect();
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有结果！" + e);
		}
		return result;
	}

	/**
	 * @Title: sendPost
	 * @Description: 访问带参数的url并返回值，post方式
	 * @param url
	 * @param param
	 * @return String
	 */
	public static String sendPost(String url, String param) {
		String result = "";
		try {
			URL httpurl = new URL(url);
			HttpURLConnection httpConn = (HttpURLConnection) httpurl.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setDoInput(true);
			PrintWriter out = new PrintWriter(httpConn.getOutputStream());
			out.print(param);
			out.flush();
			out.close();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有结果！" + e);
		}
		return result;
	}
	
	/** 
	 * @Title: getIp 
	 * @Description: 获取ip
	 * @param request
	 * @return String
	 */
	public static String getIp(HttpServletRequest request){
	    String ip = request.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = request.getRemoteAddr();
	    }
	    if(ip.length()>15){
	    	return "未知";
	    }else{
	    	return ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	    }
	    
	}

}
