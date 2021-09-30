<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<h1>커스텀 샐러드 첫화면</h1>
	<!-- jquery ajax를 사용해서 화면 깜빡임 없이 step 1~4 부를 수 있게 구현 -->

	<nav>
	<a href="/R_Custom/step1">step1<!-- 야채 --></a> >
	<a href="/R_Custom/step2">step2<!-- 메인 토핑(치즈,고기,해산물) --></a> >
	<a href="/R_Custom/step3">step3<!-- 소스 --></a> >
	<a href="/R_Custom/step4">step4<!-- 도시락 크기 --></a> >
	</nav>
	<br>
	
	<!-- 샐러드 커스텀 DB에서 지금 세션에 있는 id 있으면 삭제 -> 새로 만들기, 없으면 새로 만들기 -->
	<form role="form" action="" method="post">
		<button type="submit" class="btn1">새로운 샐러드 만들기</button>
		<button type="submit" class="btn2">기존 샐러드 수정</button>
	</form>

	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">
	
	<script>
		$(document).ready(function() {
			// 폼태그 정보 가져오기
			var fr = $("form[role='form']");
			
			// 새로운 샐러드 만들기 - post
			if(".btn1").on("click",function(){
				fr.submit();
			});
			
			// 기존 샐러드 수정 - step1 페이지 이동
			if(".btn2").on("click",function(){
				location.href="/R_Custom/step1";
			});
		});
	</script>

<%@ include file="../include/footer.jsp" %>