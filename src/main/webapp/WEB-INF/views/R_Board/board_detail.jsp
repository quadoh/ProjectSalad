<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                                <hr>
                                <input type="button" value="searchdata">
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

    <!-- Blog Details Hero Begin -->
    <section class="blog-details-hero set-bg" data-setbg="${path}img/blog/details/details-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog__details__hero__text">
                        <h2>${board.board.rcp_b_title }</h2>
                        <ul>
                            <li>${board.member.m_name }</li>
                            <li><fmt:formatDate value="${board.board.rcp_b_date }" pattern="yyyy년 MM월 dd일"/> </li>
                            <li>${fn:length(comments) } Comments</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input id="searchText" type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item" style="width: 360px; height: 214px;">
                            <h4>Searche By Recipe Board</h4>
<!--                             스크롤바 숨기기 css 작성해야함 -->
                            <ul id="autoText" style="overflow: scroll;" >
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Recent News</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${path}img/blog/sidebar/sr-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${path}img/blog/sidebar/sr-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${path}img/blog/sidebar/sr-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                                        <span>MAR 05, 2019</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                      
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <img src="${path}${board.recipe.rcp_img}" alt="" height="631" width="750">
<%-- 					<img src="${path}img/blog/details/details-pic.jpg" alt=""> --%>
                        
                        <p>${board.board.rcp_b_content }</p>
                        <h3>${board.recipe.rcp_cmbnt }</h3>
                    </div>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="${path}img/blog/details/details-author.jpg" alt="">
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>${board.member.m_name }</h6>
                                        <span>${board.member.m_email }</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <ul>
                                        <li><span>Categories:</span> Food</li>
                                        <li><span>Tags:</span> All, Trending, Cooking, Healthy Food, Life Style</li>
                                    </ul>
                                    <div class="blog__details__social">
<%--                                     ${board.like }로 좋아요 한지 안한지 true, false로 체크 가능 이걸로 색깔 지정해야함 --%>
                                        <a href="./likeCheck?rcp_b_num=${board.board.rcp_b_num }"><i class="fa fa-heart"></i></a>
                                    </div>
                                    <div id="controll_btn" class="col-lg-1">
                                    	<input type="button" value="수정하기" onclick="location.href='./boardModify?rcp_b_num=${board.board.rcp_b_num}'">
                                    	<input type="button" value="삭제하기" onclick="location.href='../R_Board/boardDelete?rcp_b_num=${board.board.rcp_b_num}'">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
    <section class="related-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related-blog-title">
                        <h2>인기 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="item" items="${weeklyPopular }">
                	<div class="col-lg-4 col-md-4 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="${path}${item.board.rcp_b_thumbnail}" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> ${item.board.rcp_b_date }</li>
                                <li><i class="fa fa-comment-o"></i> ${item.board.rcp_b_like_count }</li>
                            </ul>
                            <h5><a href="#">${item.board.rcp_b_title }</a></h5>
                            <p>${item.board.rcp_b_content }</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
            </div>
        </div>
    </section>
    <!-- Related Blog Section End -->

    <%@ include file="../include/footer.jsp" %>

	<script type="text/javascript">
		$(document).ready(function(){
			var login_id = '<%=(String)session.getAttribute("id")%>';
			var board_id = "<c:out value='${board.member.m_id}'/>";
			
			login_id = 'ckck';
			
			console.log("login " + login_id + "good");
			console.log("board " + board_id + "good");
			
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
			
			if(login_id != board_id){
				$("#controll_btn").css("display", "none");
			}
		});
	</script>

</body>

</html>