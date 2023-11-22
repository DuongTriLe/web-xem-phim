package edu.poly.comman;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import edu.poly.domain.Email;

public class EmailUtils {
	
	public static void send(Email email) {
		Properties props = new Properties();
		  props.put("mail.smtp.host", "smtp.gmail.com");
		  props.put("mail.smtp.port", "587");
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");

		  // Tạo đối tượng Session để gửi email
		  Session session = Session.getInstance(props, new Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		      // Nhập thông tin tài khoản email của bạn
		      return new PasswordAuthentication(email.getFrom(), email.getFromPassword());
		    }
		  });
		  
		  try {
			    // Tạo đối tượng MimeMessage để định dạng email
			    MimeMessage mimeMessage = new MimeMessage(session);
			    mimeMessage.setFrom(new InternetAddress(email.getFrom()));
			    mimeMessage.setRecipients(Message.RecipientType.TO,  InternetAddress.parse(email.getTo()));
			    mimeMessage.setSubject(email.getSubject());
			    mimeMessage.setText(email.getContent());

			    // Gửi email
			    Transport.send(mimeMessage);

			   
			  } catch (MessagingException ex) {
			    ex.printStackTrace();
			  }
			

	}
}
