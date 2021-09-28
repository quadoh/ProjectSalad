<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){

    $("#btnList").click(function(){
        location.href="${path}/shop/product/list.do";
    });

     // �Ʒ��ʿ��� btnlist�� ȣ���ؼ� ����Ǵ� function() �Լ� ����.
     // list�� ���� ��ũ�� �����.

    $("#btnDelete").click(function(){
        if(confirm("��ٱ��ϸ� ���ðڽ��ϱ�?")){
            location.href="${path}/shop/cart/deleteAll.do";
        }
    });
});
</script>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<h2>��ٱ���</h2>
<c:choose>
    <c:when test="${map.count == 0 }">
    <!-- when�� ~~�϶� ��� �� �׷��ϱ� map�� count�� 0�϶�... -->
    <!-- xml���Ͽ��� hashmap�� list�� �־���ұ� ������ ���� map�� �ڷᰡ ����ִ�.  -->
    <!-- map�� �ڷᰡ �ƹ��͵� ���ٸ� -->
        ��ٱ��ϰ� ������ϴ�.
    </c:when>
    
    <c:otherwise>
    <!-- map.count�� 0�� �ƴҶ�, �� �ڷᰡ ������ -->
    <!-- form�� �����Ѵ�.  -->
    <!-- form�� id�� form1�� �ϰ�, method ����� post�� �Ѵ�. �׸��� update.do�������� �̵���Ų��. -->
        <form id="form1" name="form1" method="post"
        action="${path}/shop/cart/update.do">
            <table border="1" width="400px">
                <tr>
                    <th>��ǰ��</th>
                    <th>�ܰ�</th>
                    <th>����</th>
                    <th>�ݾ�</th>
                    <th>&nbsp;</th>
                </tr>
                <!-- map�� �ִ� list����ϱ� ���� forEach���� ����� row��� ������ �ִ´�. -->
            <c:forEach var="row" items="${map.list}">
                <tr align="center">
                    <td>${row.product_name}</td>
                    
                    <td><fmt:formatNumber value="${row.price}"
                            pattern="#,###,###" /></td>
                            <!-- fmt:formatNumber �±״� ���ڸ� ��Ŀ� ���缭 ���ڿ��� ��ȯ���ִ� �±��̴� -->
                            <!-- ���⼭�� �ݾ��� ǥ���� �� ��� -->
                            <!-- ex) 5,000 / 10,000 ����-->
                            
                    <td><input type="number" name="amount" 
                        style="width:30px;"
                        value="<fmt:formatNumber value="${row.amount}"
                            pattern="#,###,###" />">
                    <!-- ������ ���� (amount)�� fmt�±׸� ����ؼ� ������ ���Ŀ� ���缭 ���ڿ��� ��ȯ�� -->
                    <!--1,000 / 5,000 ���~  -->
                    
                            <input type="hidden" name="cart_id"
                            value="${row.cart_id}">
                            
                                
                    </td>
                    <td><fmt:formatNumber value="${row.money}"
                            pattern="#,###,###" /></td>
                    <td><a href=
"${path}/shop/cart/delete.do?cart_id=${row.cart_id}">[����]</a>
<!-- ���� ��ư�� ������ delete.do�� ��ٱ��� ���� id (�����ϱ���ϴ� ��ٱ��� id)�� ������ �����Ѵ�. -->
                    </td>
                </tr>
            </c:forEach>
                <tr>
                    <td colspan="5" align="right">
                        ��ٱ��� �ݾ� �հ� :
                        <fmt:formatNumber value="${map.sumMoney}"
                            pattern="#,###,###" /><br>
                        ��۷� : ${map.fee}<br>
                        ���հ� : <fmt:formatNumber value="${map.sum}"
                            pattern="#,###,###" />
                    </td>
                </tr>
            </table>
            <button id="btnUpdate">����</button>
            <button type="button" id="btnDelete">��ٱ��� ����</button>
            //btnUpdate�� btnDelete id�� ���ʿ� �ִ� �ڹٽ�ũ��Ʈ�� ó���Ѵ�.
        </form>
    </c:otherwise>
</c:choose>
<button type="button" id="btnList">��ǰ���</button>
<button type="button" id="PaymentList">�ֹ��ϱ�</button>
</body>
</html>