package com.blog.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.blog.component.User;

public class Sendmail extends Thread {
	// 用于给用户发送邮件的邮箱
	private String from = "939059425@qq.com";
	// 邮箱的用户名
	private String username = "939059425@qq.com";
	// 邮箱的密码
	private String password = "mijfspspeisbbbdd";
	// 发送邮件的服务器地址
	private String host = "smtp.qq.com";

	// 获取验证码
	private String validateCode = "";
	private User user;

	public Sendmail(User user, String validateCode) {
		this.user = user;
		this.validateCode = validateCode;
	}

	/*
	 * 重写run方法的实现，在run方法中发送邮件给指定的用户
	 * 
	 * @see java.lang.Thread#run()
	 */
	@Override
	public void run() {
		try {
			Properties prop = new Properties();
			prop.setProperty("mail.host", host);
			prop.setProperty("mail.transport.protocol", "smtp");
			prop.setProperty("mail.smtp.auth", "true");
			Session session = Session.getInstance(prop);
			session.setDebug(true);
			Transport ts = session.getTransport();
			ts.connect(host, username, password);
			Message message = createEmail(session, user, validateCode);
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @Method: createEmail
	 * @Description: 创建要发送的邮件
	 * @Anthor:孤傲苍狼
	 *
	 * @param session
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public Message createEmail(Session session, User user, String info)
			throws Exception {

		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(from));
		message.setRecipient(Message.RecipientType.TO,
				new InternetAddress(user.getPhoneOrEmail()));
		message.setSubject("用户注册邮件");
		message.setContent(info.toString(), "text/html;charset=UTF-8");
		message.saveChanges();
		return message;
	}
}