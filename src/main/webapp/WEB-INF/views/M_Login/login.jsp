<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	
<!-- 네이버 / 카카오 / 구글 로그인 관련 태그  -->	
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!-- 회원가입 창  -->
<section style="padding: 100px 400px 100px 400px; margin-left: 100px;">
	<div class="box box-info" >
		<div class="box-header with-border">
			<h3 class="box-title" style="padding-bottom: 20px;">Login Form</h3>
		</div>
		<!-- form start -->
		<form action="" class="form-horizontal" method="post">
			<div class="box-body">
				<div class="form-group">
					<label for="m_id" class="col-sm-1 control-label">ID</label>
					<div class="col-sm-10">
						<input type="text" class="form-control loginInput" id="m_id" name="m_id" placeholder="아이디를 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="m_pw" class="col-sm-1 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control loginInput" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해주세요.">
					</div>
				</div>
				<p id="idCheck" style="margin-bottom:0;"><span id="idCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<!-- 구글 아이디 로그인 버튼  -->
				<a class="g-signin2" id="googleLogin" onclick="init();" data-theme="dark"></a>
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naver_id_login"></div>
				<!-- 카카오로그인 -->
				<a href="javascript:kakaoLogin();">
					<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height: 40px;width: auto;">
				</a>
				
				<!-- 이 부분은 기능 테스트 상 임시로 넣어놓은 거라서 나중에 지울거에요 디자인 신경 안쓰셔도 됩니다.-->
				<!-- <button type="button" class="btn btn-default" onclick="signOut();">google sign out</button> -->
				
				<!-- 로그인 버튼 제어   -->
				<button type="button" class="btn-primary">아이디/비밀번호 찾기</button>
				<input type="button" class="btn-primary" value="로그인" id="Mlogin_submit_Btn" name="Mlogin_submit_Btn">
			</div>
			<!-- /.box-footer -->
		</form>
	</div>
</section>

<!-- 자바스크립트 제어  -->
	<script type="text/javascript">
	
	<!-- 네이버아디디로로그인 초기화 Script -->
		var naver_id_login = new naver_id_login("4JoVEl8bh_pfo_aFwcDO", "http://localhost:8088/M_Login/main");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 2,40);
		naver_id_login.setDomain(".service.com");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
	<!-- // 네이버아이디로로그인 초기화 Script -->
	
	<!-- 카카오로그인 -->
	// 51b20c14e1ac4e264f7d1a93cc236b47
	window.Kakao.init("51b20c14e1ac4e264f7d1a93cc236b47");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile_nickname,account_email',
			success: function(authObj){
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me', //현재로그인한사용자의정보
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
					}
				});
			}
		});
	}
	
	
		$(function() {
			$('#Mlogin_submit_Btn').click(function() {
				LoginSubmit();
			});
		});

		function LoginSubmit() {
			var m_id = $('#m_id').val();
			var m_pw = $('#m_pw').val();

			if (m_id == "") {
				$("#idCheck #idCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("아이디를 입력해주세요.");
			} else if (m_pw == "") {
				$("#idCheck #idCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("비밀번호를 입력해주세요.");
			} else {
				$.ajax({
					type : "POST",
					url : 'login',
					data : {
						m_id : m_id,
						m_pw : m_pw
					},
					success : function(data) {
						if (data == "false")
							$("#idCheck #idCheckMsg").css({
								visibility : 'visible',
								display : 'block',
								color : 'red'
							}).text("아이디나 비밀번호 오류입니다.");
						else
							location.href = "main";
					}
				});
			}
		}

		
	// 구글 소셜 로그인 1단계 - init

	function init() {
		 gapi.load('auth2', function() {
		 console.log("init()");
		 auth2 = gapi.auth2.init({
		        client_id: '937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com',
		        cookiepolicy: 'single_host_origin',
		      });
		      attachSignin(document.getElementById('googleLogin'));
		 });
	}
	
	// 구글 소셜 로그인 2단계 - signin
	function attachSignin(element) {
	    auth2.attachClickHandler(element, {},
	        function(googleUser) {
	    	var profile = googleUser.getBasicProfile();
	    	var id_token = googleUser.getAuthResponse().id_token;
	    	
		  	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  	  console.log('ID토큰: ' + id_token);
		  	  console.log('Name: ' + profile.getName());
		  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  	  
		  	  var id = profile.getEmail();
		      var m_id = id.slice(0,id.indexOf("@"));
		      var m_pw = 1234;
				
		        $(function() {
					$.ajax({
					    url: '/M_Login/googlelogin',
					    type: 'post',
					    data: {"m_id": m_id,
					    	   "m_pw": m_pw,
					           "m_name": profile.getName(),
							   "m_email": profile.getEmail()
						      },
					    success: function (data) {
					            alert("구글아이디로 로그인 되었습니다");
					            location.href="/main";
					        }
					});
				})
	        }, function(error) {
	          alert("구글아이디 로그인이 실패했습니다.");
	        });
	  }
 
// 구글 로그아웃
 function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');
			});
			auth2.disconnect();
 }
</script>

<%@ include file="../include/footer.jsp" %>