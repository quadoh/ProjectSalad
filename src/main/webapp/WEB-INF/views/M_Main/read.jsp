<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h2>주문 상세페이지</h2>

	<h3>주문번호 : ${vo.order_num }</h3>
	<h3>아이디 : ${vo.m_id }</h3>
	<h3>레시피번호 : ${vo.rcp_num }</h3>
	<h3>쿠폰아이디 : ${vo.coupon_id }</h3>
	<h3>결제번호 : ${vo.order_pay_num }</h3>
	<h3>레시피 이름 : ${vo.rcp_name }</h3>
	<h3>주문자 : ${vo.order_name }</h3>
	<h3>주문날짜 : ${vo.order_date}</h3>

	<h3>받는사람 이름 : ${vo.order_receive_name }</h3>


	<h3>받는사람 휴대폰 : ${vo.order_receive_phone }</h3>
	<h3>받는사람 휴대폰 : ${vo.order_receive_zip }</h3>
	<h3>받는사람 휴대폰 : ${vo.order_receive_addr1 }</h3>
	<h3>받는사람 휴대폰 : ${vo.order_receive_addr2 }</h3>
	<h3>거래방법 : ${vo.order_type }</h3>
	<h3>주문수량 : ${vo.order_amount }</h3>
	<h3>배송비 : ${vo.order_ship_price }</h3>
	<h3>결재가격 : ${vo.order_total_price}</h3>

	<h3>
		상태 : <!-- 숫자->한글로 바꾸기 result = 0,1일때만 주문취소 변경 버튼 나오게함-->  

<c:choose>
		<c:when test="${vo.order_status == 0">
			결제대기
			<button type="button" class="btn-update">주문수정</button>
			<button type="button" class="btn-remove">주문취소</button>
		</c:when>

		<c:when test="${vo.order_status == 1">
			결제완료
			<button type="button" class="btn-update">주문수정</button>
			<button type="button" class="btn-remove">주문취소</button>
		</c:when>

		<c:when test="${vo.order_status == 2">
			배송중
		</c:when>

		<c:when test="${vo.order_status == 3">
			배송완료
		</c:when>

		<c:when test="${vo.order_status == 4">
			구매확정
		</c:when>

		<c:when test="${vo.order_status == 5">
			거래완료
		</c:when>
		
		<c:otherwise>
			주문 확인 중 입니다
		</c:otherwise>
</c:choose>		
		
	</h3>
	<div>
		<button type="button" class="btn-mypage">마이페이지로</button>
		<button type="button" class="btn-orderList">주문목록으로</button>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			// 버튼 클릭시 이벤트 처리

			// form태그 정보 가져오기
			var fr = $("form[role='form']"); //id값 없이 속성값으로 접근
			//$("#fr"); //id값이 있을경우
			//alert(fr);
			console.log(fr);

			// 1) 수정하기
			$(".btn-update").click(function() {
				alert("수정하러가기 ");
				// 폼태그의 정보(글번호)를 저장해서 
				// 글 수정 페이지로 이동(submit)
				// /board/modify

				fr.attr("action", "/m_main/updateOrder");
				fr.attr("method", "get");
				fr.submit();

			});

			// 2) 삭제하기
			$(".btn-remove").click(function() {
				fr.attr("action", "/m_main/remove");
				fr.submit();
			});

			// 3)마이페이지로

			$(".btn-mypage").click(function() {
				alert("마이페이지로");
				location.href = "/m_main/mapage";
			});

			//주문목록으로

			$(".btn-orderList").click(function() {
				alert("주문목록으로");
				location.href = "/m_main/orderList";
			});

		});
	</script>

</body>
</html>