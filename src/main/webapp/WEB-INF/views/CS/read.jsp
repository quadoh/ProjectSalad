<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h2 class="box-title">read.jsp</h2>
				</div>
				<!-- /.box-header -->

				<!-- form 수정/삭제 처리 -->
				<form role="form" action="" method="post">
					<!-- 글 번호를 저장 -->
					<input type="hidden" name="customer_b_num"
						value="${CS_vo.customer_b_num }">
				</form>

				<div class="box-body">

					<div class="form-group">
						<label for="CS_Board1">문의유형</label> <input type="text"
							name="customer_b_type" class="form-control" id="CS_Board1"
							value="${CS_vo.customer_b_type }" readonly>
					</div>

					<div class="form-group">
						<label for="CS_Board2">글쓴이</label> <input type="text" name="m_id"
							class="form-control" id="CS_Board2" value="${CS_vo.m_id }"
							readonly>
					</div>

					<div class="form-group">
						<label for="CS_Board3">제목</label> <input type="text"
							name="customer_b_title" class="form-control" id="CS_Board3"
							value="${CS_vo.customer_b_title }" readonly>
					</div>

					<div class="form-group">
						<label for="CS_Board4">상품번호</label> <input type="text"
							name="order_num" class="form-control" id="CS_Board4"
							value="${CS_vo.order_num }" readonly>
					</div>

					<div class="form-group">
						<label for="CS_Board5">내용</label>
						<textarea class="form-control" name="customer_b_content" rows="3"
							readonly>${CS_vo.customer_b_content }</textarea>
					</div>

				</div>

				<div class="box-footer">
					<button type="submit" class="btn CS_btn-warning">수정하기</button>
					<button type="submit" class="btn CS_btn-danger">삭제하기</button>
					<button type="submit" class="btn CS_btn-primary">목록으로</button>
				</div>

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

<!-- 제이쿼리 스크립트 추가구문 -->
<script src="https://code.jquery.com/jquery-2.1.4.js"
	integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(document).ready(function() {
		// 버튼 클릭시 이벤트 처리

		// form태그 정보 가져오기
		var fr = $("form[role='form']"); //id값 없이 속성값으로 접근
		//$("#fr"); //id값이 있을경우
		//alert(fr);
		console.log(fr);

		// 1) 수정하기
		$(".CS_btn-warning").click(function() {
			alert("수정 페이지로 이동합니다. ");
			// 폼태그의 정보(글번호)를 저장해서 
			// 글 수정 페이지로 이동(submit)
			// /board/modify

			fr.attr("action", "/CS/modify");
			fr.attr("method", "get");
			fr.submit();

		});

		// 2) 삭제하기
		$(".CS_btn-danger").click(function() {
			fr.attr("action", "/CS/remove");
			fr.submit();
		});

		// 3) 목록으로

		$(".CS_btn-primary").click(function() {
			location.href = "/CS/listAll";
		});

	});
</script>