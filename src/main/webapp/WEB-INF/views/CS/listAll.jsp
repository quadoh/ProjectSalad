<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

	//페이지 실행 정보(result)가 있는지 없는지에 따라서 확인메세지
	//alert('result :'+'${result}');
	// java -> js 페이지 이동
	
	// 전달된 데이터를 저장 (el표현식의 값)
	var result = '${result}';
	
	//alert(result);
	// 비교후 메세지 출력
	if(result == 'success'){
        alert(" 글쓰기 정상처리 완료! ");
    }
	
	/** 게시판 - 작성 페이지 이동 */
    function CS_Board_Register(){        
        location.href = "/CS/register";
    }
	

</script>
</head>
<body>
<!-- 변수작성 규칙: 자기 담당파일명_개별페이지_요소 (예시 - MJoin_register_btn : 회원가입 입력페이지 버튼명) -->
<h2>listAll.jsp</h2>
<table>
	<tbody>
	
	 <tr>
	  <th style="width : 10px">번호</th>
	  <th>문의유형</th>
	  <th>제목</th>
	  <th>글쓴이</th>
	  <th>날짜</th>
	  <th>답변여부</th>
	 </tr>
	 
	 <c:forEach var="CS_vo" items="${CS_boardList }">
	  <tr>
	   <td style="width: 10px">${CS_vo.customer_b_num }</td>
	   <td>${CS_vo.customer_b_type }</td>
	   <td>
	    <a href="/CS/read?customer_b_num=${CS_vo.customer_b_num }">${CS_vo.customer_b_title }</a>
	   </td>
	   <td>${CS_vo.m_id }</td>
	   <td>${CS_vo.customer_b_date }</td>
	   <td>${CS_vo.customer_b_status }</td>	   
	  </tr>
	 </c:forEach>
	  	
	</tbody>	
</table>

<button type="button" onclick="javascript:CS_Board_Register();">작성하기</button>

</body>
</html>