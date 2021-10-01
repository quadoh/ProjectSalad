<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

    


 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="common__form">
                <h4>회원 정보 변경</h4>
                <form action="" method="post">
                
                	<!-- 한줄에 여러개 나눠야 할때 -->
                	<div class="row">
									    <div class="col-lg-6">
									        <div class="common__input">
									            <p>이름</p>
									            <input type="text">
									        </div>
									    </div>
                	
									<div class="row">
									    <div class="col-lg-6">
									        <div class="common__input">
									            <p>비밀번호</p>
									            <input type="text">
									        </div>
									    </div>
									    <div class="col-lg-6">
									        <div class="common__input">
									            <p>이메일</p>
									            <input type="text">
									        </div>
									    </div>
									</div>
									
									
									    <div class="col-lg-6">
									        <div class="common__input">
									            <p>연락처</p>
									            <input type="text">
									        </div>
									    </div>
									</div>
									
									<!-- 한줄에 하나  -->
									<div class="common__input">
									    <p>주소</p>
									    <input type="text" id="" name="m_addr1" onclick="addrclick()">
									    <input type="text" id="" name="m_addr2" >
									    <input type="text" id="" name="m_addr3">
									</div>
									
									
						<div class="col-lg-8">
                    	<button type="submit" class="site-btn" id="MJoin_submit_Btn">수정하기</button>
                    </div>			
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    

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
    	            $(".address_input_1").val(data.zonecode);
    	            //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
    	            $(".address_input_2").val(addr);
    	            //$("[name=memberAddr2]").val(addr);			// 대체가능
    	            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
    	            $(".address_input_3").attr("readonly",false);
    	            $(".address_input_3").focus();
    	            
    	        }
    	    }).open();   
    	    
    	}
   </script>
   <!-- 카카오 우편번호 api -->

   
<%@ include file="../include/footer.jsp" %>   