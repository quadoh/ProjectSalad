<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>





<style>
th, td {
	text-align: center;
}
</style>

<div class="col-xs-12" style="padding-top: 70px;">
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">${mvo.m_id }님 개인 정보</h3>
			<div class="box-tools"></div>
		</div>
		<!-- /.box-header -->
		<div class="box-body table-responsive">
			<table class="table table-hover table-bordered">
				<tbody>
					<tr>
						<td>ID</td>
						<td>${mvo.m_id }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${mvo.m_name }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${mvo.m_email }</td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td>${mvo.m_zip }</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>${mvo.m_addr1 }</td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td>${mvo.m_addr2 }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${mvo.m_phone }</td>
					</tr>
					<tr>
						<td>가입일자</td>
						<td>${mvo.m_regdate }</td>
					</tr>
					<tr>
						<td>회원등급</td>
						<td><c:choose>
								<c:when test="${ mvo.m_totalAmount > 1000000 }">VVIP</c:when>
								<c:when test="${ mvo.m_totalAmount <= 1000000 }">VIP</c:when>
								<c:when test="${ mvo.m_totalAmount <= 500000 }">GOLD</c:when>
								<c:when test="${ mvo.m_totalAmount <= 100000 }">SILVER</c:when>
								<c:otherwise>BRONZE</c:otherwise>

							</c:choose></td>
					</tr>
					<tr>
						<td>누적구매액</td>
						<td>${mvo.m_totalAmount }</td>
					</tr>
					<tr>
						<td>포인트</td>
						<td><c:set var="point" value="${ovo.order_total_price*0.01 }" />
							<c:forEach var="ovo" items="${order_pay_num }">
								<c:set var="pointSum" value="${point+ovo}" />

							</c:forEach> <c:out value="${pointSum }" /></td>
					</tr>
					<tr>
						<td>출석횟수</td>
						<td>${mvo.m_attendance }</td>
					</tr>
					<tr>
						<td>경고횟수</td>
						<td>${mvo.m_warning }</td>
					</tr>
					<tr>
						<td>쿠폰정보</td>
						<td>${mvo.m_coupon }</td>
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
	<button type="button" class="btn btn-primary">수정하기</button>
	<button type="button" class="btn btn-danger">삭제하기</button>
	<button type="button" class="btn btn-success">마이페이지로</button>
</div>




<!-- 제이쿼리 -->
<script type="text/javascript">
	$(document).ready(function() {

		// 1) 수정하기 버튼 제어
		$(".btn-primary").click(function() {
			location.href = "./memberUpdate?m_id=${mvo.m_id}";

		});

		// 2) 삭제하기
		$(".btn-danger").click(function() {
			location.href = "./memberDelete?m_id=${mvo.m_id}";
		});

		// 3) 목록으로
		$(".btn-success").click(function() {
			location.href = "./myPage?m_id=${mvo.m_id}";
		});

	});
</script>
<%@ include file="../include/footer.jsp"%>