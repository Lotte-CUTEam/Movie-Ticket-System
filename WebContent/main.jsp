<!--
/**
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]main.jsp
* -----------------------------------------------------------
* 수정일자          수정자             수정내용
* 2022.07.08      이성은             신규생성
* -----------------------------------------------------------
*/
-->

<%@page import="dto.MemberDto"%>
<%@page import="dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!public String dot3(String msg) { // 글이 길 때 ...으로 줄임
        String str = "";
        if (msg.length() >= 7) {
            str = msg.substring(0, 7);
            str += "...";
        } else {
            str = msg.trim();
        }
        return str;
    }%>

<%
MovieDao movieDao = MovieDao.getInstance();
List<MovieDto> movies = movieDao.getMovies();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>큐트시네마</title>

<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
</head>
<body>

	 
	 
<%@include file = "header.jsp" %>

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
							<li class="red"><a href="screen">예매하기</a></li>
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
								<h3>토르-러브 앤 썬더</h3><p>토르 개봉 히히</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide ss2">
						<div class="container">
							<div class="row">
								<h3>엘비스</h3><p>엘비스입니당 낄낄</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide ss3">
						<div class="container">
							<div class="row">
								<h3>무비무비</h3><p>이건 대체 먼 영화여</p>
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
				<h2 class="ir_so">영화 예매</h2>
				<div class="movie">
					<div class="movie_title">
						<ul class="clearfix">
							<li class="active"><a href="#">무비차트</a></li>
							<li><a href="#">최신개봉작</a></li>
							<li><a href="#">상영예정작</a></li>
						</ul>
					</div>
					<div class="movie_chart">
						<div class="swiper-container2">
							<div class="chart_cont1 swiper-wrapper">
								<%
								for (int i = 0; i < 7; i++) {
								%>
								<div class="swiper-slide">
									<div class="poster">
										<figure>
											<img src="<%=movies.get(i).getImageUrl()%>"
												alt="<%=movies.get(i).getTitle()%>">
										</figure>
										<div class="rank">
											<strong><%=i + 1%></strong>
										</div>
									</div>
									<div class="infor">
										<h3>
											<span class="icon a15 ir_pm">12세 이상 관람</span> <strong><%=dot3(movies.get(i).getTitle())%></strong>
										</h3>
									</div>
								</div>
								<%
								}
								%>
							</div>
						</div>
						<!-- //무비차트-->
 
						<div class="swiper-container2">
							<div class="chart_cont2 swiper-wrapper">
								<%
								for (int i = 7; i < 12; i++) {
								%>
								<div class="swiper-slide">
									<div class="poster">
										<figure>
											<img src="<%=movies.get(i).getImageUrl()%>"
												alt="<%=movies.get(i).getTitle()%>">
										</figure>
										<div class="rank">
											<strong><%=i - 6%></strong>
										</div>
									</div>
									<div class="infor">
										<h3>
											<span class="icon a15 ir_pm">12세 이상 관람</span> <strong><%=dot3(movies.get(i).getTitle())%></strong>
										</h3>
									</div>
								</div>
								<%
								}
								%>
							</div>
						</div>
						<!-- //최신개봉작-->

						<div class="swiper-container2">
							<div class="chart_cont3 swiper-wrapper">
								<%
								for (int i = 12; i < movies.size(); i++) {
								%>
								<div class="swiper-slide">
									<div class="poster">
										<figure>
											<img src="<%=movies.get(i).getImageUrl()%>"
												alt="<%=movies.get(i).getTitle()%>">
										</figure>
										<div class="rank">
											<strong><%=i - 11%></strong>
										</div>
									</div>
									<div class="infor">
										<h3>
											<span class="icon a15 ir_pm">12세 이상 관람</span> <strong><%=dot3(movies.get(i).getTitle())%></strong>
										</h3>
									</div>
								</div>
								<%
								}
								%>
							</div>
						</div>
						<!-- //상영예정작-->

					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //movie -->
	
<%@include file = "footer.jsp" %>

<script>
 
        window.addEventListener('load', function() {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function(el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            el.outerHTML = this.responseText;
                        }
                    };
                    xhttp.open('GET', includePath, true);
                    xhttp.send();
                }
            });
        });
 
    </script>


	<!-- 자바스크립트 라이브러리 -->
	<script src="assets/js/jquery.min_1.12.4.js"></script>
	<script src="assets/js/modernizr-custom.js"></script>
	<script src="assets/js/ie-checker.js"></script>
	<script src="assets/js/swiper.min.js"></script>
	<script src="assets/js/banner.js"></script> <!-- 배너 이미지 슬라이드 -->
	<script>

		//영화차트 이미지 슬라이드
		var swiper = new Swiper('.swiper-container2', {
			slidesPerView : 4,
			spaceBetween : 24,
			mousewheel : {
				invert : true,
			},
			keyboard : {
				enabled : true,
				onlyInViewport : false,
			},
			autoplay : {
				delay : 2000,
				disableOnInteraction: false,
			},
			breakpoints : {
				600 : {
					slidesPerView : 1.4,
					spaceBetween : 24
				},
				768 : {
					slidesPerView : 2,
					spaceBetween : 24
				},
				960 : {
					slidesPerView : 3,
					spaceBetween : 24
				}
			},
			 observer: true,	// 추가
			 observeParents: true,	// 추가
		});

		//영화차트 탭 메뉴
		var movBtn = $(".movie_title > ul > li");
		var movCont = $(".movie_chart > div");

		movCont.hide().eq(0).show();

		movBtn.click(function(e) {
			e.preventDefault();
			var target = $(this);
			var index = target.index();
			movBtn.removeClass("active");
			target.addClass("active");
			movCont.css("display", "none");
			movCont.eq(index).css("display", "block");
		});
	</script>
</body>
</html>