package spring.service.mypage;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Myshopping_total{

	@Autowired
	SqlSession sqlSession;
	public int list_totalCount(String user_num) {
		System.out.println(user_num);
		return sqlSession.selectOne("shoppinglist_totalCount", user_num);
	}
	
	public int cartlist_totalCount(String user_num) {
		System.out.println(user_num);
		return sqlSession.selectOne("cartlist_totalCount", user_num);
	}

}
