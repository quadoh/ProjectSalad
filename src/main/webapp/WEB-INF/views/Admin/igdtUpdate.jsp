<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	
<h1 style="text-align: center; padding-top: 30px;">재료 재고 정보 수정</h1>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">샐러드 재료 재고 정보</h3>
		</div>
		<form action="" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="order_num">재료 번호</label> 
					<input type="text" class="form-control" id="igdt_num" name="igdt_num"  value=${ivo.igdt_num } disabled="disabled">
				</div>
				<div class="form-group">
					<label for="m_id">재료 카테고리</label> 
					<input type="text" class="form-control" id="igdt_category" name="igdt_category"  value=${ivo.igdt_category }>
				</div>
				<div class="form-group">
					<label for="rcp_num">재료 이름</label> 
					<input type="text" class="form-control" id="igdt_name" name="igdt_name"  value=${ivo.igdt_name }>
				</div>
				<div class="form-group">
					<label for="coupon_id">재료 가격 </label> 
					<input type="text" class="form-control" id="igdt_price" name="igdt_price"  value=${ivo.igdt_price }>
				</div>
				<div class="form-group">
					<label for="order_pay_num">대표 사진</label> 
					<input type="text" class="form-control" id="igdt_main_img" name="igdt_main_img"  value=${ivo.igdt_main_img }>
				</div>
				<div class="form-group">
					<label for="rcp_name">보조 이미지</label> 
					<input type="text" class="form-control" id="igdt_sub_img" name="igdt_sub_img"  value=${ivo.igdt_sub_img }>
				</div>
				<div class="form-group">
					<label for="order_name">원산지</label> 
					<input type="text" class="form-control" id="igdt_country" name="igdt_country"  value=${ivo.igdt_country }>
				</div>
				<div class="form-group">
					<label for="order_date">재료 정보</label> 
					<input type="text" class="form-control" id="igdt_info" name="igdt_info"  value=${ivo.igdt_info }>
				</div>
				<div class="form-group">
					<label for="order_receive_name">재고</label> 
					<input type="text" class="form-control" id="igdt_count" name="igdt_count"  value=${ivo.igdt_count }>
				</div>
				<div class="form-group">
					<label for="order_receive_phone">재료 정보</label> 
					<input type="text" class="form-control" id="igdt_tag" name="igdt_tag"  value=${ivo.igdt_tag }>
				</div>
				<div class="form-group">
					<label for="order_receive_zip">재료 크기</label> 
					<input type="text" class="form-control" id="igdt_size" name="igdt_size"  value=${ivo.igdt_size }>
				</div>
				<div class="box-footer">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<button type="button" class="btn btn-success">목록으로</button>
				</div>
			</div>
		</form>
	</div>
</section>
<!-- 제이쿼리 -->
	 <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	// 목록으로
	    	$(".btn-success").click(function(){
	    		location.href = "./igdtListAll?pageNum=${pageNum }"; 
	    	});	    	
	    	
	    });	    
	 </script>
 <%@ include file="footer.jsp"%>