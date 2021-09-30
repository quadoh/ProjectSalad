<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<h1>토핑 정하기</h1>
	
	<nav>
	<a href="/R_Custom/step1">step1<!-- 야채 --></a> >
	<a href="/R_Custom/step2">step2<!-- 메인 토핑(치즈,고기,해산물) --></a> >
	<a href="/R_Custom/step3">step3<!-- 소스 --></a> >
	<a href="/R_Custom/step4">step4<!-- 도시락 크기 --></a> >
	</nav>
	<br>
	
	<h2>고기 목록</h2>
	<!-- 재료DB에서 카테고리 2(고기) 받아오기 -->
	<c:forEach var="vo" varStatus="status" items="${ingredientList }">
<%-- 	  <form name="igdt${status.count}" action=""> --%>
	  <form action="" method="POST">
	    <p>${vo.igdt_name }</p>
	    <p>${vo.igdt_price }</p>
	    <input type="hidden" name="igdt_name" value="${vo.igdt_name }">
	    <input type="hidden" name="igdt_price" value="${vo.igdt_price }">
	    <!-- 차후 구현 -->
	    <!-- radio 버튼이 checked면 추가, 아니면 삭제 -->
	    <!-- <input type="radio" name="isOn" value="add">추가 -->
	    <!--  -->
	    <input type="submit" class="add" value="추가">
	  </form>
	</c:forEach>
	
	
	
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="이전" onclick="location.href='/R_Custom/step1'">
	<input type="button" value="다음" onclick="location.href='/R_Custom/step3'">
	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">

<%@ include file="../include/footer.jsp" %>