<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>

li {
list-style: none;
}

#modalBtn{
	margin-left: 100px;
}
</style>

<!-- Main content -->
<section class="content">
	<div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="contact__form__title">
                        <h2>고객센터 게시판</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                    	<label>문의유형</label>
                        <c:choose>
 							<c:when test="${CS_vo.customer_b_type == 1}">
 							<input type="text" value="상품 관련 문의" readonly="readonly">
				 			</c:when>
				 			<c:when test="${CS_vo.customer_b_type == 2}">
    						<input type="text" value="주문 관련 문의" readonly="readonly">
				 			</c:when>
				 			<c:when test="${CS_vo.customer_b_type == 3}">
    						<input type="text" value="서비스 관련 문의" readonly="readonly">
				 			</c:when>
				 			<c:when test="${CS_vo.customer_b_type == 4}">
    						<input type="text" value="기타 관련 문의" readonly="readonly">
				 			</c:when>
					</c:choose> 
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <label>글쓴이</label>
                        <input type="text" value="${CS_vo.m_id }" readonly="readonly">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <label>제목</label>
                        <input type="text" value="${CS_vo.customer_b_title }"  readonly="readonly">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <label>날짜</label>
                        <input type="text" value="${CS_vo.customer_b_date }"  readonly="readonly">
                    </div>
                    <div class="col-lg-12 text-center">
                    <label>문의내용</label>
                        <textarea readonly="readonly">${CS_vo.customer_b_content }</textarea>
                    </div>
                </div>
            </form>
            <!-- 게시글 버튼 제어 영역 ------------------------------------------------------------------------>	
			<div class="form-row">
				<%-- <c:if test="${session_id == CS_vo.m_id }">
					<button type="button" class="btn btn-success CSB_btn_modify">수정하기</button>
				</c:if> --%>
				<button type="button" class="btn btn-success CSB_btn_modify">수정하기</button>
				<button type="button" class="btn btn-primary CSB_btn_list">목록으로</button>
				<button type="button" class="btn btn-danger CSB_btn_delete">삭제하기</button>
			</div>
        </div>
    </div>	
	<!-- 고객센터 글 보기  -->
	<!-- 댓글 작성 구역 ------------------------------------------------------------------------>
	<div class="col-sm-10" style="padding: 20px 60px 80px 350px;">
		<div class="card">
			<!-- 댓글 작성 구역 ------------------------------------------------------------------------>
			<div class="card-header with-border">
				<h5 class="card-title">댓글 작성</h5>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="form-group col-sm-8">
						<input class="form-control input-sm" id="new_reply_b_content" type="text" placeholder="댓글 입력">
					</div>
					<div class="form-group col-sm-2">
						<input class="form-control input-sm" id="new_reply_m_id" type="text" value="${session_id }" readonly="readonly">
					</div>
					<div class="form-group col-sm-2">
						<button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn">
							<i class="fa fa-save"></i> 글쓰기
						</button>
					</div>
				</div>
			</div>
			<!-- 댓글 작성 구역 ------------------------------------------------------------------------>
			<!-- 댓글 목록 구역 ------------------------------------------------------------------------>
			<div class="card-footer">
				<ul id="replies"></ul>
			</div>
<!-- 	    <div class="card-footer">
					<nav aria-label="Contacts Page Navigation">
						<ul class="pagination pagination-sm no-margin justify-content-center m-0"></ul>
					</nav>
		    </div> -->
		</div>
	</div>
	<!-- 댓글 목록 구역 ------------------------------------------------------------------------>
	<!-- 댓글 수정 구역 ------------------------------------------------------------------------>
	<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정창</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply_b_num">댓글 번호</label> 
						<input class="form-control"	id="reply_b_num" name="reply_b_num" readonly>
					</div>
					<div class="form-group">
						<label for="reply_text">댓글 내용</label> 
						<input class="form-control" id="reply_b_content" name="reply_b_content" placeholder="댓글 내용을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="reply_writer">댓글 작성자</label> 
						<input class="form-control" id="reply_m_id" name="reply_m_id" readonly>
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
	<!-- 댓글 수정 구역 ------------------------------------------------------------------------>
</section>
<!-- /.content -->

<form role="form" action="" method="post">
	<!-- 글 번호를 저장 -->
	<input type="hidden" name="customer_b_num"
		value="${CS_vo.customer_b_num }">
</form>

<!-- 자바스크립트 구문 -->

<script type="text/javascript">

/* 본인 댓글만 수정 가능 */
function modifyCk(){
	
	var id = $("#new_reply_m_id");
	var m_id = $("reply_m_id");
	
	if (id.val() !== m_id.val()){
		alert("본인 댓글만 수정할 수 있습니다.");
		return false;
	}
}

	/* 게시글 버튼 제어 영역 */
	$(document).ready(function() {

		// form태그 정보 가져오기
		var fr = $("form[role='form']"); //id값 없이 속성값으로 접근

		// 1) 수정하기
		$(".CSB_btn_modify").click(function() {
			alert("수정 페이지로 이동합니다. ");
			// 폼태그의 정보(글번호)를 저장해서 
			// 글 수정 페이지로 이동(submit)
			// /board/modify

			fr.attr("action", "/CS/modify");
			fr.attr("method", "get");
			fr.submit();

		});

		// 2) 삭제하기
		$(".CSB_btn_delete").click(function() {
			fr.attr("action", "/CS/delete");
			fr.submit();
		});

		// 3) 목록으로

		$(".CSB_btn_list").click(function() {
			location.href = "/CS/listAll";
		});
	});

	/*  댓글 제어 영역 */	
	$(document).ready(function(){
	 
			// 1번째 게시글 
			var reply_b_main_num = ${CS_vo.customer_b_num} ; 
			
			// 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지) 
			//var PageNum = 1; 
			
			// 댓글 목록 호출 
			//getRepliesPaging(PageNum); 
			
			getReplies();
			
			// 댓글 목록 출력 함수 
			function getReplies() { 
				
				$.getJSON("${path}/Reply/list/" + reply_b_main_num, function (data) { 
					
					console.log(data); 
					
					var str = ""; 
					
					$(data).each(function () { 
						
						str += "<li reply_b_num='" + this.reply_b_num + "'class='replyLi'>" 
							+ "<p class='reply_b_content'>" + this.reply_b_content + "</p>" 
							+ "<span class='reply_m_id'>" + this.reply_m_id +"("+ this.reply_b_ip + ")"+"</span>" 
							+ "<button id='modalBtn' onclick='javascript:modifyCk();' type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>" 
							+ "</li>" + "<hr/>"; 
							
					}); 
					
					$("#replies").html(str); 
					
				}); 
				
			} 
			
			
			/* //페이징 처리
			function getRepliesPaging(page) { 
				
				$.getJSON("${path}/Reply/paging/"+reply_b_main_num+"/"+page, function (data) { 
						
					console.log(data); 
						
						var str = ""; 
						
						$(data.replyList).each(function () { 
							str += "<li data-reply_no='" + this.reply_b_num + "' class='replyLi'>" 
								+ "<p class='reply_b_content'>" + this.reply_b_content + "</p>" 
								+ "<p class='reply_m_id'>" + this.reply_m_id + "</p>" 
								+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>" 
								+ "</li>" + "<hr/>"; 
								
						}); 
						
						$("#replies").html(str); 
						
						// 페이지 번호 출력 호출 
						printPageNumbers(data.pageMaker); 
						
				}); 
				
			} 
			
			// 댓글 목록 페이지 번호 출력 함수 
			function printPageNumbers(pageMaker) { 
				
				var str = ""; 
				
				// 이전 버튼 활성화 
				if (pageMaker.prev) { 
					str += "<li class=\"page-item\"><a class=\"page-link\" href='"+(pageMaker.startPage-1)+"'>이전</a></li>"; 
				} 
				
				// 페이지 번호 
				for (var i = pageMaker.startPage ; i <= pageMaker.endPage; i++) { 
					var strClass = pageMaker.criteria.page == i ? 'class=active' : ''; 
					
					str += "<li class=\"page-item\" "+strClass+"><a class=\"page-link\" href='"+i+"'>"+i+"</a></li>"; 
					
				} 
				
				// 다음 버튼 활성화 
				
				if (pageMaker.next) { 
					str += "<li class=\"page-item\"><a class=\"page-link\" href='"+(pageMaker.endPage + 1)+"'>다음</a></li>"; 
				} 
				
				$(".pagination-sm").html(str); 
			} 
			
			// 목록페이지 번호 클릭 이벤트 
			$(".pagination").on("click", "li a", function (event) { 
				event.preventDefault(); 
				
				PageNum = $(this).attr("href"); 
				// 목록 페이지 번호 추출 
				
				getRepliesPaging(PageNum); 
				// 목록 페이지 호출 
				
			}); 
			
	}); */
			
			$(".replyAddBtn").on("click",function() { 
				
				// 화면으로부터 입력 받은 변수값의 처리 
				var reply_b_content = $("#new_reply_b_content"); 
				var reply_m_id = $("#new_reply_m_id"); 
				var reply_b_contentVal = reply_b_content.val(); 
				var reply_m_idVal = reply_m_id.val(); 
				
				if(reply_m_idVal == ""){
					alert("로그인 후 이용해 주세요");
					return false;
				}
								
				// AJAX 통신 : POST 
				$.ajax({ 
					type : "post", 
					url : "${path}/Reply/register", 
					headers : { 
						"Content-type" : "application/json", 
						"X-HTTP-Method-Override" : "POST" 
					}, 
					dataType : "text", 
					data : JSON.stringify({ 
						reply_b_main_num : reply_b_main_num, 
						reply_b_content : reply_b_contentVal, 
						reply_m_id : reply_m_idVal 
					}), 
					success : function (result) { 
						// 성공적인 댓글 등록 처리 알림 
						
						if (result == "registerSuccess") { 
							alert("댓글 등록 완료!");
						} 
						
						//getRepliesPaging(PageNum); 
						
						// 댓글 목록 출력 함수 호출 
						getReplies();
						
						// 댓글 내용 초기화 
						reply_b_content.val(""); 
						
						// 댓글 작성자 초기화 
						reply_m_id.val(""); 
					} 
				}); 
				
			}); 
			
			$("#replies").on("click", ".replyLi button", function () { 
				var reply = $(this).parent(); 
				var reply_b_num = reply.attr("reply_b_num"); 
				var reply_b_content = reply.find(".reply_b_content").text(); 
				var reply_m_id = reply.find(".reply_m_id").text(); 
				
				$("#reply_b_num").val(reply_b_num); 
				$("#reply_b_content").val(reply_b_content); 
				$("#reply_m_id").val(reply_m_id); 
				
			}); 
			
			$(".modalDelBtn").on("click", function () { 
				// 댓글 번호 
				var reply_b_num = $(this).parent().parent().find("#reply_b_num").val(); 
				
				// AJAX통신 : DELETE 
				
				$.ajax({ 
					type : "delete", 
					url : "${path}/Reply/" + reply_b_num, 
					headers : { 
						"Content-type" : "application/json", 
						"X-HTTP-Method-Override" : "DELETE" 
					}, 
					dataType : "text", 
					success : function (result) { 
						console.log("result : " + result); 
						
						if (result == "deleteSuccess") { 
							alert("댓글 삭제 완료!"); 
							
							$("#modifyModal").modal("hide"); 
							// Modal 닫기 
							
							// 댓글 목록 출력 함수 호출 
							getReplies();
							
						
						} 
						
					} 
					
				}); 
				
			}); 
			
			// 댓글 수정
			$(".modalModBtn").on("click", function () { 
				
				// 댓글 선택자 
				var reply = $(this).parent().parent(); 
				
				// 댓글번호 
				var reply_b_num = reply.find("#reply_b_num").val(); 
				// 수정한 댓글내용 
				var reply_b_content = reply.find("#reply_b_content").val(); 
				
				// AJAX통신 : PUT 
					$.ajax({ 
						type : "put", 
						url : "${path}/Reply/" + reply_b_num, 
						headers : { 
							"Content-type" : "application/json", 
							"X-HTTP-Method-Override" : "PUT" 
						}, 
						data : JSON.stringify( {reply_b_content : reply_b_content} ), 
						dataType : "text", 
						success : function (result) { 
							console.log("result : " + result); 
							
							if (result == "modifySuccess") { 
								alert("댓글 수정 완료!"); 
								
								$("#modifyModal").modal("hide"); 
								// Modal 닫기 
								
								// 댓글 목록 출력 함수 호출 
								getReplies();
								
							} 
							
						} 
						
					}); 
				
			}); 
			
	});// 댓글제어영역
</script>
<%@ include file="../include/footer.jsp" %>