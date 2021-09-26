<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>Web-INF/views/member/main.jsp</h1>
   
   <%
    //세션제어
    String id = (String) session.getAttribute("id");
   
    if(id == null){
    	//response.sendRedirect("/web/member/login");
    	response.sendRedirect("./login");
    	//response.sendRedirect(request.getContextPath()+"member/login");
    }
   
   %>
   
   <h2>마이 페이지</h2>
   
   <h3>${sessionScope.id }님 환영합니다</h3>
   
   <input type="button" value="로그아웃" onclick="location.href='./logout';">
  
   <hr>
   
   <h3><a href="./info">회원정보 조회</a></h3>
   
	<hr><hr>
    
    <h3><a href="./update">회원정보 수정 (update)</a></h3>   
   
   <hr><hr>
    
    <h3><a href="./delete">회원정보 삭제 (delete)</a></h3>  
   
   <hr><hr>
   
   <h3><a href="./orderList">주문목록</a></h3>
   
   
   
   
   
   
   
   
   
   
</body>
</html>