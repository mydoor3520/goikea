package spring.controller;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.entity.mypage.User;
import spring.repository.ProductDaoImpl;
import spring.repository.mypage.HashingDao;
import spring.repository.mypage.LoginDao;
import spring.repository.mypage.SendEmail;
import spring.repository.mypage.UserDao;
import spring.service.admin.UserService;
import spring.service.mypage.MyshoppingServiceImpl;
import spring.service.mypage.Paging_mycart;
import spring.service.mypage.Paging_myshopping;

@Controller
public class HomeController_pjh {

	
	
	@Autowired
	private UserDao udao;
	@Autowired
	private LoginDao ldao;
	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private MyshoppingServiceImpl msService;
	@Autowired
	private UserService userService;
	@Autowired
	private SendEmail send_email;
	/**
	 * 단순히 로그인 입장
	 */
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String login() {
		return "sign/signin";
	}
	/**
	 * 로그인 입력했을때 구동되는 컨트롤러
	 * 
	 */
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String go_login(@RequestParam String id, @RequestParam String pw) throws NoSuchAlgorithmException {
		int idcount = udao.chk_id(id);
		
		if(idcount<1) {
			return "sign/signin_fail";
		}else {
			User user = udao.get_user_byId(id);
			int loop = user.getLoop_pw();
			String salt = user.getSalt_pw();
			System.out.println(user);
			String realPW = hdao.genRealPW(pw, salt, loop); //비밀번호 대조확인
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("id", id);
			map.put("pw", realPW);
			//no, id, name, phone, post, addr1, addr2
			Boolean login = ldao.login_result(map);
			
			Map<String, Object> infomap = new HashMap<>();
			infomap.put("no", user.getNo());
			
			if(login) {
				
				session.setAttribute("user_no", user.getNo());
				session.setAttribute("grade", user.getGrade());
				session.setAttribute("id", user.getId());
				session.setAttribute("name", user.getName());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("phone", user.getPhone());
				session.setAttribute("point", user.getPoint());
				session.setAttribute("post", user.getPost());
				session.setAttribute("addr1", user.getAddr1());
				session.setAttribute("addr2", user.getAddr2());

				
				//아이디 저장 쿠키는 추후 구현
				System.out.println(session);
				return "redirect:home";
			}else {
				return "sign/signin_fail";
			}

		}
		
	}
	
	@RequestMapping("/signout")
	public String signout() {
		if(session.getAttribute("user_no")!=null){
		session.invalidate();	
		return "customer/home";
		}else 
		return "redirect:home";
	}
	
	@RequestMapping("/signup")
	public String signup() {return "sign/signup";}
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private HashingDao hdao;
	
	@RequestMapping(value="/signupSubmit", method=RequestMethod.POST)
	public String signupSubmit(@RequestParam String id, @RequestParam String pw, 
			@RequestParam String name, @RequestParam String phone,
			@RequestParam String email, @RequestParam String email_dns, @RequestParam String birth, 
			@RequestParam String post, @RequestParam String addr1, @RequestParam String addr2) throws NoSuchAlgorithmException {
		
		//루프, 솔트, 해싱과정을 통해서 비밀번호 해싱
		int loop = (int)(Math.random()*500)+1;
		String salt = hdao.genSalt(32);
		String realPW = hdao.genRealPW(pw, salt, loop);
		
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", realPW);		//해싱한 비밀번호 삽입
		map.put("name", name);
		map.put("phone", phone);
		map.put("email", email.concat("@".concat(email_dns)));
		map.put("birth", birth);
		map.put("post", post);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("loop_pw", loop);	//랜덤 루프값 삽입
		map.put("salt_pw", salt);	//솔트값 삽	입
		
		sqlSession.insert("regist_mem", map);
		return "/sign/signupSubmit";
	}
	
	@RequestMapping(value="/change_pw", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public void change_pw(User user, String pw) throws NoSuchAlgorithmException {
		String no = (String)session.getAttribute("user_no");
		
		int loop = (int)(Math.random()*500)+1;
		String salt = hdao.genSalt(32);
		String realPW = hdao.genRealPW(pw, salt, loop);
		Map<String, Object> map = new HashMap<>();
		map.put("pw", realPW);		//해싱한 비밀번호 삽입
		map.put("loop_pw", loop);	//랜덤 루프값 삽입
		map.put("salt_pw", salt);	//솔트값 삽	입
		map.put("no", no);	//솔트값 삽	입
		
		sqlSession.update("change_pw", map);
	}

	@RequestMapping("/pw_find")
	public String pw_find() {return "sign/pw_find";}
	
	@RequestMapping(value="/chk_id_email", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int chk_id_email(User user, String id, String email) throws NoSuchAlgorithmException {
		user.setId(id); 	
		user.setEmail(email);
		System.out.println("체크아이디" + udao.chk_id_email(user));
		return udao.chk_id_email(user);
	}
	
	@RequestMapping(value="/pw_to_email", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String changePw(User user, String id) throws NoSuchAlgorithmException {
		user = udao.get_user_byId(id);
		int times = 8;							//임시 비밀번호의 자릿수
		String tempPw = hdao.getTempPw(times);	//임시 비밀번호 'tempPw'를 생성
		
		int loop = (int)(Math.random()*500)+1;	//루프, 솔트, 해싱과정을 통해서 비밀번호 해싱
		String salt = hdao.genSalt(32);
		String realPW = hdao.genRealPW(tempPw, salt, loop);
		
		Map<String, Object> map = new HashMap<>();	//map으로 전달
		map.put("no", user.getNo());
		map.put("pw", realPW);
		map.put("loop_pw", loop);	//랜덤 루프값 삽입
		map.put("salt_pw", salt);	//솔트값 삽	입
		
		userService.changePw(map);
		
		String username = "testktw7@gmail.com";
		String password = "testktw123";
		System.out.println("user.getEmail() = "+user.getEmail());
		send_email.emailSend(tempPw, user.getEmail(), username, password);
		
		return "redirect:/home";
	}

	@RequestMapping(value="/chk_pw", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int chk_pw(@RequestParam String pw) throws NoSuchAlgorithmException {
		session.getAttribute("user_no");
		String user_no = (String)session.getAttribute("user_no");
		User user = udao.get_user_byNo(user_no);
		int loop = user.getLoop_pw();
		String salt = user.getSalt_pw();
		String realPW = hdao.genRealPW(pw, salt, loop);
		Map<String, Object> map = new HashMap<>();
		map.put("id", user.getId());
		map.put("pw", realPW);
		Boolean check_pw = ldao.login_result(map);
		if(check_pw) {
			return 1;
		}else return 0;
	}
	
	@RequestMapping(value="/chk_id", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public int chk_id(@RequestParam String id) throws NoSuchAlgorithmException {
		System.out.println("췍");
		return udao.chk_id(id);
	}
	
	@RequestMapping(value="/customer_out", method = {RequestMethod.GET, RequestMethod.POST} )
	public String customer_out() {
		if(session.getAttribute("user_no")!=null){
			sqlSession.delete("customer_out", session.getAttribute("user_no"));
			session.invalidate();	
			return "customer/home";
			}else 
			return "redirect:home";
	}
	
	
	
	@RequestMapping("/customer/mypage")
	public String mypage(Model model) {
		
		String userNo = session.getAttribute("user_no").toString();
		User user = udao.get_user_byNo(userNo);
		request.setAttribute("name", user.getName());
		request.setAttribute("point", user.getPoint());
		
		Map<String, Object> map = sqlSession.selectOne("find_buying", userNo);
		model.addAttribute("pay_before", map.get("A"));
		model.addAttribute("deliv_before", map.get("B"));
		model.addAttribute("deliv_ing", map.get("C"));
		model.addAttribute("deliv_complete", map.get("D"));
		model.addAttribute("etc", map.get("E"));
		return "customer/mypage/mypage";
		
	}
	
	@RequestMapping("/customer/myprofile")
	public String myprofile(Model model) {
		
		String userNo = session.getAttribute("user_no").toString();
		User user = udao.get_user_byNo(userNo);
		String[] email = user.getEmail().split("@");	//email을 @으로 쪼개서 보냄
		request.setAttribute("email1", email[0]);
		request.setAttribute("email2", email[1]);
		
		List<User> uList = new ArrayList<User>();
		uList.add(user);
		model.addAttribute("myinfo", uList);
		
		return "customer/mypage/myprofile";
		
	}
	
	@RequestMapping(value="customer/prof_submit", method=RequestMethod.POST)
	public String profile_Submit(@RequestParam String phone, @RequestParam String pw, 
			@RequestParam String email, @RequestParam String email_dns,  @RequestParam String birth, 
			@RequestParam String post, @RequestParam String addr1, @RequestParam String addr2) throws NoSuchAlgorithmException {
		
		session.getAttribute("user_no");
		
		String user_no = (String)session.getAttribute("user_no");
		User user = udao.get_user_byNo(user_no);
		int loop = user.getLoop_pw();
		String salt = user.getSalt_pw();
		String realPW = hdao.genRealPW(pw, salt, loop); //비밀번호 대조확인
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("id", user.getId());
		map.put("pw", realPW);
		Boolean check_pw = ldao.login_result(map);
		
		Map<String, Object> update = new HashMap<>();
		if(check_pw) {
			update.put("no", user_no);	
			update.put("phone", phone);
			update.put("birth", birth);
			update.put("email", email.concat("@".concat(email_dns)));
			update.put("post", post);
			update.put("addr1", addr1);
			update.put("addr2", addr2);
			
			sqlSession.insert("edit_myprofile", update);
			System.out.println("업뎃성공");
			return "customer/mypage/profile_submit";
		}else {
			System.out.println("비번불일치");
			return "customer/mypage/edit_fail";
		}		
	}
	
	
	
	@Autowired Paging_myshopping paging_myshoping;
	
	@RequestMapping("/customer/myshopping")
	public String MyShopping_list(
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			Model model) {
		String userNo = session.getAttribute("user_no").toString();
		User user = udao.get_user_byNo(userNo);
		request.setAttribute("name", user.getName());
		Map<String,Object> count = paging_myshoping.get_listPage(userNo, 5, 3, page);
		count.put("user_num", userNo);
		/////////////////
		request.setAttribute("point", user.getPoint());
		System.out.println(count);
		model.addAttribute("sList", msService.sList(count));
		
		///////////////////////
		/*
		 * 페이징 처리를 위한 model
		 */
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("listCount",count.get("listCount"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));

		return "customer/mypage/myshopping";
	}
	
	@Autowired Paging_mycart paging_mycart;
		
	@RequestMapping("/customer/mycart")
	public String MyCart_list(
			@RequestParam(value="page", required=false, defaultValue="1") int page,
			Model model) {
		String userNo = session.getAttribute("user_no").toString();
		User user = udao.get_user_byNo(userNo);
		request.setAttribute("name", user.getName());
		Map<String,Object> count = paging_mycart.get_listPage(userNo, 5, 3, page);
		System.out.println(count);
		count.put("user_num", userNo);
		/////////////////
		request.setAttribute("point", user.getPoint());
		
		model.addAttribute("cList", msService.cList(count));
		System.out.println("맵퍼 후 :" +msService.cList(count));
		///////////////////////
		/*
		 * 페이징 처리를 위한 model
		 */
		System.out.println(page);
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("listCount",count.get("listCount"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));

		return "customer/mypage/cart";
	}
	
	@Autowired ProductDaoImpl productDaoImpl;
	@RequestMapping("/customer/cart_ready")
	public String cart_ready(@RequestParam(value="pay_number", required=false) String pay_number,
							Model model) {
		System.out.println(pay_number);
		model.addAttribute("cbList", msService.cbList(pay_number));
		System.out.println(msService.cbList(pay_number));
		return "redirect:/customer/pay_ready?pay_number="+pay_number;
	}
	
	@RequestMapping("/customer/cart_delete")
	public String cart_delete(@RequestParam String order_num,
							Model model) {
		msService.cart_del(order_num);
		return "redirect:/customer/mycart";
	}
}
