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

	//������ ���� ����(result)�� �ִ��� �������� ���� Ȯ�θ޼���
	//alert('result :'+'${result}');
	// java -> js ������ �̵�
	
	// ���޵� �����͸� ���� (elǥ������ ��)
	var result = '${result}';
	
	//alert(result);
	// ���� �޼��� ���
	if(result == 'success'){
        alert(" �۾��� ����ó�� �Ϸ�! ");
    }
	
	/** �Խ��� - �ۼ� ������ �̵� */
    function CS_Board_Register(){        
        location.href = "/CS/register";
    }
	

</script>
</head>
<body>
<!-- �����ۼ� ��Ģ: �ڱ� ������ϸ�_����������_��� (���� - MJoin_register_btn : ȸ������ �Է������� ��ư��) -->
<h2>listAll.jsp</h2>
<table>
	<tbody>
	
	 <tr>
	  <th style="width : 10px">��ȣ</th>
	  <th>��������</th>
	  <th>����</th>
	  <th>�۾���</th>
	  <th>��¥</th>
	  <th>�亯����</th>
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

<button type="button" onclick="javascript:CS_Board_Register();">�ۼ��ϱ�</button>

</body>
</html>