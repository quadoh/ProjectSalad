<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>
 
<h1 style="text-align: center; padding-top: 30px;">주문 전체 목록 조회</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 50px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">주간 레시피 탑텐</h3>
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
												aria-label="Rendering engine: activate to sort column descending">글번호</th>
											<th class="sorting_asc" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1" aria-sort="ascending"
												aria-label="Rendering engine: activate to sort column descending">회원아이디</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">레시피번호</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">글제목
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">레시피명
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="srvo" items="${Salad_TopList }">
											<tr role="row" class="odd">
												<td><a href="#">${srvo.rcp_num }</a></td>
												<td><a href="#">${srvo.rcp_cmbnt }</a></td>
												<td><a href="#">${srvo.rcp_name }</a></td>
												<td><a href="#">${srvo.rcp_content }</a></td>
												<td><a href="#">${srvo.rcp_img }</a></td>
												<td><a href="#">${srvo.rcp_date }</a></td>
												<td><a href="#">${srvo.rcp_like }</a></td>
												<td><a href="#">${srvo.rcp_price }</a></td>
												<td><a href="#">${srvo.rcp_week_count }</a></td>
												<td><a href="#">${srvo.rcp_total_count }</a></td>
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