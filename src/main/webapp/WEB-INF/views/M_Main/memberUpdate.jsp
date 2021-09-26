<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WEB-INF/views/member/update</h1>

<h2> 회원정보 수정(SpringMVC) </h2>
<h3> 아이디 : ${mvo.m_id }</h3>
  <h3> 이름 : ${mvo.m_name }</h3>
  <h3> 이메일 : ${mvo.m_email }</h3>
  <h3> 우편번호 : ${mvo.m_zip }</h3>
  <h3> 주소 : ${mvo.m_addr1 }</h3>
  <h3> 상세주소 : ${mvo.m_addr2 }</h3>
  <h3> 전화번호 : ${mvo.m_phone }</h3>
  <h3> 회원가입일 : ${mvo.m_regdate }</h3>
  <h3> 내 등급 : ${mvo.m_grade }</h3>
  <h3> 누적 구매 금액 : ${mvo.m_totalAmount }</h3>
  <h3> 출석일수 : ${mvo.m_totalAmount }</h3>
  <h3> 쿠폰 : ${mvo.m_coupon }</h3>
    
    
    <fieldset>
       <form action="" method="post">       
          아이디 : <input type="text" name="m_id" value="${mvo.m_id }" readonly><br>
          이름 : <input type="text" name="m_id" value="${mvo.m_id }" readonly><br>
       	  비밀번호 : <input type="password" name="m_pw" placeholder="비밀번호를 입력하세요."><br>
       	  이름 : <input type="text" name="m_name" value="${mvo.m_name }"><br>
       	  이메일 : <input type="text" name="m_email" value="${mvo.m_email }"><br>
       	   : <input type="text" name="m_email" value="${mvo.m_email }"><br>
       	  이메일 : <input type="text" name="m_email" value="${mvo.m_email }"><br>
       	  이메일 : <input type="text" name="m_email" value="${mvo.m_email }"><br>
       	  <input type="submit" value="회원수정">
       </form>
    
    </fieldset>

</body>
</html>