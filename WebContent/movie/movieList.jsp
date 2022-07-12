<%--
/**
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]movieList.jsp
* -----------------------------------------------------------
* 수정일자           수정자         수정내용
* 2022.07.10       권나연         신규생성
* -----------------------------------------------------------
*/
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>영화 - 큐트시네마</title>

<!-- css -->
<link rel="stylesheet" href="<%=contextPath%>/assets/css/reset.css">
<link rel="stylesheet"
	href="<%=contextPath%>/assets/css/style_movieList.css">
<link rel="stylesheet" href="<%=contextPath%>/assets/css/swiper.css">
	<link rel="stylesheet" href="<%=contextPath%>/movie/css/movie.css">

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">

<!-- 자바스크립트 라이브러리 -->
<script src="<%=contextPath%>/assets/js/jquery.min_1.12.4.js"></script>
<script src="<%=contextPath%>/assets/js/modernizr-custom.js"></script>
<script src="<%=contextPath%>/assets/js/ie-checker.js"></script>
<script src="<%=contextPath%>/assets/js/swiper.min.js"></script>

</head>
<body>

	<span id="context_path" style="display: none">
		<%=contextPath%>
	</span>

	<%@include file="../header.jsp"%>

	<section id="banner">
		<div class="banner_menu">
			<h2 class="ir_so">배너 영역</h2>
			<div class="container">
				<div class="row">
					<div class="bm_left">
						<ul>
							<li class="total"><a href="#">전체메뉴</a></li>
						</ul>
					</div>
					<div class="bm_right">
						<ul>
							<li class="line"><a href="#">고객센터</a></li>
							<li class="line"><a href="#">멤버십</a></li>
							<li><a href="#">VIP</a></li>
						</ul>
						<ul>
							<li class="white"><a href="#">상영시간표</a></li>
							<li class="red"><a href="#">예매하기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="slider">
			<div class="swiper-container">
				<div class="swiper-wrapper">
					<div class="swiper-slide ss1">
						<div class="container">
							<div class="row">
							</div>
						</div>
					</div>
					<div class="swiper-slide ss2">
						<div class="container">
							<div class="row">
							</div>
						</div>
					</div>
					<div class="swiper-slide ss3">
						<div class="container">
							<div class="row">
							</div>
						</div>
					</div>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
	</section>
	<!-- //banner -->


	<section id="movie">
		<div class="container">
			<div class="row">
				<h2 class="ir_so">영화</h2>
				<div class="movie">
					<div class="movie_title">
						<ul class="clearfix">
							<li class="active"><a href="#">모든 영화</a></li>
							<li><a href="#">평점 TOP5</a></li>
							<li><a href="#">최신 TOP5</a></li>
						</ul>
					</div>

					<!-- 검색, 필터 영역 -->
					<div class="movies_ctrl">
						<div id="movie_search_filter">
							<div class="movie_search">
								<select id="searchCategory" class="search_category">
									<option value="">검색</option>
									<option value="title">제목</option>
									<option value="director">감독</option>
									<option value="actor">배우</option>
								</select>

								<input type="text" id="search" value="" class="search_input">
								<img src="<%=contextPath%>/movie/img/magnifying-glass-solid.svg"
									 onclick="searchMovie()" class="search_btn">
							</div>

							<div class="empty_space"></div>

							<div class="movie_filter">
								<span title="rating" onclick="goFilter('rating')" class="filter_span">평점순</span> &nbsp;&nbsp;
								<span title="opening_date" onclick="goFilter('opening_date')" class="filter_span">최신 개봉순</span> &nbsp;&nbsp;
							</div>
						</div>

					</div>


					<div class="movie_chart">
						<!-- 영화 목록 영역 -->
						<div class="chart_cont1"></div>
					</div>

					<!-- 페이지 번호 영역 -->
					<div class="movies_ctrl">
						<div class="movie_page">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //movie -->

	<%@include file="../footer.jsp"%>



<script src="<%=contextPath%>/assets/js/banner.js"></script>
<script src="<%=contextPath%>/movie/js/movie.js"></script>

</body>
</html>