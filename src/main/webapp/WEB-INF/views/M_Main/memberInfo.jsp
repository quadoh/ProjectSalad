<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/header.jsp" %>

<h2> 회원정보 출력 (SpringMVC) </h2>
  
  <h3> 아이디 : ${mvo.m_id }</h3>
  <h3> 이름 : ${mvo.m_name }</h3>
  <h3> 이메일 : ${mvo.m_email }</h3>
  <h3> 우편번호 : ${mvo.m_zip }</h3>
  <h3> 주소 : ${mvo.m_addr1 }</h3>
  <h3> 상세주소 : ${mvo.m_addr2 }</h3>
  <h3> 전화번호 : ${mvo.m_phone }</h3>
  <h3> 회원가입일 : ${mvo.m_regdate }</h3>
  <h3>
   내 등급 : 
   <c:choose>
    <c:when test="${ mvo.m_totalAmount > 1000000 }">VVIP</c:when>
    <c:when test="${ mvo.m_totalAmount <= 1000000 }">VIP</c:when>
    <c:when test="${ mvo.m_totalAmount <= 500000 }">GOLD</c:when>
    <c:when test="${ mvo.m_totalAmount <= 100000 }">SILVER</c:when>
    <c:otherwise>BRONZE</c:otherwise>
   </c:choose>
  </h3>
   
  <h3> 누적 구매 금액 : ${mvo.m_totalAmount }</h3>
  <h3> 
  포인트 :
  <c:set var="point" value= "${ovo.order_total_price*0.01 }"/>
  	<c:forEach var="ovo" items="${order_pay_num }">
  	  <c:set var="pointSum" value="${point+ovo}"/>
  	
  	</c:forEach>
  	
  	<c:out value="${pointSum }"/>
  
  </h3>
  <h3> 누적 구매 금액 : ${mvo.m_totalAmount }</h3>
  <h3> 출석일수 : ${mvo.m_totalAmount }</h3>
  <h3> 쿠폰 : ${mvo.m_coupon }</h3>
  <h2><a href="./myPage">마이페이지로</a></h2>


<%@ include file="../include/footer.jsp" %>