<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<!-- Main content -->
<section class="content">
	<div class="row" style="margin:auto;text-align:center;">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h2 class="box-title"> </h2>
				</div>
				<!-- /.box-header -->

				<!-- form  시작 -->

				<form role="form" action="" method="post" style="display:inline-block;">
					<%-- <input type="hidden" name="bno" value="${uvo.bno }"> --%>

					<div class="box-body">

						<div class="form-group">
							<label for="CS_Board6">글번호</label> <input type="text"
								name="customer_b_num" readonly class="form-control"
								id="CS_Board6" value="${CS_uvo.customer_b_num }">
						</div>

						<div class="form-group">
							<label for="CS_Board1">문의유형</label> <input type="text"
								name="customer_b_type" class="form-control" id="CS_Board1"
								placeholder="유형을 입력하세요...." value="${CS_uvo.customer_b_type }">
						</div>

						<!-- 글쓴이는 m_id로 접속하기때문에 readonly로 박았습니다 그래서 수정후 작성자가 사라짐요 ㅠㅠ -->
						<div class="form-group">
							<label for="CS_Board2">글쓴이</label> <input type="text" name="m_id"
								class="form-control" id="CS_Board2" placeholder="글쓴이를 입력하세요...."
								value="${CS_vo.m_id }" readonly>
						</div>

						<div class="form-group">
							<label for="CS_Board3">제목</label> <input type="text"
								name="customer_b_title" class="form-control" id="CS_Board3"
								placeholder="제목을 입력하세요...." value="${CS_uvo.customer_b_title }">
						</div>

						<div class="form-group">
							<label for="CS_Board4">상품번호</label> <input type="text"
								name="order_num" class="form-control" id="CS_Board4"
								placeholder="상품번호를 입력하세요...." value="${CS_uvo.order_num }">
						</div>

						<div class="form-group">
							<label for="CS_Board5">내용</label>
							<textarea class="form-control" name="customer_b_content" rows="3" cols="60"
								placeholder="내용을 입력하세요....">${CS_uvo.customer_b_content }</textarea>
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-success CS_btn-danger">수정하기</button>
						<button type="submit" class="btn btn-primary CS_btn-primary">취소하기</button>
					</div>
				</form>

				<!-- form  끝 -->


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- 수정하기/취소하기 버튼 클릭 이벤트 -->

<!-- 제이쿼리 스크립트 추가구문 -->
<script src="https://code.jquery.com/jquery-2.1.4.js"
	integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {

		// 폼태그 정보 가져오기
		var frObj = $("form[role='form']");

		//  수정하기 - post 방식으로 이동
		$(".CS_btn-danger").on("click", function() {
			frObj.submit();
		});

		//  취소하기 - listAll 페이지 이동
		$(".CS_btn-primary").click(function() {
			location.href = "/board/listAll";
		});

	});
</script>
<%@ include file="../include/footer.jsp" %>