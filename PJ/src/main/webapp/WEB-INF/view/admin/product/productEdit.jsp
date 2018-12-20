<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/view/admin/template/header.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${root}/resources/js/sign.js"></script>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

    function SignChange(form)
    {
        var defaultSign = "http://placehold.it/130x130";           //기본이미지 
        if(form.SignSearch.value != '')
            form.SignImage.src = form.SignSearch.value; 
        else 
            form.SignImage.src = defaultSign;
    }



   function itemChange() {

      console.log($("#major option:last").index());

      var furniture = [ "디자인체어", "홈오피스", "침실", "거실", "테이블", "주방", "" ];
      var storage = [ "아이템", "옷/이불", "책장", "바구니/박스", "선반/수납장" ];
      var fabric = [ "방석", "침구", "커튼", "쿠션", "카페트/러그" ];
      var living = [ "세제", "세탁용품", "제습제", "청소용품", "케어서비스" ];
      var deco = [ "그림", "시계", "식물", "캔들", "디퓨저" ];
      var lighting = [ "무드등", "레일조명", "데스크조명", "테이블조명", "팬던트조명" ];
      var kids = [ "베이비", "남아", "여아", "가구", "완구" ];
      var pet = [ "식기", "위생", "장난감", "패션", "푸드" ];

      var selectItem = $("#major").val();

      var changeItem;

      if (selectItem == "가구") {
         changeItem = furniture;
      } else if (selectItem == "수납") {
         changeItem = storage;
      } else if (selectItem == "패브릭") {
         changeItem = fabric;
      } else if (selectItem == "생활") {
         changeItem = living;
      } else if (selectItem == "데코") {
         changeItem = deco;
      } else if (selectItem == "조명") {
         changeItem = lighting;
      } else if (selectItem == "베이비/키즈") {
         changeItem = kids;
      } else if (selectItem == "반려동물") {
         changeItem = pet;
      }

      $('#sub').empty();

      for (var count = 0; count < changeItem.length; count++) {
         var option = $("<option>" + changeItem[count] + "</option>");
         $('#sub').append(option);

      }
   }
</script>

<link rel="stylesheet" type="text/css"
   href="${root}/resources/css/common.css?">
<link rel="stylesheet" type="text/css"
   href="${root}/resources/css/pjh.css?">
<aside>
   <ul class="left">
      <li><a href="${root}/admin/productList">상품조회</a></li>
      <li><a href="${root}/admin/productOrderList">상품주문조회</a></li>
      <li><a href="${root}/admin/productSave">상품등록</a></li>
   </ul>
</aside>

<section class="section" style="text-align: center;">

   <form action="productEditer" method="post"
      enctype="multipart/form-data" id="form">
      <!-- runat="server" -->


   


      <table class="table-hover" style="padding: 5px 0 5px 0; width: 1080;">
         <tbody>
            <c:forEach var="product" items="${editProductInfo}">
               <tr>
                  <td><select id="major" name="major" onchange="itemChange()" required>
                        <option>분류</option>
                        <option>가구</option>
                        <option>수납</option>
                        <option>패브릭</option>
                        <option>생활</option>
                        <option>데코</option>
                        <option>조명</option>
                        <option>베이비/키즈</option>
                        <option>반려동물</option>
                  </select> <select id="sub" name="sub">
                  </select></td>
               </tr>
               <!-- <tr>
                  <th>상품 이미지</th>
                  <td> 
                     <img id="ChangImg" src="${pageContext.request.contextPath}/resources/images/admin/sample/${product.img_1}" alt="" />
                       <input type='file' name="imgInp" id="imgInp" />
                  </td>
               </tr>-->

               <tr>
                  <th>상품명</th>
                  <td><input type="hidden" name="no" value="${product.no}"
                     readonly> <input type="text" name="p_name"
                     value="${product.p_name}"></td>
               </tr>
               <tr>
                  <th>상품가격</th>
                  <td><input type="number" name="p_price"
                     value="${product.p_price}"></td>
               </tr>
               <tr style="border-bottom: solid 1px lightgray;">
                  <th>배송비</th>
                  <td><input type="number" name="d_price"
                     value="${product.d_price}"></td>
               </tr>

              <tr>
					
						<th>상품이미지(1)</th>
						<td><input type="file" name="uploadfiles1"
							style="ime-mode: disabled;" maxlength=10 
							 value="${product.img_1}"></td>
					</tr>


					<tr>
						
						<th>상품이미지(2)</th>
						<td><input type="file" name="uploadfiles1" 
							 value="${product.img_2}"></td>
					</tr>

					<tr>
						
						<th>상품이미지(3)</th>
						<td><input type="file" name="uploadfiles1" 
							 value="${product.img_3}"></td>
					</tr>

					<tr>
						
						<th>상품이미지(4)</th>
						<td><input type="file" name="uploadfiles1" 
							 value="${product.img_4}"></td>
					</tr>

					<tr style="border-bottom: solid 1px lightgray;">
						
						<th>상품이미지(5)</th>
						<td><input type="file" name="uploadfiles1" 
							 value="${product.img_5}"></td>
					</tr>


               <tr>

                  <th>재고</th>
                  <td><input type="text" name="inventory"
                     value="${product.inventory}"></td>
               </tr>
              <tr style="border-bottom: solid 1px lightgray;">

                  <th>옵션</th>
                  <td><input type="text" name="opt" value="${fn:substring(product.opt,3,50)}"></td>
               </tr>

              <tr>
						<th>상품소개(1)</th>
						<td><input type="file" name="uploadfiles2" 
							 value="${content_img1}"></td>
					</tr>
					<tr>
						
						<th>상품소개(2)</th>
						<td><input type="file" name="uploadfiles2" 
							 value="${content_img2}"></td>
					</tr>
					<tr>
						
						<th>상품소개(3)</th>
						<td><input type="file" name="uploadfiles2"  
							 value="${content_img3}"></td>
					</tr>
					<tr>
						
						<th>상품소개(4)</th>
						<td><input type="file" name="uploadfiles2"  
							 value="${content_img4}"></td>
					</tr>
					<tr>
						<th>상품소개(5)</th>
						<td><input type="file" name="uploadfiles2"  
							 value="${content_img5}"></td>
					</tr>
            </c:forEach>
         </tbody>
         <tfoot align="center">
            <tr>
               <td colspan="2" align="center"><input type="submit"
                  class="btn btn-success" value="수정"> <a
                  href="admin/productList">
                     <button class="btn btn-primary">목록</button>
               </a></td>
            </tr>
         </tfoot>
      </table>
   </form>


</section>

<jsp:include page="/WEB-INF/view/admin/template/footer.jsp"></jsp:include>