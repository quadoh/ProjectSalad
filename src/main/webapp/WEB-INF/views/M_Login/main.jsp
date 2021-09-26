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

${m_id }

<span id="google_login" class="circle google" onclick="init();"> <i class="fa fa-google-plus fa-fw"></i> </span> 
<section style="padding: 100px 400px 100px 400px; margin-left: 100px;">
				<button type="button" onclick="signOut();">google sign out</button>
				
</section>

	<script type="text/javascript">
	
	// google signin API
	var googleUser = {};
	function init() {
		 gapi.load('auth2', function() {
		  console.log("init()시작");
		  auth2 = gapi.auth2.init({
		        client_id: '937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com',
		        cookiepolicy: 'single_host_origin',
		      });
		      attachSignin(document.getElementById('google_login'));
		 });
	}

	
	//google signin API2
	function attachSignin(element) {
	    auth2.attachClickHandler(element, {},
	        function(googleUser) {
	    	var profile = googleUser.getBasicProfile();
	    	var id_token = googleUser.getAuthResponse().id_token;
		  	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  	  console.log('ID토큰: ' + id_token);
		  	  console.log('Name: ' + profile.getName());
		  	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
				$(function() {
					$.ajax({
					    url: '/M_Login/googlelogin',
					    type: 'post',
					    data: {"m_id": profile.getEmail(),
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
 }
</script>
</body>
</html>