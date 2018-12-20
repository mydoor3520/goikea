package spring.service.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.mypage.Cart_to_buy;
import spring.entity.mypage.Mycartlist;
import spring.entity.mypage.Myshopping;

@Service("MyshoppingService")
public class MyshoppingServiceImpl implements MyshoppingService{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Myshopping> sList(Map<String,Object> count) {
		return sqlSession.selectList("shopping_list", count);
	}

	@Override
	public List<Mycartlist> cList(Map<String, Object> count) {
		System.out.println(count);
		return sqlSession.selectList("cart_list", count);
	}

	@Override
	public List<Cart_to_buy> cbList(String p_num) {
		return sqlSession.selectList("cart_to_buy", p_num);
	}

	@Override
	public void cart_del(String order_num) {
		sqlSession.delete("cart_del", order_num);
	}

}