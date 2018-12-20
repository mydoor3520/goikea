package spring.service.admin;

import java.util.Properties;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service("EmailService")
public class EmailServiceImpl implements EmailService {

	private JavaMailSenderImpl sender;
	
	/**
	 * 메일 설정 메소드
	 * @param username : 발송인(관리자 측) 이메일 주소
	 * @param password : 발송인(관리자 측) 이메일 비밀번호
	 */
	@Override
	public JavaMailSenderImpl mailSend(String username, String password) {
//		[1] 전송 객체 생성
		sender = new JavaMailSenderImpl();
		
//		[2] 서비스 제공자와 계정 정보를 설정
		sender.setHost("smtp.gmail.com");			//제공자에 따라 달라지는 정보
		sender.setPort(587);						//제공자에 따라 달라지는 정보
		sender.setUsername(username);				//계정정보
		sender.setPassword(password);				//비밀번호
		
//		[3] 추가 옵션 설정
		Properties options = new Properties();				//Map<String, String> 형태
		options.put("mail.transport.protocol","smtp");		//전송방법
		options.put("mail.smtp.auth","true");				//인증 활성화
		options.put("mail.debug","true");					//디버깅 활성화
		options.put("mail.smtp.starttls.enable","true");	//암호화 활성화
		
		sender.setJavaMailProperties(options);
		
		return sender;
	}

}
