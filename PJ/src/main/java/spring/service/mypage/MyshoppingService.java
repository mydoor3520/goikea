package spring.service.mypage;

import java.util.List;
import java.util.Map;

import spring.entity.mypage.Cart_to_buy;
import spring.entity.mypage.Mycartlist;
import spring.entity.mypage.Myshopping;

public interface MyshoppingService {
	List<Myshopping> sList(Map<String,Object> count);

	List<Mycartlist> cList(Map<String,Object> count);

	List<Cart_to_buy> cbList(String p_num);

	void cart_del(String p_num);
}
