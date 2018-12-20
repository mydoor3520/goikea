package spring.service.admin;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class User_total {

	@Autowired
	SqlSession sqlSession;

	//전체 목록 검색
	public int list_totalCount() {
	
		return sqlSession.selectOne("user_totalCount");
	}
	
	//특정 항목에서 검색어를 통해 검색
	public int listSelect_totalCount(Map<String, Object> searchmap) {
		System.out.println("User_total => searchmap.get(\"searchOption\") = "+searchmap.get("searchOption"));
		System.out.println("User_total => sqlSession.selectOne(\"userSearch_totalCount\", searchmap) = "
																			+sqlSession.selectOne("userSearch_totalCount", searchmap));
		return sqlSession.selectOne("userSearch_totalCount", searchmap);
	}

	//전체 항목에서 검색어를 통해 검색
	public int listSelectAll_totalCount(Map<String, Object> searchmap) {
		System.out.println("User_total => searchmap.get(\"keyword\") = "+searchmap.get("keyword"));
		System.out.println("User_total => sqlSession.selectOne(\"userSearch_totalCount\", searchmap) = "
																			+sqlSession.selectOne("userSearchOptionAll_totalCount", searchmap));
		return sqlSession.selectOne("userSearchOptionAll_totalCount", searchmap);
	}
}
