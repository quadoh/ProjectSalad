<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>
	
<h1 style="text-align: center; padding-top: 30px;">샐러드 재료 등록</h1>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">재료 정보</h3>
		</div>
		<form action="" method="post" id="igdtRegisterForm" name="igdtRegisterForm">
			<div class="box-body">
				<div class="form-group">
					<label for="igdt_num">재료 번호</label> 
					<input type="text" class="form-control" id="igdt_num" name="igdt_num">
				</div>
				<div class="form-group">
					<label for="igdt_category">재료 카테고리</label>
					<select class="form-control" name="igdt_category" id="igdt_category" >
					 	<option selected>=== 선택 ===</option>
	                    <option value="1">option 1</option>
	                    <option value="2">option 2</option>
	                    <option value="3">option 3</option>
	                    <option value="4">option 4</option>
	                    <option value="5">option 5</option>
                	</select> 
				</div>
				<div class="form-group">
					<label for="igdt_name">재료 이름</label> 
					<input type="text" class="form-control" id="igdt_name" name="igdt_name">
				</div>
				<div class="form-group">
					<label for="igdt_price">재료 가격</label> 
					<input type="text" class="form-control" id="igdt_price" name="igdt_price" >
				</div>
				<div class="form-group">
                  <label for="igdt_main_img">대표사진</label>
                  <input type="file" id="igdt_main_img" name="igdt_main_img">
                  <p class="help-block">재료 대표 이미지를 등록해주세요.</p>
                </div>
                <div class="form-group">
                  <label for="igdt_sub_img">보조이미지</label>
                  <input type="file" id="igdt_sub_img" name="igdt_sub_img">
                  <p class="help-block">재료 보조 이미지를 등록해주세요.</p>
                </div>
				<div class="form-group">
					<label for="igdt_country">원산지</label> 
					<input type="text" class="form-control" id="igdt_country" name="igdt_country" >
				</div>
				<div class="form-group">
					<label for="igdt_info">재료 정보</label> 
					<input type="text" class="form-control" id="igdt_info" name="igdt_info">
				</div>
				<div class="form-group">
					<label for="igdt_count">재고</label> 
					<input type="text" class="form-control" id="igdt_count" name="igdt_count" >
				</div>
				<div class="form-group">
					<label for="igdt_tag">재료 종류</label> 
					<input type="text" class="form-control" id="igdt_tag" name="igdt_tag" >
				</div>
				<div class="form-group">
					<label for="igdt_size">재료 크기</label> 
					<input type="text" class="form-control" id="igdt_size" name="igdt_size" >
				</div>
				<div class="box-footer">
				<button type="submit" class="btn btn-primary">등록하기</button>
				<button type="button" class="btn btn-primary" onclick="location.href='./igdtListAll';">목록으로</button>
				</div>
			</div>
		</form>
	</div>
</section>

<script type="text/javascript">
	
	/* 메인 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		let formData = new FormData();
		let fileInput1 = $("input[name='igdt_main_img']");
		let fileList1 = fileInput1[0].files;
		let fileObj1 = fileList1[0];
		
		if(!fileCheck(fileObj1.name, fileObj1.size)){	
			return false;
		}		

		formData.append("igdt_main_img", fileObj1);
		
		$.ajax({
			url: '/Admin/igdtImgRegister',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	
	});
	
	/* 보조 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		let formData = new FormData();
		let fileInput2 = $("input[name='igdt_sub_img']");
		let fileList2 = fileInput2[0].files;
		let fileObj2 = fileList2[0];
		
		if(!fileCheck(fileObj2.name, fileObj2.size)){	
			return false;
		}		

		formData.append("igdt_main_img", fileObj2);
		
		$.ajax({
			url: '/Admin/igdtImgRegister',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json'
		});	
				
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //10MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}		
		return true;		
	}
	
</script>
 <%@ include file="footer.jsp"%>