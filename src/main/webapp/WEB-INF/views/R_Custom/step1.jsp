<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 샐러드</title>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>
</head>
<body>
	<h1>도시락 크기 정하기</h1>

	<a href="http://localhost:8088/R_Custom/step1">step1<!-- 도시락 크기 --></a><br>
	<a href="http://localhost:8088/R_Custom/step2">step2<!-- 야채 --></a><br>
	<a href="http://localhost:8088/R_Custom/step3">step3<!-- 메인 토핑(치즈,고기,해산물) --></a><br>
	<a href="http://localhost:8088/R_Custom/step4">step4<!-- 소스 --></a><br>
	
	
	<!-- main 화면일시 step1로 이동 -->
	<h2>도시락 크기 목록</h2>
	<p>소 <img width="240px" height="160" src="https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg"></p>
	<p>중 <img width="240px" height="160" src="https://cdn.pixabay.com/photo/2021/01/10/04/37/salad-5904093_960_720.jpg"></p>
	<p>대 <img width="240px" height="160" src="https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg"></p>
	<!-- 재료DB에서 카테고리 1(야채) 받아오기 -->
	
	
	
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="다음" onclick="location.href='http://localhost:8088/R_Custom/step2'">
	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">
	
	
</body>
</html>