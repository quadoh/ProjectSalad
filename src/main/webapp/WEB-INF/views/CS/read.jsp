<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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
				<!-- 댓글 작성 구역 ------------------------------------------------------------------------>
				<div class="col-lg-12">
					<div class="card">
						<div class="card-header with-border">
							<h3 class="card-title">댓글 작성</h3>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="form-group col-sm-8">
									<input class="form-control input-sm" id="newReplyText" type="text" placeholder="댓글 입력...">
								</div>
								<div class="form-group col-sm-2">
									<input class="form-control input-sm" id="newReplyWriter" type="text" placeholder="작성자">
								</div>
								<div class="form-group col-sm-2">
									<button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn">
										<i class="fa fa-save"></i> 저장
									</button>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<ul id="replies">
							</ul>
						</div>
						<div class="card-footer">
							<nav aria-label="Contacts Page Navigation">
								<ul
									class="pagination pagination-sm no-margin justify-content-center m-0">
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<div class="modal fade" id="modifyModal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">댓글 수정창</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label for="reply_no">댓글 번호</label> 
									<input class="form-control" id="reply_no" name="reply_no" readonly>
								</div>
								<div class="form-group">
									<label for="reply_text">댓글 내용</label> 
									<input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
								</div>
								<div class="form-group">
									<label for="reply_writer">댓글 작성자</label> 
									<input class="form-control" id="reply_writer" name="reply_writer" readonly>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-success modalModBtn">수정</button>
								<button type="button" class="btn btn-danger modalDelBtn">삭제</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 댓글 목록/페이징 구역 ------------------------------------------------------------------------>

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

$(document).ready(function(){

	
	// 게시글 번호
	var reply_b_main_num = 1;
	
	// 목록 페이지 번호
	var pageNum = 1;

	// 댓글 목록 호출
	getReplies(); 

	// 댓글 목록 출력
	function getReplies() { 
		
		$.getJSON( "${path}/Reply/replyList/" + reply_b_main_num, function(data) {  
					
					console.log(data); 
					
					var str = ""; 
					
					$(data).each(function() { 
						str += "<li reply_b_num='" + this.reply_b_num + "' class='replyLi'>" 
						+ "<p class='reply_text'>" + this.reply_b_content + "</p>" 
						+ "<p class='reply_writer'>" + this.m_id + "</p>" 
						+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>" 
						+ "</li>" 
						+ "<hr/>"; 
					}); 
					
					$("#replies").html(str); 
					
		}); 
		
	}
	
});

 
</script>
<%@ include file="../include/footer.jsp" %>