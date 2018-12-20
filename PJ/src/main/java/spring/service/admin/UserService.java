package spring.service.admin;

import java.util.List;
import java.util.Map;

import spring.entity.mypage.User;

public interface UserService {
	List<User> list(Map<String,Object> count);					//회원 전체 목록 조회
	List<User> listSearch(Map<String, Object> count);			//특정 항목에서 특정 검색어로 조회
	List<User> listSearchOptionAll(Map<String, Object> count);	//전체 항목에서 특정 검색어로 조회
	List<User> userInfo(int no, List<User> ulist);				//회원 상세 정보 조회
	void editUser(User user);									//회원 정보 수정
	void deleteUser(int no);									//회원 삭제
	void changePw(Map<String, Object> map);						//회원 비번 변경
}
