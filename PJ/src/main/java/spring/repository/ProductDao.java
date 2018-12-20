package spring.repository;

import java.util.List;
import java.util.Map;

public interface ProductDao {
	List<Object> home_new();
	List<Object> home_best();
	List<Object> select_category(String first);
	List<Object> select_item(Map<String,Object> parameter);
	List<Object> detail(int no);
	List<Object> detail_review(Map<String,Object> parameter);
	List<Object> detail_qna(Map<String,Object> parameter);
	int list_totalCount(Map<String, Object> parameter);
	int review_totalCount(int product_number);
	int qna_totalCount(int product_number);
	int qna_insert(Map<String, Object> parameter);
	List<Object> qna_select(Map<String,Object> parameter);
	void cart_insert(Map<String,Object> parameter);
	String load_product_name(int product_number);
	int load_product_price(int product_number);
	int load_order_list_nextval();
	List<Object> pay_number_list(Map<String,Object> parameter);
	int pay_number_count(int pay_number);
	List<Object> order_num_list(int order_num);
	void buy(Map<String, Object> parameter);
	String load_product_img(int product_number);
	List<Object> getUserNo(int pay_number);
	List<Object> getUserNo_order(int order_num);
	List<Object> search(String word);
}
