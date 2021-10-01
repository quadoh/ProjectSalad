<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<meta charset="UTF-8">

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/admin/bootstrap/css/bootstrap.min.css" rel="stylesheet"
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
<link href="/resources/admin/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/admin/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
	
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="937295986828-c2at4cbrvd56g0r8n5ptsa5plssupb35.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<!-- jQuery 2.1.4 -->
<script src="/resources/admin/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<body>

<section style="padding: 100px 400px 100px 400px; margin-left: 100px;">
	<div class="box box-info" >
		<div class="box-header with-border">
			<h3 class="box-title">회원 탈퇴</h3>
		</div>
		<!-- /.box-header -->
		<!-- form start -->
		<form action="" class="form-horizontal" method="post">
			<div class="box-body">
				
				<div class="form-group">
					<label for="m_pw" class="col-sm-1 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control loginInput" id="m_pw" name="m_pw" placeholder="비밀번호를 입력해주세요.">
					</div>
				</div>
				
				
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				
				<input type="submit" class="btn btn-default" value="탈퇴하기" id="Mlogin_submit_Btn" name="Mlogin_submit_Btn">
			</div>
			<!-- /.box-footer -->
		</form>
	</div>
</section>	

	

<%@ include file="../include/footer.jsp" %>  