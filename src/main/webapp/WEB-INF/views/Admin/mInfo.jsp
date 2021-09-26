<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="header.jsp"%>

   <div class="col-xs-12" style="padding-top: 70px;">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> 회원 개인 정보 </h3>
              <div class="box-tools">
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table class="table table-hover table-bordered">
                <tbody><tr>
                  <th>ID</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>우편번호</th>
                  <th>주소</th>
                  <th>상세주소</th>
                  <th>전화번호</th>
                  <th>가입일자</th>
                  <th>회원등급</th>
                  <th>누적구매액</th>
                  <th>출석횟수</th>
                  <th>경고횟수</th>
                  <th>쿠폰정보</th>
                </tr>
   				<tr>
   					<td>${mvo.m_id }</td>
   					<td>${mvo.m_name }</td>
   					<td>${mvo.m_email }</td>
   					<td>${mvo.m_zip }</td>
   					<td>${mvo.m_addr1 }</td>
   					<td>${mvo.m_addr2 }</td>
   					<td>${mvo.m_phone }</td>
   					<td>${mvo.m_regdate }</td>
   					<c:choose>
    					<c:when test="${mvo.m_grade == 1}">
        					<td><span class="label label-success">레벨1</span></td>
   					 	</c:when>
   					 	<c:when test="${mvo.m_grade == 2}">
        					<td><span class="label label-warning">레벨2</span></td>
   					 	</c:when>
   					 	<c:when test="${mvo.m_grade == 3}">
        					<td><span class="label label-primary">레벨3</span></td>
   					 	</c:when>
   					 	<c:when test="${mvo.m_grade == 4}">
        					<td><span class="label label-danger">레벨4</span></td>
   					 	</c:when>
					</c:choose>     						
   					<td>${mvo.m_totalAmount }</td>
   					<td>${mvo.m_attendance }</td>
   					<td>${mvo.m_warning }</td>
   					<td>${mvo.m_coupon }</td>
   	    		</tr> 		  		
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

		<div class="btn-group" role="group" style="text-align:center; padding: 0px 0px 560px 15px;" aria-label="Basic mixed styles example">
			<button type="button" class="btn btn-primary">수정하기</button>
			<button type="button" class="btn btn-danger">삭제하기</button>
			<button type="button" class="btn btn-success">목록으로</button>
	    </div>
	    	    
	<!-- 제이쿼리 -->
	 <script type="text/javascript">
	    $(document).ready(function(){
	    	
	    	// 1) 수정하기 버튼 제어
	    	$(".btn-primary").click(function(){
	    		location.href = "./mUpdate?m_id=${mvo.m_id}";   
	    		
	    	});
	    	
	    	// 2) 삭제하기
	    	$(".btn-danger").click(function(){	    		
	    		location.href="./mDelete?m_id=${mvo.m_id}";
	    	});	    	
	    	
	    	// 3) 목록으로
	    	$(".btn-success").click(function(){
	    		location.href = "./mListAll?pageNum=${pageNum }"; 
	    	});	    	
	    	
	    });	    
	 </script>

<%@ include file="footer.jsp"%>