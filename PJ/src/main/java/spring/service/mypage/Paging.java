package spring.service.mypage;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.repository.ProductDaoImpl;

@Repository
public class Paging {

	@Autowired
	ProductDaoImpl productDaoImpl;
	
	public Map<String,Object> get_listPage(Map<String, Object> parameter, int listcount, int pagecount, int page){
		Map<String, Object> map = new HashMap<>();
		
		int totalCount = productDaoImpl.list_totalCount(parameter);//총 게시물 수
		
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
	public Map<String,Object> get_reviewPage(int no, int page, int listcount, int pagecount){
		Map<String, Object> map = new HashMap<>();
		int totalCount = productDaoImpl.review_totalCount(no);
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
		
		map.put("review_product_number", no);
		map.put("review_page", page);
		map.put("review_totalCount", totalCount);
		map.put("review_listCount", listCount);
		map.put("review_totalPage", totalPage);
		map.put("review_pageCount", pageCount);
		map.put("review_startPage", startPage);
		map.put("review_endPage", endPage);
		map.put("review_startArticle", startArticle);
		map.put("review_endArticle", endArticle);
		
		return map;
	}
	
	public Map<String,Object> get_qnaPage(int no, int page, int listcount, int pagecount){
		Map<String, Object> map = new HashMap<>();
		int totalCount = productDaoImpl.qna_totalCount(no);
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
		
		map.put("qna_product_number", no);
		map.put("qna_page", page);
		map.put("qna_totalCount", totalCount);
		map.put("qna_listCount", listCount);
		map.put("qna_totalPage", totalPage);
		map.put("qna_pageCount", pageCount);
		map.put("qna_startPage", startPage);
		map.put("qna_endPage", endPage);
		map.put("qna_startArticle", startArticle);
		map.put("qna_endArticle", endArticle);
		
		return map;
	}
}
