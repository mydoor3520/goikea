package spring.repository.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.entity.mypage.User;

@Repository
public class UserDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public User get_user_byId(String id) {
		return sqlSession.selectOne("login", id);
	}
	public User get_user_byNo(String no) {
		return sqlSession.selectOne("getuser", no);
	}
		
	public int chk_id_email(User user) {
		return sqlSession.selectOne("chk_id_email", user);
	}
}
