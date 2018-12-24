package spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.entity.mypage.User;
import spring.repository.ProductDaoImpl;
import spring.repository.mypage.UserDao;
import spring.service.admin.VisitCountDAO;
import spring.service.mypage.Paging;

@Controller
public class Shopping_Controller {
	
	@Autowired
	ProductDaoImpl productDaoImpl;
	@Autowired
	VisitCountDAO visitCountDAO;
	
	@Autowired
	Paging paging;
	@Autowired
	private UserDao udao;
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("404")
	public String PageNotFound() {
		return "error/404";
	}
	@RequestMapping("500")
	public String BadRequest() {
		return "error/500";
	}
	
	@RequestMapping(value="customer/buy", method=RequestMethod.POST)
	public String buy(@RequestParam Map<String, Object> map,Model model) {
		System.out.println(map);
		
		Map<String, Object> parameter = new HashMap<>();
		
		Iterator<String> keySetIterator = map.keySet().iterator();
		
		while(keySetIterator.hasNext()) {
			String key = keySetIterator.next();
			parameter.put(key, map.get(key));
		}
		
		String Array[] = null;
		if(!map.get("pay_number").equals("null")) {
			Array = map.get("pay_number").toString().split(",");
			parameter.put("EachOrGroup", "pay_number");
		}else if(!map.get("order_num").equals("null")) {
			Array = map.get("order_num").toString().split(",");
			parameter.put("EachOrGroup", "order_num");
		}
		
		String order_num = "";
		for(int i=0;i<Array.length;i++) {
			parameter.put("EachOrGroup_value", Integer.parseInt(Array[i].toString()));
			productDaoImpl.buy(parameter);
			
			order_num=(order_num.equals(""))?Array[i].toString():order_num+","+Array[i].toString();
		}
		
		List<Object> list = new ArrayList<>();
		
		String Array2[] = order_num.split(",");
		for(int i=0;i<Array.length;i++) {
			list.add(productDaoImpl.order_num_list(Integer.parseInt(Array2[i].toString())));
		}
		model.addAttribute("buy_list",list);
		
		return "customer/pay_complete";
	}
	
	@RequestMapping("customer/cart")
	@ResponseBody
	public String cart(@RequestParam Map<String, Object> map) {
		Map<String, Object> parameter = new HashMap<>();
		
		Iterator<String> keySetIterator = map.keySet().iterator();
		
		int pay_group = productDaoImpl.load_order_list_nextval()+1;
		String user_no = session.getAttribute("user_no").toString();
		User user = udao.get_user_byNo(user_no);
		
		String key = keySetIterator.next();  keySetIterator.next();
		while(keySetIterator.hasNext()) {
			key = keySetIterator.next();
			
			parameter.put("pay_group", pay_group);
			parameter.put("p_number", Integer.parseInt(map.get("no").toString()));
			parameter.put("p_name", productDaoImpl.load_product_name(Integer.parseInt(map.get("no").toString())));
			parameter.put("p_option", key);
			parameter.put("p_quantity", map.get(key));
			parameter.put("p_total", productDaoImpl.load_product_price(Integer.parseInt(map.get("no").toString()))*Integer.parseInt(map.get(key).toString()));
			parameter.put("user_number", session.getAttribute("user_no"));
			parameter.put("user_name", user.getName());
			parameter.put("user_post", user.getPost());
			parameter.put("user_addr1", user.getAddr1());
			parameter.put("user_addr2", user.getAddr2());
			parameter.put("user_phone", user.getPhone());			
			parameter.put("img",productDaoImpl.load_product_img(Integer.parseInt(map.get("no").toString())));
			
			productDaoImpl.cart_insert(parameter);
			System.out.println(parameter);
		}
			String order_num= "";
			List<Map<String, Object>> list = productDaoImpl.get_order_number(pay_group);
			for(int i = 0 ; i < list.size(); i++) {
				order_num += list.get(i).get("ORDER_NUM");
				if(i < list.size()-1) {
					order_num += ",";
				}
			}
		return order_num;
	}
	
	@RequestMapping("customer/pay_ready")
	public String pay_ready(@RequestParam(value="pay_number", required=false) String pay_number,
							@RequestParam(value="order_num", required=false) String order_num,
							Model model) {
		
		String user_no = session.getAttribute("user_no").toString();
		User user = udao.get_user_byNo(user_no);
		model.addAttribute("user",user);
		List<Object> list = new ArrayList<>();
		Map<String,Object> parameter = new HashMap<>();
		
		if(pay_number != null) {
			String Array[] = pay_number.split(",");
			
			for(int i=0;i<Array.length;i++) {
				
				int pay_number_count = productDaoImpl.pay_number_count(Integer.parseInt(Array[i].toString()));
				
				String get_user_no = productDaoImpl.getUserNo(Integer.parseInt(Array[i].toString())).get(0).toString();
				
				for(int k=0;k<=pay_number_count-1;k++) {
					System.out.println(get_user_no+"/"+user_no);
					if(!get_user_no.equals(user_no)){
						return "error/404";
					}
					parameter.put("pay_number", Integer.parseInt(Array[i].toString()));
					parameter.put("rownum", k);
					list.add(productDaoImpl.pay_number_list(parameter));
					
					parameter.clear();
				}
			}
			model.addAttribute("order_list",list);
		}else if(order_num != null) {
			System.out.println(order_num);
			String Array[] = order_num.split(",");
			
			System.out.println(Array.length);
			
			for(int i=0;i<Array.length;i++) {
				System.out.println(i);
				
				String get_user_no = productDaoImpl.getUserNo_order(Integer.parseInt(Array[i].toString())).get(0).toString();
				
				System.out.println(get_user_no);
				if(!user_no.equals(get_user_no)) {
					return "error/404";
				}
				System.out.println(Array[i].toString());
				list.add(productDaoImpl.order_num_list(Integer.parseInt(Array[i].toString())));
				System.out.println(list);
			}
		}
		model.addAttribute("order_list",list);
		
		return "customer/pay_ready";
		
	}
	@RequestMapping("home")
	public String home(Model model) {
		model.addAttribute("new_arrivals",productDaoImpl.home_new());
		return "customer/home";
	}
	
	@RequestMapping(value="qna_insert", method=RequestMethod.POST)
	@ResponseBody
	public void qna_insert(
			@RequestParam int product_number,
			@RequestParam String writer,
			@RequestParam String content) {
		
		Map<String, Object> parameter = new HashMap<>();
		
		parameter.put("product_number",product_number);
		parameter.put("writer", writer);
		parameter.put("content", content);
		
		productDaoImpl.qna_insert(parameter);
	}
	
	@RequestMapping("list")
	public String furniture(
			@RequestParam(value="major",required=true) String major,
			@RequestParam(value="sub",  required=true) String sub,
			@RequestParam(value="sort", required=false, defaultValue="reg_desc")String sort,
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			Model model) {
		
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("major", major); parameter.put("sub", sub);
		
		Map<String,Object> count = paging.get_listPage(parameter, 25, 5, page);
		
		parameter.put("endArticle", count.get("endArticle"));
		parameter.put("startArticle", count.get("startArticle"));
		parameter.put("align", sort);
		/*
		 * [model]==================================================================
		 * 
		 * 리스트와 카테고리를 불러오기 위한 model
		 */
		model.addAttribute("select_item",productDaoImpl.select_item(parameter));
		model.addAttribute("select_category",productDaoImpl.select_category(major));
		
		/*
		 * 페이징 처리를 위한 model
		 */
		model.addAttribute("major",major);
		model.addAttribute("sub",sub);
		model.addAttribute("sort",sort);
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("listCount",count.get("listCount"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));

		return "customer/list";
	}

	@RequestMapping("search")
	public String search(
			@RequestParam(value="word", required=true) String word,
			Model model) {
		
		model.addAttribute("search_list", productDaoImpl.search(word));
		return "customer/search";
	}
	@RequestMapping("detail")
	public String detail(
			@RequestParam int no,
			@RequestParam(value="review_page", required=false, defaultValue="1") int review_page,
			@RequestParam(value="qna_page", required=false, defaultValue="1") int qna_page,
			Model model) {
		
		/*
		 * 상품 detail 처리를 위한 model
		 */
		System.out.println(productDaoImpl.detail(no));
		model.addAttribute("detail",productDaoImpl.detail(no));
		/*
		 * review 처리를 위한 model
		 */
		Map<String,Object> review = paging.get_reviewPage(no,review_page,5,5);
		model.addAttribute("review_product_number",no);
		model.addAttribute("review_page",review.get("review_page"));
		model.addAttribute("review_startPage",review.get("review_startPage"));
		model.addAttribute("review_endPage",review.get("review_endPage"));
		model.addAttribute("review_totalPage",review.get("review_totalPage"));
		model.addAttribute("review_pageCount",review.get("review_pageCount"));
		model.addAttribute("detail_review",productDaoImpl.detail_review(review));
		
		/*
		 * qna처리를 위한 model 
		 */
		Map<String,Object> qna = paging.get_qnaPage(no, qna_page, 10, 5);
		model.addAttribute("qna_product_number",no);
		model.addAttribute("qna_page",qna.get("qna_page"));
		model.addAttribute("qna_startPage",qna.get("qna_startPage"));
		model.addAttribute("qna_endPage",qna.get("qna_endPage"));
		model.addAttribute("qna_totalPage",qna.get("qna_totalPage"));
		model.addAttribute("qna_pageCount",qna.get("qna_pageCount"));
		model.addAttribute("detail_qna",productDaoImpl.detail_qna(qna));		

		return "customer/detail";
	}
	
	@RequestMapping("introduce")
	public String introduce() {
		return "customer/footer/introduce";
	}
	@RequestMapping("recruit")
	public String recruit() {
		return "customer/footer/recruit";
	}
	@RequestMapping("cscenter")
	public String cscenter() {
		return "customer/footer/cscenter";
	}
	@RequestMapping("terms")
	public String terms() {
		return "customer/footer/terms";
	}
	@RequestMapping("privatepolicy")
	public String privatepolicy() {
		return "customer/footer/privatepolicy";
	}
	@RequestMapping("/admin/visit")
	public String visit(Model model) {
		model.addAttribute("visit_today",visitCountDAO.countAll_today());
		model.addAttribute("visit_all",visitCountDAO.countAll_all());
		
		return "admin/analyze/visit";
	}
}
