package spring.service.admin;

import org.springframework.mail.javamail.JavaMailSenderImpl;

public interface EmailService {

	JavaMailSenderImpl mailSend(String username, String password);
	
}
