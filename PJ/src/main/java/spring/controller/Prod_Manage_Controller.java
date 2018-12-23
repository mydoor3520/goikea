package spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import spring.entity.admin.Product;
import spring.entity.admin.ProductOrder;
import spring.service.admin.Paging_product;
import spring.service.admin.Paging_productorder;
import spring.service.admin.ProductService;
import spring.service.admin.ProductServiceImpl;
import spring.service.admin.SaveFileService;

@Controller
public class Prod_Manage_Controller {
   

   private int listCount = 5;//페이지당 보여줄 업체 수
   private int pageCount = 5;//보여줄 페이지의 수 => ex) [이전] 1 [2] 3 4 5 <다음>
   
   @Autowired
   private SqlSession sqlSession;

   @Autowired
   private ProductService productService;

   @Autowired
   private ProductServiceImpl poService;;

   @RequestMapping("/admin/productSave")
   public String productSave() {
      return "admin/product/productSave";
   }

   // 상품을 등록하는곳
   @Autowired SaveFileService fservice;
   @RequestMapping(value = "/admin/productSave", method = RequestMethod.POST)
   public String ProductSave(@RequestParam String major, @RequestParam String sub, @RequestParam String p_name,
         @RequestParam int p_price, @RequestParam int d_price, @RequestParam String d_com,
         MultipartFile[] uploadfiles1, @RequestParam int inventory, 
         @RequestParam String opt, MultipartFile[] uploadfiles2) {
      System.out.println("컨트롤러 접근");
      Map<String, Object> map = new HashMap<>();
      map.put("major", major);
      map.put("sub", sub);
      map.put("p_name", p_name);
      map.put("p_price", p_price);
      map.put("d_price", d_price);
      map.put("d_com", d_com);
      Integer i = 1;
      for(MultipartFile f : uploadfiles1){
         System.out.println(f.getOriginalFilename());
         if(f.getOriginalFilename()=="") {
            map.put("img_"+i.toString(), "-");
         }else {
         map.put("img_"+i.toString(), fservice.saveFile(f));
         }
         i++;
       }
      i=1;
      map.put("inventory", inventory);
      map.put("opt", "선택".concat(",".concat(opt)));
      for(MultipartFile f : uploadfiles2){
         if(f.getOriginalFilename()=="") {
            map.put("content_img"+i.toString(), "-");
         }else {
            map.put("content_img"+i.toString(), fservice.saveFile(f));
         }
         i++;
      }
      sqlSession.insert("productsave", map);
      System.out.println("여길통과할까요?");

      return "admin/product/productSave_success";
   }

//   @RequestMapping(value = "/productSave", method = RequestMethod.POST)
//   public String ProductSave(MultipartHttpServletRequest mRequest) {
//      System.out.println("업로드 = "+mRequest);
//      return "admin/product/productSave_success";
//   }

   // 상품등록이 성공할떄 success로 이동

   @RequestMapping("/admin/productSave_success")
   public String productSave_success() {
      return "admin/product/productSave";
   }

   // 상품 삭제

   @RequestMapping("/admin/productDelete")
   public String productDelete(@RequestParam int no) {
      productService.deleteProduct(no);
      System.out.println("delete controller실행");
      return "redirect:/admin/productList";
   }
   
   //디스플레이 여부 설정
   @RequestMapping("/admin/product_display")
   public String product_display(@RequestParam int no ,@RequestParam String display) {
      productService.displayProduct(no,display);
      return "redirect:/admin/productList";
   }
   
   // 오더 상품 삭제

      @RequestMapping("/admin/productorderDelete")
      public String productorderDelete(@RequestParam int order_num) {
         productService.deleteProductorder(order_num);
         System.out.println("delete controller실행");
         return "redirect:/admin/productOrderList";
      }

   // 상품수정부분

   @RequestMapping("/admin/productEditer")
   public String productEditer(Model model, @RequestParam int no) {
      model.addAttribute("editProductInfo", productService.editProductInfo(no));
System.out.println("상품 수정");
      return "admin/product/productEdit";
   }

   @RequestMapping(value = "/admin/productEditer", method = RequestMethod.POST)
   public String productEditerUpdate(Product product, MultipartFile[] uploadfiles1,
         MultipartFile[] uploadfiles2) {
      productService.editProduct(product , uploadfiles1, uploadfiles2);
      System.out.println("상품 수정 컨트롤러 실행");

      return "redirect:/admin/productList";
   }
   
   // 상품오더수정부분

      @RequestMapping("/admin/productorderEditer")
      public String productorderEditer(Model model, @RequestParam int order_num) {
         model.addAttribute("editProductorderInfo", productService.editProductorderInfo(order_num));

         return "admin/product/productOrderEdit";
      }

      @RequestMapping(value = "/admin/productorderEditer", method = RequestMethod.POST)
      public String productorderEditerUpdate(ProductOrder productorder) {
         System.out.println(productorder);
         productService.editProductOrder(productorder);
         System.out.println("상품 수정 컨트롤러 실행");

         return "redirect:/admin/productOrderList";
      }

   // 상품 상세보기 부분

   @RequestMapping("/admin/productInfo")
   public String productInfo(Model model, @RequestParam int no) {
      model.addAttribute("detailProduct", productService.productInfo(no));
      return "admin/product/productInfo";
   }

   
   //오더 상품 정보
   
   // 상품 상세보기 부분

      @RequestMapping("/admin/productOrderInfo")
      public String productOderInfo(Model model, @RequestParam int order_num) {
         model.addAttribute("detailProductorder", productService.productorderInfo(order_num));
         System.out.println( productService.productorderInfo(order_num));
         return "admin/product/productOrderInfo";
      }
      
   // 주문오더리스트

   @Autowired
   Paging_productorder paging_productorder;

   @RequestMapping("/admin/productOrderList")
   public String ProductOrder_list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
         Model model) {
      Map<String, Object> count = paging_productorder.get_listPage(5, 3, page);
      
      model.addAttribute("oList",poService.oList(count));
      
      // 페이징처리

      model.addAttribute("page", count.get("page"));
      model.addAttribute("startPage", count.get("startPage"));
      model.addAttribute("endPage", count.get("endPage"));
      model.addAttribute("listCount", count.get("listCount"));
      model.addAttribute("totalPage", count.get("totalCount"));
      model.addAttribute("pageCount", count.get("pageCount"));

      return "admin/product/productOrderList";
   }

   // 주문오더리스트

   @Autowired
   Paging_product paging_product;

   @RequestMapping("/admin/productList")
   public String Product_list(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
         Model model) {

      Map<String, Object> count = paging_product.get_listPage(5, 3, page);

      model.addAttribute("pList", poService.pList(count));

      //페이징 처리
      
      model.addAttribute("page", count.get("page"));
      model.addAttribute("startPage", count.get("startPage"));
      model.addAttribute("endPage", count.get("endPage"));
      model.addAttribute("listCount", count.get("listCount"));
      model.addAttribute("totalPage", count.get("totalCount"));
      model.addAttribute("pageCount", count.get("pageCount"));

      return "admin/product/productList";
   }
   
   
   /////////////////////////검색부분/////
   @RequestMapping("/admin/productListSearch")
   public String productListSearch(
         @RequestParam(value="page", required=false, defaultValue="1") int page, 
         @RequestParam(defaultValue="all") String searchOption, 
         @RequestParam(defaultValue="") String keyword, 
         Model model) {
      Map<String,Object> count;
      if(keyword.equals("")) {
         System.out.println("검색어를 입력하지 않음");
         
         count = paging_product.get_listPage(listCount, pageCount, page);
         
         model.addAttribute("searchProductList", productService.pList(count));
      }
      else if(searchOption.equals("all")){
         System.out.println("전체검색! => "+searchOption);
         
         count = paging_product.get_searchListPageAll(listCount, pageCount, page, keyword);
         System.out.println("paging_product.get_searchListPageAll = "+paging_product.get_searchListPageAll(listCount, pageCount, page, keyword));
         
         model.addAttribute("searchProductListOptionAll", productService.listSearchOptionAll(count));
         System.out.println("sql 후 컨트롤러 : "+productService.listSearchOptionAll(count));
      }
      else {
         System.out.println(searchOption+"라는 옵션의 "+keyword+"라는 검색어로 검색!");
         //컨트롤러 최상단에 선언됨 => 페이지당 보여줄 회원 수 / 보여줄 페이지 수 / 현재 페이지 번호 / 검색 옵션 / 검색어
         count = paging_product.get_searchListPage(listCount, pageCount, page, searchOption, keyword);
         System.out.println("paging_product.get_searchListPage = "+paging_product.get_searchListPage(listCount, pageCount, page, searchOption, keyword));
         
         model.addAttribute("searchProductList", productService.listSearch(count));
         System.out.println("sql 후 컨트롤러 : "+productService.listSearch(count));
      }
      
      System.out.println("HomeController => productList");
      
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
      model.addAttribute("searchOption",count.get("searchOption"));
      model.addAttribute("keyword",count.get("keyword"));
      
      return "admin/product/productList";
   }

}