<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<h1>도시락 크기 정하기</h1>

	<nav>
	<a href="/R_Custom/step1">step1<!-- 야채 --></a> >
	<a href="/R_Custom/step2">step2<!-- 메인 토핑(치즈,고기,해산물) --></a> >
	<a href="/R_Custom/step3">step3<!-- 소스 --></a> >
	<a href="/R_Custom/step4">step4<!-- 도시락 크기 --></a> >
	</nav>
	<br>
	
	
	<h2>도시락 크기 목록</h2>
	
	<p>소 <img width="240px" height="160" src="https://cdn.pixabay.com/photo/2016/08/09/10/30/tomatoes-1580273_960_720.jpg"></p>
	<p>중 <img width="240px" height="160" src="https://cdn.pixabay.com/photo/2021/01/10/04/37/salad-5904093_960_720.jpg"></p>
	<p>대 <img width="240px" height="160" src="https://cdn.pixabay.com/photo/2017/09/16/19/21/salad-2756467_960_720.jpg"></p>
	
	
	
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="이전" onclick="location.href='/R_Custom/step3'">
	
	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">

<%@ include file="../include/footer.jsp" %>