package spring.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import spring.entity.admin.Company;
import spring.entity.admin.Product;
import spring.entity.admin.ProductOrder;

public interface ProductService {
	
	
	List<Product> productInfo(int no);						//상품정보
	
	List<Product> editProductInfo(int no); 					//수정 상품정보
	
	void editProduct(Product product, MultipartFile[] uploadfiles1, MultipartFile[] uploadfiles2);						//상품수정
	
	List<ProductOrder> productorderInfo(int order_num);					//오더상품 정보
		
	List<ProductOrder> editProductorderInfo(int order_num); 			//수정 오더상품정보
	
	void editProductOrder(ProductOrder productorder);			//오더 상품수정
	
	void deleteProductorder(int order_num);								//오더상품삭제
	
	void deleteProduct(int no);								//상품삭제

	List<ProductOrder> oList(Map<String,Object> count);		//상품 오더 리스트

	List<Product> pList(Map<String,Object> count);  		//상품 리스트
	
	List<Product> listSearch(Map<String, Object> count);			//특정 항목에서 특정 검색어로 조회
	List<Product> listSearchOptionAll(Map<String, Object> count);	//전체 항목에서 특정 검색어로 조회

	void displayProduct(int no, String display);
	
	

}
