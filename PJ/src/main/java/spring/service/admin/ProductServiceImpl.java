package spring.service.admin;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spring.entity.admin.Product;
import spring.entity.admin.ProductOrder;

	
	@Service("ProductService")
public class ProductServiceImpl implements ProductService{
		
		
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	//상품정보
	
	
	
	@Override
	public List<Product> productInfo(int no) {
		//System.out.println("ProductServiceImpl--Info");
		return sqlSession.selectList("detailProduct", no);
	}
	//@Override
	//public Product productDelete(int no) {
	//	System.out.println("ProductServiceImple--delete");
	//	return sqlSession.select
	//}

	
	
	//상품수정
	
	
	@Autowired SaveFileService fservice;
	@Override
	public void editProduct(Product product, MultipartFile[] uploadfiles1, MultipartFile[] uploadfiles2) {
		int i = 0;
		String[] arr1 = new String[5];
		String tmp = "";
		for(MultipartFile f : uploadfiles1){
			System.out.println(f.getOriginalFilename());
			if(f.getOriginalFilename()=="") {
				arr1[i] = "-";
			}else {
				arr1[i] = fservice.saveFile(f);
			}
			i++;
		}
		product.setImg_1(arr1[0]);
		product.setImg_2(arr1[1]);
		product.setImg_3(arr1[2]);
		product.setImg_4(arr1[3]);
		product.setImg_5(arr1[4]);
			
		i=0;
		String[] arr2 = new String[5];
		for(MultipartFile f : uploadfiles1){
			System.out.println(f.getOriginalFilename());
			if(f.getOriginalFilename()=="") {
				arr2[i] = "-";
			}else {
				arr2[i] = fservice.saveFile(f);
			}
			i++;
		}
		product.setContent_img1(arr2[0]);
		product.setContent_img2(arr2[1]);
		product.setContent_img3(arr2[2]);
		product.setContent_img4(arr2[3]);
		product.setContent_img5(arr2[4]);
		
		sqlSession.update("editProductData",product);
		
	}
	//////
	
	@Override
	public List<ProductOrder> editProductorderInfo(int order_num) {
		return sqlSession.selectList("detailProductorder", order_num);
	}
	@Override
	public void editProductOrder(ProductOrder productorder) {
		sqlSession.update("editProductorderData",productorder);
	}
	
	
	//상품 삭제
	
	
	
	@Override
	public void deleteProduct(int no) {
		sqlSession.delete("deleteProduct",no);		
	}

	@Override
	public List<Product> editProductInfo(int no) {
		return sqlSession.selectList("editProductInfo",no);
	}

	
	
	//상품 오더 리스트
	
	
	
	@Override
	public List<ProductOrder> oList(Map<String, Object> count) {
		return sqlSession.selectList("productorder_list", count);
	}
	
	
	
	//상품 리스트	
	
	
	
	@Override
	public List<Product> pList(Map<String, Object> count) {
		return sqlSession.selectList("product_list", count);
	}







	@Override
	public void deleteProductorder(int order_num) {
		sqlSession.delete("deleteProductorder",order_num);
		
	}
	@Override
	public List<ProductOrder> productorderInfo(int order_num) {
		return sqlSession.selectList("editProductorderInfo",order_num);
	}

	@Override
	public List<Product> listSearch(Map<String, Object> count) {
		System.out.println("ProductServiceImpl => listSearch => startArticle = "+count.get("startArticle"));
		System.out.println("ProductServiceImpl => listSearch => endArticle = "+count.get("endArticle"));
		System.out.println("ProductServiceImpl => listSearch => searchOption = "+count.get("searchOption"));
		System.out.println("ProductServiceImpl => listSearch => keyword = "+count.get("keyword"));
		System.out.println("sql후" + sqlSession.selectList("searchProductList", count));
		
		return sqlSession.selectList("searchProductList", count);
	}

	@Override
	public List<Product> listSearchOptionAll(Map<String, Object> count) {
		System.out.println("ProductServiceImpl => listSearchOptionAll => keyword = "+count.get("keyword"));
		System.out.println("sql후" + sqlSession.selectList("searchProductListOptionAll", count));

		return sqlSession.selectList("searchProductListOptionAll", count);
	}

	@Override
	public void displayProduct(int no, String display) {
		 if(display.equals("TRUE")) {
			 sqlSession.update("N_displayProduct",no);
	      }else {
	    	  sqlSession.update("Y_displayProduct",no);
	      }
	}


	

	

}
