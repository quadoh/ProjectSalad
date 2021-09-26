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
	<h1>토핑 정하기</h1>

	<a href="http://localhost:8088/R_Custom/step1">step1<!-- 도시락 크기 --></a><br>
	<a href="http://localhost:8088/R_Custom/step2">step2<!-- 야채 --></a><br>
	<a href="http://localhost:8088/R_Custom/step3">step3<!-- 메인 토핑(치즈,고기,해산물) --></a><br>
	<a href="http://localhost:8088/R_Custom/step4">step4<!-- 소스 --></a><br>
	
	
	<h2>소스 목록</h2>
	<!-- 재료DB에서 카테고리 3(소스) 받아오기 -->
	<c:forEach var="vo" items="${ingredientList }">
	  <p>${vo.igdt_name }</p>
	  <p><input type="number" name="amount" value="1">개</p>
	  <p>${vo.igdt_price }</p>
	  <p>추가</p>
	</c:forEach>
	
	
	
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="이전" onclick="location.href='http://localhost:8088/R_Custom/step3'">
	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">
	
	
</body>
</html>