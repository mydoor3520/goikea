<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>결제가 필요합니다.</title>
		<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
		<script>
			window.onload = function(){
				document.getElementById("goHome").onclick = function(){
					window.location.href="home";
				}
			}
		</script>
	</head>
	<body>
		<div style="text-align:center;">
			<p style="font-family: 'Montserrat'; font-size:100px;">402</p>
			<p style="font-family: 'Montserrat'; font-size:100px;">Required Payment</p>
			<p style="font-size:65px;font-weight:bold;">이 페이지는 결제가 필요합니다.</p>
			<div id="goHome" style="border: 1px solid black;width:250px;height:75px;font-size:35px;line-height:75px;margin:0 auto;cursor: pointer;">메인으로</div>
			
		</div>	
	</body>
</html>