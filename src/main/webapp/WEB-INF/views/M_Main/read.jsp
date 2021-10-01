<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<style>
tr, td {
	text-align: center;
}
</style>

<div class="col-xs-12" style="padding-top: 70px;">
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">${vo.m_id }님 주문 상세 정보</h3>
			<div class="box-tools"></div>
		</div>
		<!-- /.box-header -->
		<div class="box-body table-responsive">
			<table class="table table-hover table-bordered">
				<tbody>
					<tr>
						<td>주문번호</td>
						<td>${vo.order_num }</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${vo.m_id }</td>
					</tr>
					<tr>
						<td>레시피번호</td>
						<td>${vo.rcp_num }</td>
					</tr>
					<tr>
						<td>쿠폰아이디</td>
						<td>${vo.coupon_id }</td>
					</tr>
					<tr>
						<td>결제번호</td>
						<td>${vo.order_pay_num }</td>
					</tr>
					<tr>
						<td>레시피 이름</td>
						<td>${vo.rcp_name }</td>
					</tr>
					<tr>
						<td>주문자</td>
						<td>${vo.order_name }</td>
					</tr>
					<tr>
						<td>주문날짜</td>
						<td>${vo.order_date}</td>
					</tr>
					<tr>
						<td>수취인 이름</td>
						<td>${vo.order_receive_name }</td>
					</tr>
					<tr>
						<td>수취인 휴대폰</td>
						<td>${vo.order_receive_phone }</td>
					</tr>
					<tr>
						<td>수취인 우편번호</td>
						<td>${vo.order_receive_zip }</td>
					</tr>
					<tr>
						<td>수취인 주소</td>
						<td>${vo.order_receive_addr1 }</td>
					</tr>
					<tr>
						<td>수취인 상세주소</td>
						<td>${vo.order_receive_addr2 }</td>
					</tr>
					<tr>
						<td>거래방법</td>
						<td>${vo.order_type }</td>
					<tr>
					<tr>
						<td>주문수량</td>
						<td>${vo.order_amount }</td>
					<tr>
					<tr>
						<td>배송비</td>
						<td>${vo.order_ship_price }</td>
					<tr>
					<tr>
						<td>결재가격</td>
						<td>${vo.order_total_price}</td>
					<tr>
					<tr>
						<td>상태</td>
						<td><c:choose>
								<c:when test="${vo.order_status == 0}">
			결제대기
			<button type="button" class="btn btn-update">주문수정</button>
									<button type="button" class="btn btn-remove">주문취소</button>
								</c:when>

								<c:when test="${vo.order_status == 1}">
			결제완료
			<button type="button" class="btn btn-update">주문수정</button>
									<button type="button" class="btn btn-remove">주문취소</button>
								</c:when>

								<c:when test="${vo.order_status == 2}">
			배송중
		</c:when>

								<c:when test="${vo.order_status == 3}">
			배송완료
		</c:when>

								<c:when test="${vo.order_status == 4}">
			구매확정
		</c:when>

								<c:when test="${vo.order_status == 5}">
			거래완료
		</c:when>

								<c:otherwise>
			주문 확인 중 입니다
		</c:otherwise>
							</c:choose></td>
					<tr>
				</tbody>
			</table>
		</div>
		<!-- /.box-body -->
	</div>
	<!-- /.box -->
</div>
<div class="btn-group" role="group"
	style="text-align: center; padding: 0px 0px 560px 15px;"
	aria-label="Basic mixed styles example">
	<button type="button" class="btn btn-primary">마이페이지로</button>
	<button type="button" class="btn btn-danger">주문목록으로</button>
</div>



<!-- 제이쿼리 -->
<script type="text/javascript">
	$(document).ready(function() {

		// 1) 수정하기 버튼 제어
		$(".btn-update").click(function() {
			location.href = "./orderUpdate?order_num=${vo.order_num}";

		});

		// 2) 삭제하기
		$(".btn-remove").click(function() {
			location.href = "./orderDelete?order_num=${vo.order_num}";
		});

		// 3) 마이페이지로
		$(".btn-primary").click(function() {
			location.href = "./myPage";
		});
		
		// 3) 목록으로
		$(".btn-danger").click(function() {
			location.href = "./orderList";
		});

	});
</script>
<%@ include file="../include/footer.jsp"%>
