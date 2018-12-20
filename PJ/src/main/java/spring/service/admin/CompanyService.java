package spring.service.admin;

import java.util.List;
import java.util.Map;

import spring.entity.admin.Company;

public interface CompanyService {
	void insert(Company company);									//업체 정보 등록
	List<Company> list(Map<String, Object> count);					//업체 전체 목록 조회
	List<Company> listSearch(Map<String, Object> count);			//특정 항목에서 특정 검색어로 조회
	List<Company> listSearchOptionAll(Map<String, Object> count);	//전체 항목에서 특정 검색어로 조회
	List<Company> companyInfo(int no);								//업체 상세 정보 조회
	List<Company> editCompanyInfo(int no);							//수정할 업체의 정보 조회
	void editCompany(Company company);								//업체 정보 수정
	void deleteCompany(int no);										//업체 삭제
	Company get_company_byNo(int no);								//테이블 번호로 특정 업체 조회
}
