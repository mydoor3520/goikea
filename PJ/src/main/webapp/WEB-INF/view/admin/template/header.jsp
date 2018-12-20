<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<html>

<head>
<title>관리자 모드</title>
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${root}/resources/css/pjh.css?">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/ktw.css">
	<link rel="stylesheet" type="text/css" href="${root}/resources/css/admin.css">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
        a:link, .header > .bot > li > a:visited{color: black;text-decoration: none;}
		a:hover {color: black;text-decoration: underline;}
    </style>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
</head>

<body>
    <header class="header-ktw">
        <nav class="menu">
	        <div style="box-sizing: border-box;width: 15%;min-height:50px;display: inline-block;vertical-align: top"></div>
	        <div style="box-sizing: border-box;width: 80%;min-height:50px;display: inline-block;vertical-align: top">
		        <a href="${root}/admin/home" class="left"><i class="fa fa-home icon-size"></i>홈</a>
		        <a href="userList" class="left"><i class="fa fa-user icon-size"></i>회원관리</a>
		        <a href="companyList" class="left"><i class="fa fa-building icon-size"></i>업체관리</a>
		        <a href="productList" class="left"><i class="fa fa-gift icon-size"></i>상품관리</a>
		        <a href="visit" class="left"><i class="far fa-address-book icon-size"></i>방문 통계</a>
		        <a href="${root}/signout" class="right">로그아웃</a>
	        	<a href="${root}/home" class="right">메인 홈</a>
	        </div>
	    </nav>
		
        <hr style="border-style: 0.1px solid gray;opacity: 0.1">
    </header>
    