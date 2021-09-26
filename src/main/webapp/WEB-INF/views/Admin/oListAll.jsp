<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
 
<h1 style="text-align: center; padding-top: 30px;">주문 전체 목록 조회</h1>

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
												aria-label="Browser: activate to sort column ascending">회원아이디</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">주문자성명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">주문량
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">거래방법
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">주문일자
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">주문상태
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="ovo" items="${oListAll }">
											<tr role="row" class="odd">
												<td class="sorting_1"><a href="/Admin/oInfo?order_num=${ovo.order_num }&pageNum=${pm.cri.pageNum }">${ovo.order_num }</a></td>
												<td>${ovo.order_pay_num }</td>
												<td>${ovo.m_id }</td>
												<td>${ovo.order_name }</td>
												<td>${ovo.rcp_name }</td>
												<td>${ovo.order_amount }</td>
												<td>${ovo.order_type }</td>
												<td>${ovo.order_date }</td>
												<c:choose>
					    							<c:when test="${ovo.order_status == 0}">
					        							<td><span class="label label-primary">결제 대기중</span></td>
					   					 			</c:when>
					   					 			<c:when test="${ovo.order_status == 1}">
					        							<td><span class="label label-success">결제 완료</span></td>
					   					 			</c:when>
					   					 			<c:when test="${ovo.order_status == 2}">
					        							<td><span class="label label-warning">배송중</span></td>
					   					 			</c:when>
					   					 			<c:when test="${ovo.order_status == 3}">
					        							<td><span class="label label-primary">배송 완료</span></td>
					   					 			</c:when>
					   					 			<c:when test="${ovo.order_status == 4}">
					        							<td><span class="label label-danger">구매 확정</span></td>
					   					 			</c:when>
					   					 			<c:when test="${ovo.order_status == 5}">
					        							<td><span class="label label-success">거래 완료</span></td>
					   					 			</c:when>
												</c:choose>   	
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
			<li><a href="oListAll?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
		</c:if>

		<!-- 페이지 번호 -->
		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
			<li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
				<a href="oListAll?pageNum=${idx }">${idx }</a>
			</li>
		</c:forEach>

		<!-- 다음 -->
		<c:if test="${pm.next && pm.endPage > 0 }">
			<li><a href="oListAll?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
		</c:if>
	</ul>
</div>

<%@ include file="footer.jsp"%>