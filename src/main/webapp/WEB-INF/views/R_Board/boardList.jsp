<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }/resources/saladmall/"/>
<!DOCTYPE html>

<%@ include file="../include/header.jsp" %> 

   <!-- Hero Section Begin -->
   <section class="hero hero-normal">
       <div class="container">
           <div class="row">
               <div class="col-lg-3">
                   <div class="hero__categories">
                       <div class="hero__categories__all">
                           <i class="fa fa-bars"></i>
                           <span>All departments</span>
                       </div>
                       <ul>
                           <li><a href="#">Fresh Meat</a></li>
                           <li><a href="#">Vegetables</a></li>
                           <li><a href="#">Fruit & Nut Gifts</a></li>
                           <li><a href="#">Fresh Berries</a></li>
                           <li><a href="#">Ocean Foods</a></li>
                           <li><a href="#">Butter & Eggs</a></li>
                           <li><a href="#">Fastfood</a></li>
                           <li><a href="#">Fresh Onion</a></li>
                           <li><a href="#">Papayaya & Crisps</a></li>
                           <li><a href="#">Oatmeal</a></li>
                           <li><a href="#">Fresh Bananas</a></li>
                       </ul>
                   </div>
               </div>
               <div class="col-lg-9">
                   <div class="hero__search">
                       <div class="hero__search__form">
                           <form action="#">
                               <div class="hero__search__categories">
                                   All Categories
                                   <span class="arrow_carrot-down"></span>
                               </div>
                               <input type="text" placeholder="What do yo u need?">
                               <button type="submit" class="site-btn">SEARCH</button>
                           </form>
                       </div>
                       <div class="hero__search__phone">
                           <div class="hero__search__phone__icon">
                               <i class="fa fa-phone"></i>
                           </div>
                           <div class="hero__search__phone__text">
                               <h5>+65 11.188.888</h5>
                               <span>support 24/7 time</span>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>
   <!-- Hero Section End -->

   <!-- Breadcrumb Section Begin -->
   <section class="breadcrumb-section set-bg" data-setbg="${path}img/breadcrumb.jpg">
       <div class="container">
           <div class="row">
               <div class="col-lg-12 text-center">
                   <div class="breadcrumb__text">
                       <h2>Blog</h2>
                       <div class="breadcrumb__option">
                           <a href="./index.html">Home</a>
                           <span>Blog</span>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>
   <!-- Breadcrumb Section End -->

   <!-- Blog Section Begin -->
   <section class="blog spad">
       <div class="container">
           <div class="row">
               <div class="col-lg-4 col-md-5">
                   <div class="blog__sidebar">
                       <div class="blog__sidebar__search">
                            <form action="#">
                                <input id="searchText" type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item" style="width: 360px; height: 214px;">
                            <h4>Search By Recipe Board</h4>
<!--                             스크롤바 숨기기 css 작성해야함 -->
                            <ul id="autoText" style="overflow: scroll;" >
                            </ul>
                        </div>
                       <div class="blog__sidebar__item">
                           <h4>Weekly Popular</h4>
                           <div class="blog__sidebar__recent">
                           	<c:forEach var="item" items="${weeklyPopular }">
                           		<a href="#" class="blog__sidebar__recent__item">
                                   <div class="blog__sidebar__recent__item__pic">
                                       <img src="${path}${item.board.rcp_b_thumbnail}" alt="">
                                   </div>
                                   <div class="blog__sidebar__recent__item__text">
                                       <h6>${item.board.rcp_b_title }<br /> ${item.board.rcp_b_content }</h6>
                                       <span>${item.board.rcp_b_date }</span>
                                   </div>
                               </a>
                           	</c:forEach>
                           </div>
                       </div>
                   </div>
               </div>
               <div class="col-lg-8 col-md-7">
                   <div class="row">
                       <c:forEach var="page" items="${pages }">
                       	<div class="col-lg-6 col-md-6 col-sm-6" 
                       	onclick="location.href='./board_detail?rcp_b_num=${page.board.rcp_b_num}'">
                           <div class="blog__item">
                               <div class="blog__item__pic">
                                   <img src="${path}${page.board.rcp_b_thumbnail}" alt="">
                               </div>
                               <div class="blog__item__text">
                                   <ul>
                                       <li><i class="fa fa-calendar-o"></i> ${page.member.m_regdate }</li>
                                       <li><i class="fa fa-comment-o"></i> ${page.board.rcp_b_like_count }</li>
                                   </ul>
                                   <h5><a href="#">${page.board.rcp_b_title }</a></h5>
                                   <p>${page.board.rcp_b_content } </p>
                                   <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                               </div>
                           </div>
                       </div>
                       </c:forEach>
                       <div class="col-lg-12">
                           <div class="product__pagination blog__pagination">
                           		<c:if test="${pm.prev }">
									<a href="boardList?pageNum=${pm.startPage-1 }"> &laquo;</a>
								</c:if>
								<!-- 페이지 번호 -->
								<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="idx">
									<a href="boardList?pageNum=${idx }">${idx }</a>
								</c:forEach>
								<!-- 다음 -->
								<c:if test="${pm.next && pm.endPage > 0 }">
									<a href="boardList?pageNum=${pm.endPage + 1}"> &raquo;</a>
								</c:if>
                               <a id="board_write" href="./regist" style="width: 50px;">글 쓰기</a>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </section>
   <!-- Blog Section End -->

    <%@ include file="../include/footer.jsp" %>
    <script type="text/javascript">
    	$(document).ready(function() {
    		var id = '<%=(String)session.getAttribute("id")%>';
    		
    		if(id == "null"){
				$("#board_write").attr("href","../M_Login/login");
				$("#board_write").click(function () {
					alert("로그인 해주세요");
				});
			}
    		
    		$("#searchText").keyup(function(){
				if($("#searchText").val() == ""){
					$("#autoText").empty();
				}
				else{
					$("#autoText").empty();
					$.getJSON('searchData', {searchData:$("#searchText").val()}, function(data){
						$.each(data, function(index, title){
							console.log(index);
							$("#autoText").append('<li><a href="../R_Board/board_detail?rcp_b_num=' + title.rcp_b_num + '">'+title.rcp_b_title+'</a></li>');
						});
					});
				}
			});
		});
    </script>