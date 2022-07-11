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
	String id = null;
    Object obj = session.getAttribute("login");
    MemberDto mem = null;
    if (obj != null) {
        mem = (MemberDto) obj;
        id = mem.getId();
    }

if (id == null)
    id = "";
else
    System.out.println("***id 확인: " + id + "***");

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
<title>롯데시네마 구현하기</title>

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

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="main"> <em><img src="assets/img/cute-logo.png" alt="LOTTE"></em> </a>
					</h1>
					<nav id="mNav">
						<h2 class="ir_so">전체메뉴</h2>
						<a href="#" class="ham"><span></span></a>
					</nav>
					<nav class="nav">
						<ul class="clearfix">
							<li><a href="movie?param=list">영화</a></li>
							<li><a href="#">영화관</a></li>
							<li><a href="#">특별관</a></li>
							<%
							if (id != "") {
							%>
							<li><a href="mypage?param=mypage">마이페이지</a></li>
							<li><a href="member?param=logout">로그아웃</a></li>
							<%
							} else {
							%>
							<li><a href="member?param=regi">회원가입</a></li>
							<li><a href="member?param=login">로그인</a></li>
							<%
							}
							%>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- //header -->


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

	<footer id="footer">
		<div id="footer_sns">
			<div class="container">
				<div class="footer_sns">
					<ul>
						<li class="icon s1"><a href="#"><span class="ir_pm">트위터</span></a></li>
						<li class="icon s2"><a href="#"><span class="ir_pm">페이스북</span></a></li>
						<li class="icon s3"><a href="#"><span class="ir_pm">인스타그램</span></a></li>
						<li class="icon s4"><a href="#"><span class="ir_pm">구글 플레이</span></a></li>
						<li class="icon s5"><a href="#"><span class="ir_pm">아이폰 앱스토어</span></a></li>
					</ul>
					<div class="tel">
						<a href="#">ARS <em>0101-0101</em></a>
					</div>
				</div>
			</div>
		</div>
		<div id="footer_infor">
			<div class="container">
				<div class="row">
					<div class="footer_infor">
						<h2 style="margin-bottom: 20px;">
							<img src="assets/img/logo-footer.png" alt="lotte">
						</h2>
						<address>
							<p>
								서울 서초구 서초대로74길 33, 비트교육센터 3층<br> <span class="bar2">정은우</span>
								이충현 안채영 권나연 장혜원 이성은<br> <span class="bar2">롯데e커머스</span>
								CUTEam
							</p>
							<p>Copyright 2022 by Lotte CUTEam All right reserved</p>
						</address>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- //footer -->

	<!-- 자바스크립트 라이브러리 -->
	<script src="assets/js/jquery.min_1.12.4.js"></script>
	<script src="assets/js/modernizr-custom.js"></script>
	<script src="assets/js/ie-checker.js"></script>
	<script src="assets/js/swiper.min.js"></script>
	<script>
		//배너 이미지 슬라이드
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			autoplay : {
				delay : 4000,
			},
		});

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