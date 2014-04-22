package com.quizcomm.util;
 
import java.util.Properties;
 


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class TriggerEmail {
	 
	public static void sendEmail(String name, String mailText, String fromEmail) {
		String mailSubject="Email from quizcomm user :"+name;
 
		final String username = "karthikarul20@gmail.com";
		final String password = "9944200629.a";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("karthikarul20@gmail.com,mo.mujah@gmail.com"));
			message.setSubject(mailSubject);
			message.setText(mailText);
 
			Transport.send(message);
 
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void sendPassResetEmail(String name, String toEmail, String newPass) {
		String mailSubject="Quizcomm account password change";
		String fromEmail ="admin@quizcom.com";
		final String username = "karthikarul20@gmail.com";
		final String password = "9944200629.a";
 
		String mailText="Your quizcomm password is changed. New password is "+newPass;
		
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(toEmail));
			message.setSubject(mailSubject);
			message.setText(mailText);
 
			Transport.send(message);
 
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
}