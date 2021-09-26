<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	

	<form role="form" name="orderList">
		<table border="1">
			<tr>
				<td>주문번호</td>
				<td>결제번호</td>
			</tr>

			<c:forEach var="ovo" items="${orderList }">
				<tr>
					<td>${ovo.order_num }</td>
					<td>${ovo.order_pay_num }</td>
				</tr>
			</c:forEach>
		</table>


		<a href="/m_main/mypage"><button type="button" class="btn-mypage">마이페이지로</button></a>







	</form>

	

</body>
</html>