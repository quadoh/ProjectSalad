<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WEB-INF/views/m_main/updateOrder</h1>

	<h2>주문정보 수정</h2>


	<fieldset>
		<form action="" method="post">
			받는사람 이름 : <input type="text" name="order_receive_name" value="${ovo.order_receive_name }"><br> 
			받는사람 연락처 : <input type="text" name="phone" value="${ovo.order_receive_phone }"><br>
			우편번호 : <input type="text" name="zip" value="${ovo.order_receive_zip }"><br>
			집주소1 : <input type="text" name="addr1"	value="${ovo.order_receive_addr1 }"><br> 
			집주소2 : <input type="text" name="addr2" value="${ovo.order_receive_addr2 }"><br>
			거래방법 : <input type="text" name="type" value="${ovo.order_type }"><br>
			주문수량 : <input type="text" name="amount" value="${ovo.order_amount }"><br>



			<div class="box-footer">
				<button type="submit" class="btn btn-update">수정하기</button>
				<button type="submit" class="btn btn-primary">취소하기</button>
			</div>
		</form>

	</fieldset>
	<script>
		$(document).ready(function() {

			// 폼태그 정보 가져오기
			var frObj = $("form[role='form']");

			//  수정하기 - post 방식으로 이동
			$(".btn-update").on("click", function() {
				frObj.submit();
			});

			//  취소하기 - listOrder 페이지 이동
			$(".btn-primary").click(function() {
				location.href = "/m_main/listOrder";
			});

		});
	</script>
</body>
</html>