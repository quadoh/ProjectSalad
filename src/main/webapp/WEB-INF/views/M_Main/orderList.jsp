<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>
<meta charset="UTF-8">

	

	
	
<style>

td,th {
text-align: center;
}
</style>
 
<h1 style="text-align: center; padding-top: 30px;">주문 목록 조회</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 50px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">주문 목록 총 ${pm.totalCount }건</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example2_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">
							<div class="col-sm-12"></div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table id="example2"
									class="table table-bordered table-hover dataTable" role="grid"
									aria-describedby="example2_info">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">주문번호</th>
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">결제번호</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">주문일자
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="ovo" items="${orderList }">
											<tr role="row" class="odd">
												
												<td class="sorting_1"><a href="/M_Main/orderInfo?order_num=${ovo.order_num }&pageNum=${pm.cri.pageNum }">${ovo.order_num }</a></td>
												<td>${ovo.order_pay_num }</td>
												<td>${ovo.order_date }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="dataTables_info" id="example2_info" role="status"
									aria-live="polite">Showing ${pm.cri.pageNum } to ${pm.endPage }</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>

<div class="text-center">
	<ul class="pagination">
	
		<!-- 이전 -->
		<c:if test="${pm.prev }">
			<li><a href="orderList?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
		</c:if>

		<!-- 페이지 번호 -->
		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
			<li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
				<a href="orderList?pageNum=${idx }">${idx }</a>
			</li>
		</c:forEach>

		<!-- 다음 -->
		<c:if test="${pm.next && pm.endPage > 0 }">
			<li><a href="orderList?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
		</c:if>
	</ul>
</div>

	
<%@ include file="../include/footer.jsp" %>   