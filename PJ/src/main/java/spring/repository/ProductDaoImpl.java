package spring.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ProductDao")
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sqlSession;
	/*
	 * home.jsp
	 */
	
	//home.jsp ->new_arrivals
	@Override
	public List<Object> home_new() {
		return sqlSession.selectList("home_new");
	}
	
	//home.jsp -> best_seller
	@Override
	public List<Object> home_best() {
		return sqlSession.selectList("home_best");
	}
	
	/*
	 * list.jsp
	 */
	@Override
	public List<Object> select_item(Map<String,Object> parameter) {
		
		if(parameter.get("align").equals("reg_asc")){
			parameter.put("sort", "no");parameter.put("method", "asc");
		}else if(parameter.get("align").equals("reg_desc")) {
			parameter.put("sort", "no");parameter.put("method", "desc");
		}else if(parameter.get("align").equals("price_asc")) {
			parameter.put("sort", "p_price");parameter.put("method", "asc");
		}else if(parameter.get("align").equals("price_desc")) {
			parameter.put("sort", "p_price");parameter.put("method", "desc");
		}
		
		return sqlSession.selectList("select_item",parameter);
	}
	//list.jsp->category
	@Override
	public List<Object> select_category(String major) {
		return sqlSession.selectList("select_category",major);
	}
	//list.jsp->pagination
	@Override
	public int list_totalCount(Map<String, Object> parameter) {
		return sqlSession.selectOne("list_totalCount",parameter);
	}
	//list.jsp->search
	@Override
	public List<Object> search(String word) {
		return sqlSession.selectList("search",word);
	}
	/*
	 * detail.jsp
	 */
	@Override
	public List<Object> detail(int no) {
		return sqlSession.selectList("detail",no);
	}
	//detail.jsp->review
	@Override
	public List<Object> detail_review(Map<String,Object> parameter) {
		return sqlSession.selectList("detail_review",parameter);
	}
	@Override
	public int review_totalCount(int product_number) {
		return sqlSession.selectOne("review_totalCount",product_number);
	}
	//detail.jsp->qna
	@Override
	public List<Object> detail_qna(Map<String,Object> parameter) {
		return sqlSession.selectList("qna_select",parameter);
	}
	//detail.jsp->qna->insert
	@Override
	public int qna_insert(Map<String,Object> parameter) {
		int grp_max = sqlSession.selectOne("qna_grp_max");
		parameter.put("grp_max", ++grp_max);
		sqlSession.insert("qna_insert",parameter);
		return sqlSession.insert("qna_insert_reply",parameter);
	}
	@Override
	public List<Object> qna_select(Map<String, Object> parameter) {
		return sqlSession.selectList("qna_select",parameter);
	}
	@Override
	public int qna_totalCount(int product_number) { 
		return sqlSession.selectOne("qna_totalCount",product_number);
	}

	
	/*
	 * cart
	 */
	@Override
	public void cart_insert(Map<String, Object> parameter) {
		sqlSession.update("cart_insert",parameter);
	}

	@Override
	public String load_product_name(int product_number) {
		return sqlSession.selectOne("load_product_name",product_number);
	}

	
	@Override
	public int load_product_price(int product_number) {
		return sqlSession.selectOne("load_product_price",product_number);
	}

	@Override
	public int load_order_list_nextval() {
		return sqlSession.selectOne("load_order_list_nextval");
	}

	@Override
	public List<Object> pay_number_list(Map<String, Object> parameter) {
		return sqlSession.selectList("pay_number_list",parameter);
	}

	@Override
	public int pay_number_count(int pay_number) {
		return sqlSession.selectOne("pay_number_count",pay_number);
	}

	@Override
	public List<Object> order_num_list(int order_num) {
		return sqlSession.selectList("order_num_list",order_num);
	}
	
	/*
	 * BUY
	 */
	@Override
	public void buy(Map<String, Object> parameter) {
		sqlSession.update("buy",parameter);
	}

	@Override
	public String load_product_img(int product_number) {
		return sqlSession.selectOne("load_product_img",product_number);
	}

	@Override
	public List<Object> getUserNo(int pay_number) {
		return sqlSession.selectList("getUserNo",pay_number);
	}

	@Override
	public List<Object> getUserNo_order(int order_num) {
		return sqlSession.selectList("getUserNo_order",order_num);
	}

	public List<Map<String, Object>> get_order_number(int pay_group) {
		return sqlSession.selectList("get_order_number",pay_group);
	}



	


	
	
	

	

	
	
}
