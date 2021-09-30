<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

	<!-- 변수작성 규칙: 자기 담당파일명_개별페이지_요소 (예시 - MJoin_register_btn : 회원가입 입력페이지 버튼명) -->

	<div style="margin:auto;text-align:center;">
	<form action="" method="post" style="display:inline-block;">

		문의유형 : <input type="text" class="form-control" name="customer_b_type" id="CS_Board1" placeholder="문의유형을 입력하세요"> <br> 
		
		글쓴이 : <input type="text" class="form-control" name="m_id" id="CS_Board2" placeholder="글쓴이"> <br> 
		
		제목 : <input type="text" class="form-control" name="customer_b_title" id="CS_Board3" placeholder="문의하실 제목을 입력하세요"> <br> 
		
		상품번호(선택사항) :
<!-- 		 상품번호 ex) ord-124 이러면 오류뜨고 숫자만 넣으면 정상처리됨 타입을 int에서 string으로 변경 해야 하는지 건의해야함   -->
		<input type="text" class="form-control" name="order_num" id="CS_Board4" placeholder="상품번호(선택사항)"> <br> 
		
		내용 :
		<textarea class="form-control" name="customer_b_content" rows="3" cols="60" placeholder="문의내용을 입력하세요"></textarea>
		<br>

		<button class="btn btn-success" type="CS_b_register_submit">글쓰기</button>

	</form>
	</div>


<%@ include file="../include/footer.jsp" %>