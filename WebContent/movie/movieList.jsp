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
								<h3>토르-러브 앤 썬더</h3>
								<p>토르 개봉 히히</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide ss2">
						<div class="container">
							<div class="row">
								<h3>엘비스</h3>
								<p>엘비스입니당 낄낄</p>
							</div>
						</div>
					</div>
					<div class="swiper-slide ss3">
						<div class="container">
							<div class="row">
								<h3>무비무비</h3>
								<p>이건 대체 먼 영화여</p>
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

					<div class="movies_ctrl">

						<div id="movie_search_filter">
							<div class="movie_search">
								<select id="searchCategory" class="search_category">
									<option>검색</option>
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
						<!-- 영화 평점 TOP5 -->
						<div class="chart_cont1"></div>
					</div>

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

	<script>


  let curSearchCategory = "";
  let curSearch = "";
  let curFilter = "";
  let curPageNo = 0;

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
      delay : 5000,
    },
  });

  //영화차트 탭 메뉴
  var movBtn = $(".movie_title > ul > li");
  var movCont = $(".movie_chart > div");

  movCont.hide().eq(0).show();

  let chartCont = $('.chart_cont1');

  movBtn.click(function(e) {
    e.preventDefault();

    var target = $(this);
    var index = target.index();

    movBtn.removeClass("active");
    target.addClass("active");

    movieMenuBtnToggle(index);
  });

  function movieMenuBtnToggle(index) {
	  chartCont.empty();

	  let moviesCtrl = $('.movies_ctrl');
	  if (index == 0) {
		  moviesCtrl.show();
		  getMovies();

	  } else if (index == 1) {
		  moviesCtrl.hide();
		  getMoviesScreeningRatingTop5();

	  } else if (index == 2) {
		  moviesCtrl.hide();
		  getMoviesLatestScreeningTop5();
	  }
  }

  movieMenuBtnToggle(0);

  // 4번째 영화 오른쪽 마진 0 설정'
  function setMovieDivMarginTop() {
    let movDiv = $(".movie_div");
    for (let i=0; i<movDiv.length; i++) {
      if (i%4 == 3) {
        movDiv.eq(i).css("margin-right", "0px");
      }
    }
  }

  function goPage(pageNo) {

    curPageNo = pageNo;

    getMovies();
  }

  function goFilter(filter) {
    curFilter = filter;
    curPageNo = 0;

    getMovies();
  }

  function searchMovie() {
    let vSearchCategory = $('#searchCategory').val();
    let vSearch = $('#search').val();

    curSearchCategory = vSearchCategory;
    curSearch = vSearch;

    getMovies();
  }

  function getMoviesScreeningRatingTop5() {
    let chartCont = $('.chart_cont1')

    $.ajax({
      url: "<%=contextPath%>/movies/rating-top5",
      type: "GET",
      success: function (data) {
        console.log("[index.jsp] getMovies: success get movies data ");
        console.log(data);

        let html = "";
        $.each(data, function(idx, movie) {
          html += makeMovieTop5Div(idx, movie);
        });
        chartCont.append(html);

        setMovieDivMarginTop();
      },
      error: function (request,status,error) {
        console.log(request, error, status);
        alert("error");
      }
    }) ;

  }

  function getMoviesLatestScreeningTop5() {

    $.ajax({
      url: "<%=contextPath%>/movies/latest-top5",
      type: "GET",
      success: function (data) {
        console.log("[index.jsp] getMovies: success get movies data ");
        console.log(data);

        let html = "";
        $.each(data, function(idx, movie) {
          html += makeMovieTop5Div(idx, movie);
        });
        chartCont.append(html);

        setMovieDivMarginTop();
      },
      error: function (request,status,error) {
        console.log(request, error, status);
        alert("error");
      }
    }) ;

  }

  function makeMoviePageIdx(pageCnt, pageNo) {

    let moviePage = $('.movie_page');

    let html = "<ul class=clearfix>";

    for (let i=0; i<pageCnt; i++) {
      if (pageNo == i) {
        html += `<li class="active"><a>` + (i + 1) + `</a></li>`;
      }
      else {
        html += `<li><a onclick="goPage(`+ i + `)">` + (i + 1) + `</a></li>`;
      }
    }
	html += "</ul>";

    moviePage.empty();
    moviePage.append(html);
  }

  function getMovies() {
    $.ajax({
      url: "<%=contextPath%>/movies/all?searchCategory=" + curSearchCategory + "&search=" + curSearch + "&pageNo="
                                        + curPageNo + "&filter=" + curFilter,
      type: "GET",
      success: function (data) {
        console.log("[index.jsp] getMovies: success get movies data ");

        let html = "";
        $.each(data.movies, function(idx, movie) {
          html += makeMoviesDiv(idx, movie);
        });
        chartCont.append(html);

        setMovieDivMarginTop();
        makeMoviePageIdx(data.pageCnt, data.pageNo);

        curSearchCategory = data.searchCategory;
        curSearch = data.search;
      },
      error: function (request,status,error) {
        console.log(request, error, status);
        alert("error");
      },
      fail: function (err) {
        console.log(err);
      }
    });
  }

  function makeMovieTop5Div(idx, movie) {
    return `         <div class="movie_div">
                                    <div class="poster">
                                        <figure>
                                            <img src="` + movie.imageUrl + `" alt="` + movie.title + `">
                                        </figure>
                                        <div class="rank">
                                            <strong>` + (idx + 1) + `</strong>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h4 align="center">
                                            <span class="icon a15 ir_pm">` + movie.rated + `세 이상 관람</span>
                                            <strong>` + dot3(movie.title) + `</strong>
                                        </h4>
                                        <div class="infor_btn">
                                            <a href="<%= request.getContextPath()%>/movieDetail?param=detail&id=` + movie.movieId + `">상세정보</a> <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>`;
  }

  function makeMoviesDiv(idx, movie) {
    return `         <div class="movie_div">
                                    <div class="poster">
                                        <figure>
                                            <img src="` + movie.imageUrl + `" alt="` + movie.title + `">
                                        </figure>
                                        <div class="rated">
                                            <strong>` + (movie.rated) + `</strong>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h4 align="center" style="margin-top: -10px; margin-bottom: 10px;">
                                            <span class="icon a15 ir_pm">` + movie.rated + `세 이상 관람</span>
                                            <strong>` + dot3(movie.title) + `</strong>
                                        </h4>
                                        <div class="infor_btn">
                                            <a href="<%= request.getContextPath()%>/movieDetail?param=detail&id=` + movie.movieId + `">상세정보</a> <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>`;
  }

  function dot3(msg) { // 글이 길 때 ...으로 줄임
    let str = "";
    if (msg.length >= 20) {
      str = msg.substring(0, 20);
      str += "...";
    } else {
      str = msg.trim();
    }
    return str;
  }

</script>
</body>
</html>