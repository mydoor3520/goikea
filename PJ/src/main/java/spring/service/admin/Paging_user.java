package spring.service.admin;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Paging_user {

	@Autowired
	User_total user_total;
	
	public Map<String,Object> get_listPage(int listcount, int pagecount, int page){
		Map<String, Object> map = new HashMap<>();
		
		
		int totalCount = user_total.list_totalCount();//총 게시물 수
		
		map = paging(listcount, pagecount, page, totalCount, map);	//페이지 처리 메소드 시행
		
		return map;
	}
	
	/**
	 * 특정 항목에서 검색어를 통한 조회
	 * @param listcount		: 페이지당 보여줄 업체 수
	 * @param pagecount		: 보여줄 페이지의 수 => ex) [이전] 1 [2] 3 4 5 <다음>
	 * @param page			: 현재 페이지
	 * @param searchOption	: 검색 항목
	 * @param keyword		: 검색어
	 * @return
	 */
	public Map<String,Object> get_searchListPage(int listcount, int pagecount, int page, String searchOption, String keyword){
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> searchmap = new HashMap<>();
		searchmap.put("searchOption", searchOption);
		searchmap.put("keyword", keyword);
		
		int totalCount = user_total.listSelect_totalCount(searchmap);//총 게시물 수
		System.out.println("Paging_user => get_searchListPage => totalCount = "+totalCount);
		
		map = paging(listcount, pagecount, page, totalCount, map);	//페이지 처리 메소드 시행
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		System.out.println("Paging_user => get_searchListPage => searchOption, keyword = "+searchOption+keyword);
		
		return map;
	}
	
	/**
	 * 전체 항목에서 검색어를 통한 조회
	 * @param listcount	: 페이지당 보여줄 업체 수
	 * @param pagecount	: 보여줄 페이지의 수 => ex) [이전] 1 [2] 3 4 5 <다음>
	 * @param page		: 현재 페이지
	 * @param keyword	: 검색어
	 * @return
	 */
	public Map<String,Object> get_searchListPageAll(int listcount, int pagecount, int page, String keyword){
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> searchmap = new HashMap<>();
		searchmap.put("keyword", keyword);
		
		int totalCount = user_total.listSelectAll_totalCount(searchmap);//총 게시물 수
		System.out.println("Paging_user => get_searchListPage => totalCount = "+totalCount);
		
		map = paging(listcount, pagecount, page, totalCount, map);	//페이지 처리 메소드 시행
		map.put("keyword", keyword);
		
		System.out.println("Paging_user => get_searchListPage => keyword = "+keyword);
		
		return map;
	}

	/**
	 * 페이지 처리 메소드
	 */
	public Map<String, Object> paging(int listcount, int pagecount, int page, int totalCount, Map<String, Object> map) {
		int listCount = listcount;//페이지당 보여줄 업체 수
		
		int totalPage = totalCount/listCount;//총페이지는 총 게시물 수/페이지당 업체 수
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
		System.out.println("Paging_user => get_searchListPage => startArticle = "+map.get("startArticle"));
		System.out.println("Paging_user => get_searchListPage => endArticle = "+map.get("endArticle"));
		
		return map;
	}

}
