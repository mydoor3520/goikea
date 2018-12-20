package spring.repository.mypage;

import java.security.NoSuchAlgorithmException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.service.mypage.EncryptService;
;

@Repository
public class HashingDao {
	@Autowired
	private EncryptService encryptService;// = SHA256Service
	
	private String salt, pw;
	
	public String genSalt(int no) {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < no; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		salt = temp.toString();
		return salt;
	}
	
	public String genRealPW(String origin, String getsalt, int loop) throws NoSuchAlgorithmException{
		for (int i = 0; i < loop; i++) {// n번의 해싱(횟수는 외부에서 알 수 없음)
			origin = encryptService.encrypt(origin + getsalt);
		}
		return origin;
	}
	
	/**
	 * 임시 비밀번호를 랜덤으로 생성하는 메소드
	 *  - int no를 받아 'no'자릿수만큼 '알파벳'으로 생성
	 * @param no (자릿수, int)
	 * @return pw (비밀번호, String)
	 */
	public String getTempPw(int no) {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < no; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		pw = temp.toString();
		System.out.println("[[[HashingDao]]] pw = "+pw);
		
		return pw;
	}

}
