package spring.service.mypage;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Service;

@Service("EncryptService")
public class SHA256Service implements EncryptService{

	@Override
	public String encrypt(String origin) throws NoSuchAlgorithmException {
//		암호화 알고리즘 인스턴스 생성
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		
//		인스턴스에 origin을 byte 형태로 설정
		digest.update(origin.getBytes(/*MS949*/));
		
//		변환된 데이터를 받아보자
		byte[] data = digest.digest();
		
//		글자별로 변환한 뒤에 결과로 합산
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i < data.length; i++) {
			int value = (data[i] & 0xff) + 0x100;
			buffer.append(Integer.toString(value, 16).substring(1));
		}
		
		return buffer.toString().toUpperCase();
	}

}
