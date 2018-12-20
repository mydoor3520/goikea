package spring.controller;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spring.entity.admin.Company;
import spring.entity.mypage.User;
import spring.repository.mypage.HashingDao;
import spring.repository.mypage.UserDao;
import spring.service.admin.CompanyService;
import spring.service.admin.EmailService;
import spring.service.admin.Paging_company;
import spring.service.admin.Paging_user;
import spring.service.admin.UserService;

@Controller
public class HomeController_ktw {
	
	//목록 조회 시 한 페이지 당 몇 개의 자료를 보여줄지, 몇 개의 페이지를 보여줄지 정하세요...
	//업체와 회원의 칸 크기가 다르므로 페이지 당 보여줄 목록 수는 업체와 회원 별도로 분리함
	private int pagePerCompany = 10;	//페이지당 보여줄 업체 수
	private int pagePerUser = 5;		//페이지당 보여줄 회원 수
	private int pageCount = 5;			//보여줄 페이지의 수 => ex) [이전] 1 [2] 3 4 5 <다음>
	
	@Autowired
	private CompanyService companyService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserDao udao;

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HashingDao hdao;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	Paging_company paging_company;
	
	@Autowired
	Paging_user paging_user;
	
	/**
	 * 관리자 메인 홈
	 */
	@RequestMapping("/admin/home")
	public String adminHome() {return "admin/home";}
	
	/**
	 * 회원조회 페이지
	 *  - 회원관리를 누르면 회원조회 페이지로 이동
	 *  - 회원조회를 눌러도 회원조회 페이지로 이동
	 * @param page : 현재 페이지 번호(기본값은 첫 페이지이므로 1로 설정)
	 */
	@RequestMapping("/admin/userList")
	public String userList(
			@RequestParam(value="page", required=false, defaultValue="1") int page, 
			@RequestParam(defaultValue="all") String searchOption, 
			@RequestParam(defaultValue="") String keyword, 
			Model model) {
		Map<String,Object> count = paging_user.get_listPage(pagePerUser, pageCount, page);	//컨트롤러 최상단에 선언, 페이지당 보여줄 업체 수 / 보여줄 페이지 수 / 현재 페이지 번호
		
		model.addAttribute("selectUser", userService.list(count));
		System.out.println("HomeController => userList");
		
		///////////////////////
		/*
		 * 페이징 처리를 위한 model
		 */
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("pagePerUser",count.get("pagePerUser"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));
		
		return "admin/user/userList";
	}
	
	/**
	 * 회원조회에서 검색을 누르면 조건에 맞는 리스트를 띄움
	 * @param page : 현재 페이지 번호(기본값은 첫 페이지이므로 1로 설정)
	 */
	@RequestMapping("/admin/userListSearch")
	public String userListSearch(
			@RequestParam(value="page", required=false, defaultValue="1") int page, 
			@RequestParam(defaultValue="all") String searchOption, 
			@RequestParam(defaultValue="") String keyword, 
			Model model) {
		Map<String,Object> count;
		if(keyword.equals("")) {
			System.out.println("검색어를 입력하지 않았구만!");
			//컨트롤러 최상단에 선언됨 => 페이지당 보여줄 회원 수 / 보여줄 페이지 수 / 현재 페이지 번호
			count = paging_user.get_listPage(pagePerUser, pageCount, page);
			
			model.addAttribute("selectUser", userService.list(count));
		}
		else if(searchOption.equals("all")){
			System.out.println("전체검색! => "+searchOption);
			//컨트롤러 최상단에 선언됨 => 페이지당 보여줄 회원 수 / 보여줄 페이지 수 / 현재 페이지 번호 / 검색 옵션 / 검색어
			count = paging_user.get_searchListPageAll(pagePerUser, pageCount, page, keyword);
			System.out.println("paging_user.get_searchListPageAll = "+paging_user.get_searchListPageAll(pagePerUser, pageCount, page, keyword));
			
			model.addAttribute("searchUserListOptionAll", userService.listSearchOptionAll(count));
			System.out.println("sql 후 컨트롤러 : "+userService.listSearchOptionAll(count));
		}
		else {
			System.out.println(searchOption+"라는 옵션의 "+keyword+"라는 검색어로 검색!");
			//컨트롤러 최상단에 선언됨 => 페이지당 보여줄 회원 수 / 보여줄 페이지 수 / 현재 페이지 번호 / 검색 옵션 / 검색어
			count = paging_user.get_searchListPage(pagePerUser, pageCount, page, searchOption, keyword);
			System.out.println("paging_user.get_searchListPage = "+paging_user.get_searchListPage(pagePerUser, pageCount, page, searchOption, keyword));
			
			model.addAttribute("searchUserList", userService.listSearch(count));
			System.out.println("sql 후 컨트롤러 : "+userService.listSearch(count));
		}
		
		System.out.println("HomeController => userList");
		
		///////////////////////
		/*
		 * 페이징 처리를 위한 model
		 */
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("pagePerUser",count.get("pagePerUser"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));
		model.addAttribute("searchOption",count.get("searchOption"));
		model.addAttribute("keyword",count.get("keyword"));
		
		return "admin/user/userList";
	}
	
	/**
	 * 회원정보 상세 보기 및 수정
	 *  - 항목 번호(no)로 테이블 검색
	 */
	@RequestMapping("/admin/userInfo")
	public String userInfo(Model model, @RequestParam int no) {
		
		String userNo = Integer.toString(no);
		User user = udao.get_user_byNo(userNo);
		String[] email = user.getEmail().split("@");	//email을 @으로 쪼개서 보냄
		request.setAttribute("email1", email[0]);
		request.setAttribute("email2", email[1]);
		
		List<User> uList = new ArrayList<User>();
		uList.add(user);
		model.addAttribute("myinfo", uList);
//		model.addAttribute("detailUser", userService.userInfo(no, uList));
		
		return "admin/user/userInfo";
	}
	
	/**
	 * 회원 정보 수정 내역을 제출(submit)했을 경우
	 */
	@RequestMapping(value="/admin/userEditer", method=RequestMethod.POST)
	public String profile_Submit(User user, @RequestParam String email, @RequestParam String email_dns) {
		user.setEmail(email.concat("@".concat(email_dns)));
		System.out.println("Controller user.getEmail() = "+user.getEmail());
		userService.editUser(user);
		
		return "redirect:/admin/userInfo?no="+user.getNo();
	}

	/**
	 * 해당 번호의 회원 삭제
	 */
	@RequestMapping("/admin/userDelete")
	public String userDelete(@RequestParam int no) {
		userService.deleteUser(no);
		System.out.println("HomeController => userDelete");
		
		return "redirect:/admin/userList";
	}

	/**
	 *  회원 비번 변경
	 *  - 관리자가 회원 '비밀번호 변경'을 눌렀을 때
	 *  - 임의로 새 비밀번호를 생성하여 DB에 저장하고 해당 회원의 메일에 전송
	 */
	@RequestMapping(value="/admin/userPwChange", method=RequestMethod.POST)
	public String changePw(User user) throws NoSuchAlgorithmException {
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
//		System.out.println("HomeController => changePw");
		
//		고객에게 임시 비밀번호를 보내주기 위한 이메일 전송 메소드 실행
//		관리자 이메일과 비밀번호를 주어야함
		String username = "testktw7@gmail.com";
		String password = "testktw123";
		System.out.println("user.getEmail() = "+user.getEmail());
		emailSend(tempPw, user.getEmail(), username, password);
		
		return "redirect:/admin/userList";
	}

	/**
	 * 이메일 전송 메소드
	 * @param tempPw : 고객에게 보내줄 임시 비밀번호
	 * @param mailAddress : 고객의 주소
	 */
	public void emailSend(String tempPw, String mailAddress, String username, String password) {
		String setfrom = "None";         
	    String tomail  = mailAddress;     						// 받는 사람 이메일
	    String title   = "IKEA 임시 비밀번호 발급 안내";					// 제목
	    String content = "고객님의 새 비밀번호는 ["+tempPw+"]입니다.";    // 내용
	    System.out.println("emailSend, 임시 비밀번호 = "+tempPw+", 고객의 이메일 주소 = "+tomail);
	   
//		sender를 이용하여 간단한 텍스트 메일을 전송
//		작성할 항목 : 대상, 참조, 숨은참조, 제목, 내용, 보낸이, ......
		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setSubject(title);		//제목
		mail.setText(content);		//내용
		mail.setFrom(setfrom);		//보낸이
		String[] to = {tomail};		//발송 대상
		mail.setTo(to);
		//참조 : setCc(), 숨은참조 : setBcc()
		
		JavaMailSenderImpl sender = emailService.mailSend(username, password);
		sender.send(mail);
	}
	
	/**
	 * 업체관리를 누르면 업체조회 페이지로 이동
	 * 업체조회를 눌러도 업체조회 페이지로 이동
	 * @param page : 현재 페이지 번호(기본값은 첫 페이지이므로 1로 설정)
	 * @return
	 */
	@RequestMapping("/admin/companyList")
	public String companyList(
			@RequestParam(value="page", required=false, defaultValue="1") int page, 
			Model model) {
		Map<String,Object> count = paging_company.get_listPage(pagePerCompany, pageCount, page);	//컨트롤러 최상단에 선언, 페이지당 보여줄 업체 수 / 보여줄 페이지 수 / 현재 페이지 번호
		
		model.addAttribute("selectCompany", companyService.list(count));
//		System.out.println("companyService.list = "+companyService.list());
		
		///////////////////////
		/*
		 * 페이징 처리를 위한 model
		 */
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("pagePerCompany",count.get("pagePerCompany"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));
		
		return "admin/company/companyList";
	}
	
	/**
	 * 업체 조회에서 검색을 누르면 조건에 맞는 리스트를 띄움
	 * @param page : 현재 페이지 번호(기본값은 첫 페이지이므로 1로 설정)
	 * @return
	 */
	@RequestMapping("/admin/companyListSearch")
	public String companySearch(
			@RequestParam(value="page", required=false, defaultValue="1") int page, 
			@RequestParam(defaultValue="all") String searchOption, 
			@RequestParam(defaultValue="") String keyword, 
			Model model) {
		Map<String,Object> count;
		
		if(keyword.equals("")) {
			System.out.println("검색어를 입력하지 않았구만!");
			//컨트롤러 최상단에 선언됨 => 페이지당 보여줄 업체 수 / 보여줄 페이지 수 / 현재 페이지 번호
			count = paging_company.get_listPage(pagePerCompany, pageCount, page);
			
			model.addAttribute("selectCompany", companyService.list(count));
		}
		else if(searchOption.equals("all")){
			System.out.println("전체검색! => "+searchOption);
			//컨트롤러 최상단에 선언됨 => 페이지당 보여줄 업체 수 / 보여줄 페이지 수 / 현재 페이지 번호 / 검색 옵션 / 검색어
			count = paging_company.get_searchListPageAll(pagePerCompany, pageCount, page, keyword);
			System.out.println("paging_company.get_searchListPageAll = "+paging_company.get_searchListPageAll(pagePerCompany, pageCount, page, keyword));
			
			model.addAttribute("searchCompanyListOptionAll", companyService.listSearchOptionAll(count));
			System.out.println("sql 후 컨트롤러 : "+companyService.listSearchOptionAll(count));
		}
		else {
			System.out.println(searchOption+"라는 옵션의 "+keyword+"라는 검색어로 검색!");
			//컨트롤러 최상단에 선언됨 => 페이지당 보여줄 업체 수 / 보여줄 페이지 수 / 현재 페이지 번호 / 검색 옵션 / 검색어
			count = paging_company.get_searchListPage(pagePerCompany, pageCount, page, searchOption, keyword);
			System.out.println("paging_company.get_searchListPage = "+paging_company.get_searchListPage(pagePerCompany, pageCount, page, searchOption, keyword));
			
			model.addAttribute("searchCompanyList", companyService.listSearch(count));
			System.out.println("sql 후 컨트롤러 : "+companyService.listSearch(count));
		}
		
		///////////////////////
		/*
		 * 페이징 처리를 위한 model
		 */
		model.addAttribute("page",count.get("page"));
		model.addAttribute("startPage",count.get("startPage"));
		model.addAttribute("endPage",count.get("endPage"));
		model.addAttribute("pagePerCompany",count.get("pagePerCompany"));
		model.addAttribute("totalPage",count.get("totalCount"));
		model.addAttribute("pageCount",count.get("pageCount"));
		model.addAttribute("searchOption",count.get("searchOption"));
		model.addAttribute("keyword",count.get("keyword"));
		
		return "admin/company/companyList";
	}
	
//	업체 등록 페이지로 이동
	@RequestMapping("/admin/companyRegister")
	public String companyRegister() {return "admin/company/companyRegister";}
	
//	업체 등록 페이지에서 submit을 눌렀을 때
	@RequestMapping(value="/admin/companyRegister", method=RequestMethod.POST)
	public String companyRegisterInsert(Company company, @RequestParam String m_email, @RequestParam String m_email_dns) {
		company.setM_email(m_email.concat("@".concat(m_email_dns)));
		companyService.insert(company);
		
		return "redirect:/admin/companyList";
	}

	/**
	 * 업체 상제 정보 및 수정 기능으로 통합
	 *  - 항목 번호-no로 테이블 검색
	 */
	@RequestMapping("/admin/companyInfo")
	public String companyInfo(Model model, @RequestParam int no) {
		Company company = companyService.get_company_byNo(no);
		String[] email = company.getM_email().split("@");	//email을 @으로 쪼개서 보냄
		request.setAttribute("m_email1", email[0]);
		request.setAttribute("m_email2", email[1]);
		
		List<Company> cList = new ArrayList<Company>();
		cList.add(company);
//		model.addAttribute("detailCompany", companyService.companyInfo(no));
		model.addAttribute("detailCompany", cList);
		
		return "admin/company/companyInfo";
	}
	
	/**
	 * 업체 정보 수정 페이지로 이동
	 * @return 업체 정보 수정 페이지 주소 반환
	 */
	@RequestMapping("/admin/companyEditer")
	public String companyEditer(Model model, @RequestParam int no) {
		model.addAttribute("editCompanyInfo", companyService.editCompanyInfo(no));
		
		return "admin/company/companyEdit";
	}
	
	/**
	 * 정보 수정 페이지에서 submit을 눌렀을 때
	 * @param company		: 업체 테이블 정보
	 * @param m_email		: 메일의 @ 앞자리
	 * @param m_email_dns	: 메일의 @ 뒷자리
	 * @return				: 정보 수정 페이지 리다이렉트
	 */
	@RequestMapping(value="/admin/companyEditer", method=RequestMethod.POST)
	public String companyEditerUpdate(Company company, @RequestParam String m_email, @RequestParam String m_email_dns) {
		company.setM_email(m_email.concat("@".concat(m_email_dns)));
		System.out.println("companyEditerUpdate 컨트롤러에서 실행됨 company.getM_email() = "+company.getM_email());
		
		companyService.editCompany(company);
		
		return "redirect:/admin/companyInfo?no="+company.getNo();
	}

	/**
	 * 업체 삭제(no로 테이블 검색)
	 * @param no	: 항목 번호
	 * @return		: 업체 목록 페이지 리다이렉트
	 */
	@RequestMapping("/admin/companyDelete")
	public String companyDelete(@RequestParam int no) {
//		System.out.println("companyDelete 파라미터 = "+no);
		companyService.deleteCompany(no);
		
		return "redirect:/admin/companyList";
	}

}









