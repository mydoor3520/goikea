<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>페이지를 찾을 수 없습니다.</title>
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
			<p style="font-family: 'Montserrat'; font-size:100px;">404</p>
			<p style="font-family: 'Montserrat'; font-size:100px;">Page Not Found</p>
			<p style="font-size:65px;font-weight:bold;">페이지를 찾을 수 없습니다</p>
			<div id="goHome" style="border: 1px solid black;width:250px;height:75px;font-size:35px;line-height:75px;margin:0 auto;cursor: pointer;">메인으로</div>
		</div>	
	</body>
</html>