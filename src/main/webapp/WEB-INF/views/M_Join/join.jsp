<%@ include file="../include/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style type="text/css">
@charset "UTF-8";
*{
	margin: 0;
	padding:0;
}

/* 화면 전체 렙 */
.wrapper{
	width: 1900px;	
}

/* content 랩 */
.wrap{
	width : 800px;
	margin: auto;
}
/* 페이지 제목 */
.subjecet{
	width: 100%;
    height: 120px;
    background-color: #8EC0E4;
}
.subjecet span{
	margin-left: 31px;
    font-size: 80px;
    font-weight: 900;
    color: white;
}

/* 아이디 영역 */
.id_wrap{
	width: 100%;
    margin-top: 20px;
}
.id_name{
	font-size: 25px;
    font-weight: bold;
}
.id_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.id_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

	/* 중복아이디 존재하지 않는경우 */
	.id_input_re_1{
		color : green;
		display : none;
	}
	/* 중복아이디 존재하는 경우 */
	.id_input_re_2{
		color : red;
		display : none;
	}

/* 비밀번호 영역 */
.pw_wrap{
	width: 100%;
    margin-top: 20px;
}
.pw_name{
	font-size: 25px;
    font-weight: bold;
}
.pw_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.pw_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 비밀번호 확인 영역 */
.pwck_wrap{
	width: 100%;
    margin-top: 20px;
}
.pwck_name{
	font-size: 25px;
    font-weight: bold;
}
.pwck_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.pwck_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 이름 영역 */
.user_wrap{
	width: 100%;
    margin-top: 20px;
}
.user_name{
	font-size: 25px;
    font-weight: bold;
}
.user_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.user_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 메일 영역 */
.mail_wrap{
	width: 100%;
    margin-top: 20px;
}
.mail_name{
	font-size: 25px;
    font-weight: bold;
}
.mail_input_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.mail_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}
.mail_check_wrap{
	margin-top: 20px;	
}
.mail_check_input_box{
	border: 1px solid black;
    height: 31px;
    padding: 10px 14px;
    width: 61%;
    float: left;
}
.mail_check_input{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}
.mail_check_button{
    border: 1px solid black;
    height: 51px;
    width: 30%;
    float: right;
    line-height: 50px;
    text-align: center;
    font-size: 30px;
    font-weight: 900;
    background-color: #ececf7;
    cursor: pointer;
}

/* 주소 영역 */
.address_wrap{
	width: 100%;
    margin-top: 20px;
}
.address_name{
	font-size: 25px;
    font-weight: bold;
}
.address_input_1_box{
	border: 1px solid black;
    height: 31px;
    padding: 10px 14px;
    width: 61%;
    float: left;	
}
.address_input_1{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;	
}
.address_button{
    border: 1px solid black;
    height: 51px;
    width: 30%;
    float: right;
    line-height: 50px;
    text-align: center;
    font-size: 30px;
    font-weight: 900;
    background-color: #ececf7;
    cursor: pointer;	
}
.address_input_2_wrap{
	margin-top: 20px;
}
.address_input_2_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.address_input_2{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

.address_input_3_wrap{
	margin-top: 20px;
}
.address_input_3_box{
	border: 1px solid black;
	height:31px;
	padding: 10px 14px;	
	
}
.address_input_3{
	width:100%;
	height:100%;
	border:none;
	font-size:28px;
}

/* 가입하기 버튼 */
.join_button_wrap{
	margin-top: 40px;
	text-align: center;
}
.join_button{
	width: 100%;
    height: 80px;
    background-color: #6AAFE6;
    font-size: 40px;
    font-weight: 900;
    color: white;
}


/* 유효성 검사 문구 */
 
.final_id_ck{
    display: none;
}
.final_pw_ck{
    display: none;
}
.final_pwck_ck{
    display: none;
}
.final_name_ck{
    display: none;
}
.final_mail_ck{
    display: none;
}
.final_addr_ck{
    display: none;
}

/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1{
        color : green;
        display : none;    
}
.pwck_input_re_2{
        color : red;
        display : none;    
}   

/* float 속성 해제 */
.clearfix{
	clear: both;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/join.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form action="" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="m_id">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="m_pw">
				</div>
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input" name="m_pw2">
				</div>
				<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="m_name">
				</div>
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="m_email">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box">
						<input class="mail_check_input">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">우편번호</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="m_addr1" onclick="addrclick()">
					</div>
					<div class="address_button">
						<span>주소</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="m_addr2">
					</div>
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
</div>

<script>

/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;            // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var mailCheck = false;            // 이메일
var mailnumCheck = false;        // 이메일 인증번호 확인
var addressCheck = false         // 주소


$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		/* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.user_input').val();            // 이름 입력란
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.address_input_3').val();        // 주소 입력란

        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }

        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck&&addressCheck ){
 
			$("#join_form").attr("action", "/M_Join/join");
			$("#join_form").submit();
		
        } 
        
        return false; 
	});
});





//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){

	//console.log("keyup 테스트");
	
	var memberId = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {m_id : m_id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/member/memberIdChk",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");	
				// 아이디 중복이 없는 경우
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");		
				// 아이디 중복된 경우
				idckCheck = false;
			}
			
		}// success 종료
	}); // ajax 종료
	


});// function 종료


/* 비밀번호 확인 일치 유효성 검사 */

$('.pwck_input').on("propertychange change keyup paste input", function(){
 
    var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
    
});  








</script>


<!-- 카카오 우편번호 api -->
   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      function addrclick() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var address = ''; // 주소 변수
                     //  var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        address = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        address = data.jibunAddress;
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('addr1').value = data.zonecode;
                     document.getElementById("addr2").value = address;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("addr3")
                           .focus();
                  }
               }).open();
      }
   </script>
   <!-- 카카오 우편번호 api -->










<%@ include file="../include/footer.jsp" %>