package spring.service.mypage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.UsesSunHttpServer;
import org.springframework.stereotype.Repository;

import spring.repository.ProductDaoImpl;

@Repository
public class Paging_myshopping {

	@Autowired
	Myshopping_total msdao;
	
	public Map<String,Object> get_listPage(String user_num, int listcount, int pagecount, int page){
		Map<String, Object> map = new HashMap<>();
		
		
		int totalCount = msdao.list_totalCount(user_num);//총 게시물 수
		
		int listCount = listcount;//페이지당 보여줄 상품 수
		
		int totalPage = totalCount/listCount;//총페이지는 총 게시물 수/페이지당 상품 수
		if(totalCount%listCount>0) totalPage++;//소숫점으로 나눠질때는 한페이지 추가
		if(totalPage<page) page=totalPage;
		
		int pageCount = pagecount;
		
		int startPage = ((page-1)/pageCount)*pageCount+1;
		int endPage = startPage + pageCount - 1;
		
		if(endPage > totalPage) endPage = totalPage;
		
		int endArticle = listCount*page;
		int startArticle = endArticle-listCount+1;
		
		map.put("page", page);
		map.put("totalCount", totalCount);
		map.put("listCount", listCount);
		map.put("totalPage", totalPage);
		map.put("pageCount", pageCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("startArticle", startArticle);
		map.put("endArticle", endArticle);
		
		return map;
	}

}
