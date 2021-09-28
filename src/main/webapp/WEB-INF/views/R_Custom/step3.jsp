<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<%@ include file="../include/header.jsp" %>

	<h1>토핑 정하기</h1>
	
	<nav>
	<a href="http://localhost:8088/R_Custom/step1">step1<!-- 도시락 크기 --></a> >
	<a href="http://localhost:8088/R_Custom/step2">step2<!-- 야채 --></a> >
	<a href="http://localhost:8088/R_Custom/step3">step3<!-- 메인 토핑(치즈,고기,해산물) --></a> >
	<a href="http://localhost:8088/R_Custom/step4">step4<!-- 소스 --></a>
	</nav>
	
	<h2>고기 목록</h2>
	<!-- 재료DB에서 카테고리 2(고기) 받아오기 -->
	<c:forEach var="vo" varStatus="status" items="${ingredientList }">
	  <form name="igdt${status.count}" action="">
	    <p>${vo.igdt_name }</p>
	    <p>${vo.igdt_price }</p>
	    <input type="hidden" name="igdt_name" value="${vo.igdt_name }">
	    <input type="hidden" name="igdt_price" value="${vo.igdt_price }">
	    <input type="radio" name="isOn" value="add">추가
	    <input type="radio" name="isOn" value="sub">빼기
	    <!-- <input type="button" class="add" value="추가"> -->
	  </form>
	</c:forEach>
	
	
	
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="이전" onclick="location.href='http://localhost:8088/R_Custom/step2'">
	<input type="button" value="다음" onclick="location.href='http://localhost:8088/R_Custom/step4'">
	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">

<%@ include file="../include/footer.jsp" %>