<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<h2>야채 목록</h2>
	<!-- 재료DB에서 카테고리 1(야채) 받아오기 -->
	<c:forEach var="vo" varStatus="status" items="${ingredientList }">
	  <form name="igdt${status.count}" action="">
	    <p>${vo.igdt_name }</p>
	    <p>${vo.igdt_price }</p>
	    <input type="hidden" name="igdt_name" value="${vo.igdt_name }">
	    <input type="hidden" name="igdt_price" value="${vo.igdt_price }">
	    <inpit type="radio" name="isOn" value="add">추가
	    <inpit type="radio" name="isOn" value="sub">빼기
	    <!-- <input type="button" class="add" value="추가"> -->
	  </form>
	</c:forEach>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			/* if(".add").on("click",function(){
				/* Cookies.set(${vo.igdt_name}, ${vo.igdt_price }); */
				$(document).
			});  */
		});
	</script>
	
	<hr>
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="이전" onclick="location.href='http://localhost:8088/R_Custom/step1'">
	<input type="button" value="다음" onclick="location.href='http://localhost:8088/R_Custom/step3'">
	
	<hr>
	<h2>현재 담긴 값(장바구니처럼)</h2>
	<!-- 쿠키에서 값 가져오기 -->
	
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">
	
	
	
	
</body>
</html>