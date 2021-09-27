<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<style>

th, td {
text-align: center;
}
</style>

<h1 style="text-align: center; padding-top: 30px;">회원 전체 목록 조회</h1>

<section class="content" style="padding-top: 50px; padding-bottom: 50px;">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">회원 목록 총 ${pm.totalCount }명</h3>
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
												aria-label="Rendering engine: activate to sort column descending">회원 ID
											</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending">회원명</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">회원등급</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">가입일자</th>	
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending">누적구매액</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending">출석일수
												</th>
											<th class="sorting" tabindex="0" aria-controls="example2"
												rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending">경고횟수
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="mvo" items="${mListAll }">
											<tr role="row" class="odd">
												<td class="sorting_1"><a href="/Admin/mInfo?m_id=${mvo.m_id }&pageNum=${pm.cri.pageNum }">${mvo.m_id }</a></td>
												<td>${mvo.m_name }</td>
												<c:choose>
					    							<c:when test="${mvo.m_grade == 1}">
					        							<td><span class="label label-success">레벨1</span></td>
					   					 			</c:when>
					   					 			<c:when test="${mvo.m_grade == 2}">
					        							<td><span class="label label-warning">레벨2</span></td>
					   					 			</c:when>
					   					 			<c:when test="${mvo.m_grade == 3}">
					        							<td><span class="label label-primary">레벨3</span></td>
					   					 			</c:when>
					   					 			<c:when test="${mvo.m_grade == 4}">
					        							<td><span class="label label-danger">만렙</span></td>
					   					 			</c:when>
												</c:choose>   	
												<td>${mvo.m_regdate }</td>
												<td>${mvo.m_totalAmount }</td>
												<td>${mvo.m_attendance }</td>
												<td>${mvo.m_warning }</td>
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
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>

<div class="text-center">
	<ul class="pagination">	
		<!-- 이전 -->
		<c:if test="${pm.prev }">
			<li><a href="mListAll?pageNum=${pm.startPage-1 }"> &laquo;</a></li>
		</c:if>
		<!-- 페이지 번호 -->
		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
			<li <c:out value="${pm.cri.pageNum == idx? 'class = active ':''}"/>>
				<a href="mListAll?pageNum=${idx }">${idx }</a>
			</li>
		</c:forEach>
		<!-- 다음 -->
		<c:if test="${pm.next && pm.endPage > 0 }">
			<li><a href="mListAll?pageNum=${pm.endPage + 1}"> &raquo;</a></li>
		</c:if>
	</ul>
</div>

<!-- 해야할 것 다시 목록으로 돌아갈때 해당 인덱스 기억하고 돌아가기  -->

<%@ include file="footer.jsp"%>