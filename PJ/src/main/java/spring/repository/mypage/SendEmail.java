package spring.repository.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Repository;

import spring.service.admin.EmailService;

@Repository
public class SendEmail {
	@Autowired
	private EmailService emailService;
	
	public void emailSend(String tempPw, String mailAddress, String username, String password) {
		String setfrom = "None";         
	    String tomail  = mailAddress;     						// 받는 사람 이메일
	    String title   = "IKEA 임시 비밀번호 발급 안내";					// 제목
	    String content = "고객님의 새 비밀번호는 ["+tempPw+"]입니다.";    // 내용
	    System.out.println("emailSend, 임시 비밀번호 = "+tempPw+", 고객의 이메일 주소 = "+tomail);
	   
//		sender를 이용하여 간단한 텍스트 메일을 전송
//		작성할 항목 : 대상, 참조, 숨은참조, 제목, 내용, 보낸이, ......
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setSubject(title);		//제목
		mail.setText(content);		//내용
		mail.setFrom(setfrom);		//보낸이
		String[] to = {tomail};		//발송 대상
		mail.setTo(to);
		//참조 : setCc(), 숨은참조 : setBcc()
		
		JavaMailSenderImpl sender = emailService.mailSend(username, password);
		sender.send(mail);
	}
}
