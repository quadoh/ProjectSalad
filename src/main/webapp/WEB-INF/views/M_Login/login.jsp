<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SaladMall | LoginPage</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
	
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<!-- jQuery 2.1.4 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<body>

<section style="padding: 100px 400px 100px 400px; margin-left: 100px;">
	<div class="box box-info" >
		<div class="box-header with-border">
			<h3 class="box-title">Login Form</h3>
		</div>
		<!-- /.box-header -->
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
				<p class="idCheck" style="margin-bottom:0;"><span class="idCheckMsg" style="font-size:12px; font-weight:bold;"></span></p>
				<div class="form-group">
					<div class="col-sm-offset-1 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox"> Remember me
							</label>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<a class="g-signin2" id="googleLogin" onclick="init();" data-theme="dark"></a>
				<button type="button" class="btn btn-default" onclick="signOut();">google sign out</button>
				<button type="button" class="btn btn-default">아이디/비밀번호 찾기</button>
				<input type="button" class="btn btn-default" value="로그인" id="Mlogin_submit_Btn" name="Mlogin_submit_Btn">
			</div>
			<!-- /.box-footer -->
		</form>
	</div>
</section>

	<script type="text/javascript">
		$(function() {
			$('#Mlogin_submit_Btn').click(function() {
				LoginSubmit();
			});
		});

		function LoginSubmit() {
			var m_id = $('#m_id').val();
			var m_pw = $('#m_pw').val();

			if (m_id == "") {
				$(".idCheck .idCheckMsg").css({
					visibility : 'visible',
					display : 'block',
					color : 'red'
				}).text("아이디를 입력해주세요.");
			} else if (m_pw == "") {
				$(".idCheck .idCheckMsg").css({
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
							$(".idCheck .idCheckMsg").css({
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
</body>
</html>