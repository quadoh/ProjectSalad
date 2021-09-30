<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
th, td {
text-align: center;
}

section{
padding: 100px 100px 100px 100px;  
}

h2{
padding-top: 50px;
}
</style>

<h2 style="text-align: center;"> 고객센터 게시판</h2>

<section class="content"  >
<div class="row">
	<div class="col-sm-12">
			<div class="box">
				<div class="box-header" style="padding-bottom: 20px;">
					<h4 class="box-title"> 총 ${pm.totalCount }개의 글</h4>
				</div>
				<table class="table table-bordered table-hover dataTable">
					<thead>
						<tr role="row">
							<th >글번호</th>
							<th >글 유형</th>
							<th >글 제목</th>
							<th >회원 아이디</th>
							<th >작성 일자</th>
							<th >답변상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="csvo" items="${listAll }">
							<tr role="row" class="odd">
								<td class="sorting_1">${csvo.customer_b_num }</td>
								<c:choose>
	    							<c:when test="${csvo.customer_b_type == 1}">
	        							<td><span class="label label-success">상품 관련 문의</span></td>
	   					 			</c:when>
	   					 			<c:when test="${csvo.customer_b_type == 2}">
	        							<td><span class="label label-warning">주문 관련 문의</span></td>
	   					 			</c:when>
	   					 			<c:when test="${csvo.customer_b_type == 3}">
	        							<td><span class="label label-primary">서비스 관련 문의</span></td>
	   					 			</c:when>
	   					 			<c:when test="${csvo.customer_b_type == 4}">
	        							<td><span class="label label-danger">고객 의견</span></td>
	   					 			</c:when>
	   					 			<c:otherwise> 
	   					 				<td><span class="label label-danger">기타 문의</span></td>
	   					 			</c:otherwise>
								</c:choose>   	
								<td><a href="/CS/read?customer_b_num=${csvo.customer_b_num }&pageNum=${pm.cri.pageNum }">${csvo.customer_b_title }</a></td>
								<td>${csvo.m_id }</td>
								<td>${csvo.customer_b_date }</td>
								<c:choose>
	    							<c:when test="${csvo.customer_b_status == 0}">
	        							<td><span class="label label-success">답변대기중</span></td>
	   					 			</c:when>
	   					 			<c:when test="${csvo.customer_b_type == 1}">
	        							<td><span class="label label-warning">답변완료</span></td>
	   					 			</c:when>
								</c:choose>   
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-sm-5">
					<div class="dataTables_info">Showing ${pm.cri.pageNum } to ${pm.endPage }</div>
				</div>
			</div>
	<!-- /.box-body -->
			<div class="row">
			 <div class="col-md-5"></div>
  			 <div class="col-md-4">
				<ul class="pagination">	
					<!-- 이전 -->
					<c:if test="${pm.prev }">
						<li><a href="listAll?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
					</c:if>
					<!-- 페이지 번호 -->
					<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
						<li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
							<a href="listAll?pageNum=${idx }">${idx }</a>
						</li>
					</c:forEach>
					<!-- 다음 -->
					<c:if test="${pm.next && pm.endPage > 0 }">
						<li><a href="listAll?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
					</c:if>
				</ul>
			</div>
  			 <div class="col-md-3"></div>
			</div>
			<div class="form-row float-right">
				<button class="btn btn-primary" type="button" onclick="javascript:CS_Board_Register();">글 작성하기</button>
			</div>
			<!-- col end -->
			</div>
		<!--row end -->
		</div>
	</section>
		
<script type="text/javascript">

	// 전달된 데이터를 저장 (el표현식의 값)
	var result = '${result}';
	
	if(result == 'success'){
        alert(" 글쓰기 정상처리 완료! ");
    }
	
	/** 게시판 - 작성 페이지 이동 */
    function CS_Board_Register(){        
        location.href = "/CS/register";
    }
	
</script>

<%@ include file="../include/footer.jsp" %>