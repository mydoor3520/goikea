package spring.service.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Productorder_total {

	@Autowired
	SqlSession sqlSession;
	
	public int list_totalCount() {
	
		return sqlSession.selectOne("productorderlist_totalCount");
	}
}
