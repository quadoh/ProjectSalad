<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/header.jsp"%>


<%
//세션제어
String id = (String) session.getAttribute("id");

if (id == null) {
	//response.sendRedirect("/web/member/login");
	response.sendRedirect("M_Login/login");
	//response.sendRedirect(request.getContextPath()+"member/login");
}
%>




<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="img/breadcrumb.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>마이페이지</h2>
					<div class="breadcrumb__option">
						<a href="./index.html">Home</a> <span>마이페이지</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="common__form">
			<h4>common__form</h4>
			<form action="#">

				<!-- 한줄에 여러개 나눠야 할때 -->
				<div class="row">
					<div class="col-lg-6">
						<div class="common__input">
							<p>
								<a href="./memberInfo">회원 정보 조회</a>
							</p>

						</div>
					</div>
					<div class="col-lg-6">
						<div class="common__input">
							<p>
								<a href="./updateMember">회원 정보 수정</a>
							</p>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="common__input">
							<p>
								<a href="./orderList">주문 목록</a>
							</p>

						</div>
					</div>
					<div class="col-lg-6">
						<div class="common__input">
							<p>
								<a href="./deleteMember">회원 탈퇴</a>
							</p>

						</div>
					</div>
				</div>

				<!-- 한줄에 하나  -->
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">로그아웃</button>
					<button type="button" class="btn btn-success">메인으로</button>
				</div>
			</form>
		</div>


	</div>

</section>
<!-- Checkout Section End -->

<script type="text/javascript">
	/* 게시글 버튼 제어 영역 */
	$(document).ready(function() {

		// 2) 메인으로
		$(".CSB_btn_delete").click(function() {
			location.href = "/M_Login/main";
		});

	});
</script>




<%@ include file="../include/footer.jsp"%>
