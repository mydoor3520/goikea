package spring.service.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.admin.Company;

@Service("CompanyService")
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(Company company) {
//		System.out.println("CompanyServiceImpl => insert()");
		sqlSession.insert("insertCompany", company);
	}

	@Override
	public List<Company> list(Map<String, Object> count) {
		System.out.println("CompanyServiceImpl => list => startArticle = "+count.get("startArticle"));
		System.out.println("CompanyServiceImpl => list => endArticle = "+count.get("endArticle"));
		return sqlSession.selectList("selectCompany", count);
	}

	@Override
	public List<Company> listSearch(Map<String, Object> count) {
		System.out.println("CompanyServiceImpl => listSearch => startArticle = "+count.get("startArticle"));
		System.out.println("CompanyServiceImpl => listSearch => endArticle = "+count.get("endArticle"));
		System.out.println("CompanyServiceImpl => listSearch => searchOption = "+count.get("searchOption"));
		System.out.println("CompanyServiceImpl => listSearch => keyword = "+count.get("keyword"));
		System.out.println("sql후" + sqlSession.selectList("searchCompanyList", count));
		
		return sqlSession.selectList("searchCompanyList", count);
	}

	@Override
	public List<Company> listSearchOptionAll(Map<String, Object> count) {
		System.out.println("CompanyServiceImpl => listSearch => keyword = "+count.get("keyword"));
		System.out.println("sql후" + sqlSession.selectList("searchCompanyListOptionAll", count));

		return sqlSession.selectList("searchCompanyListOptionAll", count);
	}

	@Override
	public List<Company> companyInfo(int no) {
//		System.out.println("CompanyServiceImpl => no = "+no);
		return sqlSession.selectList("detailCompany", no);
	}

	@Override
	public void deleteCompany(int no) {
//		System.out.println("CompanyServiceImpl => no = "+no);
		sqlSession.delete("deleteCompany", no);
	}

	@Override
	public List<Company> editCompanyInfo(int no) {
//		System.out.println("CompanyServiceImpl => no = "+no);
		return sqlSession.selectList("editCompanyInfo", no);
	}

	@Override
	public void editCompany(Company company) {
//		System.out.println("CompanyServiceImpl => editCompany");
		sqlSession.update("editCompanyData", company);
	}

	@Override
	public Company get_company_byNo(int no) {
		return sqlSession.selectOne("getCompany", no);
	}

}
