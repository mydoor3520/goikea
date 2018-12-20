package spring.repository.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.entity.mypage.User;

@Repository
public class LoginDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public Boolean login_result(Map<String, Object> map) {
		//select로 결과값을 받음
		List<User> trylogin = sqlSession.selectList("trylogin", map);
		
		//결과 값이 있는지 여부에 따라서 boolean을 결정
		if(trylogin.size()==0)return false;
		else return true;
	}
	
	
}
