package spring.service.admin;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("VisitCountDAO")
public class VisitCountDAOImpl implements VisitCountDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertVisitor(Map<String, Object> map) {
		sqlSession.insert("insertVisitor",map);
	}

	@Override
	public int countSession(String VISIT_SESSION) {
		return sqlSession.selectOne("countSession",VISIT_SESSION);
	}

	@Override
	public int countIP(String VISIT_IP) {
		return sqlSession.selectOne("countIP",VISIT_IP);
	}

	@Override
	public int countAll_today() {
		return sqlSession.selectOne("countAll_today");
	}

	@Override
	public int countAll_all() {
		return sqlSession.selectOne("countAll_all");
	}
	
	
}
