<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	
<h1 style="text-align: center; padding-top: 30px;">개별 회원 쿠폰 발급</h1>

<section style="padding: 50px 50px 350px 50px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">쿠폰 정보</h3>
		</div>
		<form action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="coupon_id">쿠폰 아이디</label>
					<select class="form-control" name="m_coupon" id="m_coupon" >
					<c:forEach var="cvo" items="${couponListAll }">
	                    <option value="${cvo.coupon_id }">${cvo.coupon_id }</option>
					</c:forEach>
                	</select> 
				</div>
				<div class="form-group">
					<label for="coupon_name">해당 아이디</label> 
					<input type="text" class="form-control" id="m_id" name="m_id">
				</div>
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">등록하기</button>
			</div>
		</form>
	</div>
</section>
 <%@ include file="footer.jsp"%>