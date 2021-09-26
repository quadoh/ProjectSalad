<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커스텀 샐러드</title>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>
</head>
<body>
	<h1>커스텀 샐러드 첫화면</h1>
	<!-- jquery ajax를 사용해서 화면 깜빡임 없이 step 1~4 부를 수 있게 구현 -->

	<a href="http://localhost:8088/R_Custom/step1">step1<!-- 도시락 크기 --></a><br>
	<a href="http://localhost:8088/R_Custom/step2">step2<!-- 야채 --></a><br>
	<a href="http://localhost:8088/R_Custom/step3">step3<!-- 메인 토핑(치즈,고기,해산물) --></a><br>
	<a href="http://localhost:8088/R_Custom/step4">step4<!-- 소스 --></a><br>
	
	
	<!-- main 화면일시 step1로 이동 -->
	<h2>스텝별 화면</h2>
	
	<!-- 각 스텝별로 다르게 -->
	<input type="button" value="이전">
	<input type="button" value="다음">
	
	<h2>현재 담긴 값(장바구니처럼)</h2>
	
	<input type="button" value="레시피 등록">
	<input type="button" value="구매">
	
	
</body>
</html>