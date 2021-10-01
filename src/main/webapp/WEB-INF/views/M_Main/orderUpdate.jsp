<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">


	
<h1 style="text-align: center; padding-top: 30px;">주문 정보 수정</h1>

<section style="padding: 30px 400px 30px 400px;">
	<div class="box box-primary">
		<div class="box-header with-border">
			<h3 class="box-title">주문정보 수정</h3>
		</div>
		<form action="" method="post">
			<div class="box-body">
				
				<div class="form-group">
					<label for="order_receive_name">수취인 이름</label> 
					<input type="text" class="form-control" id="order_receive_name" name="order_receive_name"  value=${ovo.order_receive_name }>
				</div>
				<div class="form-group">
					<label for="order_receive_phone">수취인 전화번호</label> 
					<input type="text" class="form-control" id="order_receive_phone" name="order_receive_phone"  value=${ovo.order_receive_phone }>
				</div>
				<div class="form-group">
					<label for="order_receive_zip">수취인 우편번호</label> 
					<input type="text" class="form-control" id="order_receive_zip" name="order_receive_zip"  value=${ovo.order_receive_zip }>
						<button type="button" class="btn btn-success" onclick="addrclick();">우편번호 찾기</button>
				</div>
				<div class="form-group">
					<label for="order_receive_addr1">수취인 주소</label> 
					<input type="text" class="form-control" id="order_receive_addr1" name="order_receive_addr1"  value=${ovo.order_receive_addr1 }>
				</div>
				<div class="form-group">
					<label for="order_receive_addr2">수취인 상세주소</label> 
					<input type="text" class="form-control" id="order_receive_addr2" name="order_receive_addr2"  value=${ovo.order_receive_addr2 }>
				</div>
				<div class="form-group">
					<label for="order_type">거래 방법</label> 
					<input type="text" class="form-control" id="order_type" name="order_type"  value=${ovo.order_type }>
				</div>
				<div class="form-group">
					<label for="order_amount">주문 수량</label> 
					<input type="text" class="form-control" id="order_amount" name="order_amount"  value=${ovo.order_amount }>
				</div>
				
				<div class="form-group">
					<label for="order_total_price">결제 금액</label> 
					<input type="text" class="form-control" id="order_total_price" name="order_total_price"  value=${ovo.order_total_price }>
				</div>
				
				<div class="box-footer">
				<button type="submit" class="btn btn-primary">수정하기</button>
				<a href="/m_main/listOrder"><button type="button" class="btn btn-success">목록으로</button></a>
				</div>
			</div>
		</form>
	</div>	
</section>	
<!-- 카카오 우편번호 api -->
   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      function addrclick() {
    	  new daum.Postcode({
    	        oncomplete: function(data) {
    	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    	            
    	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
    	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    	            var addr = ''; // 주소 변수
    	            var extraAddr = ''; // 참고항목 변수
    	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
    	                addr = data.roadAddress;
    	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
    	                addr = data.jibunAddress;
    	            }
    	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
    	            if(data.userSelectedType === 'R'){
    	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
    	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    	                    extraAddr += data.bname;
    	                }
    	                // 건물명이 있고, 공동주택일 경우 추가한다.
    	                if(data.buildingName !== '' && data.apartment === 'Y'){
    	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    	                }
    	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    	                if(extraAddr !== ''){
    	                    extraAddr = ' (' + extraAddr + ')';
    	                }
    	                // 주소변수 문자열과 참고항목 문자열 합치기
    	      			addr += extraAddr;
    	            
    	            } else {
    	                addr += ' ';
    	            }
    	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
    	            $(".order_receive_zip").val(data.zonecode);
    	            //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
    	            $(".order_receive_addr1").val(addr);
    	            //$("[name=memberAddr2]").val(addr);			// 대체가능
    	            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
    	            $(".order_receive_addr2").attr("readonly",false);
    	            $(".order_receive_addr2").focus();
    	            
    	        }
    	    }).open();   
    	    
    	}
   </script>
   <!-- 카카오 우편번호 api -->
<%@ include file="../include/footer.jsp" %>   