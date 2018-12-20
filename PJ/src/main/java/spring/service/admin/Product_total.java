package spring.service.admin;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Product_total {

	@Autowired
	SqlSession sqlSession;
	
	public int list_totalCount() {
	
		return sqlSession.selectOne("product_totalCount");
	}
	

	public int listSelect_totalCount(Map<String, Object> searchmap) {
		System.out.println("Product_total => searchmap.get(\"searchOption\") = "+searchmap.get("searchOption"));
		System.out.println("Product_total => sqlSession.selectOne(\"productSearch_totalCount\", searchmap) = "
																			+sqlSession.selectOne("productSearch_totalCount", searchmap));
		return sqlSession.selectOne("productSearch_totalCount", searchmap);
	}

	
	public int listSelectAll_totalCount(Map<String, Object> searchmap) {
		System.out.println("Product_total => searchmap.get(\"keyword\") = "+searchmap.get("keyword"));
		System.out.println("Product_total => sqlSession.selectOne(\"productSearch_totalCount\", searchmap) = "
																			+sqlSession.selectOne("productSearchOptionAll_totalCount", searchmap));
		return sqlSession.selectOne("productSearchOptionAll_totalCount", searchmap);
	}
}
