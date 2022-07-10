<%@ page import="dto.MovieDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<MovieDto> ratingTop5 = (List<MovieDto>) request.getAttribute("rating-top5");
    List<MovieDto> latestTop5 = (List<MovieDto>) request.getAttribute("latest-top5");
    List<MovieDto> movies = (List<MovieDto>) request.getAttribute("movies");

    String searchCategory = (String) request.getAttribute("searchCategory");
    String search = (String) request.getAttribute("search");
    int pageCnt = (Integer) request.getAttribute("pageCnt");
    int pageNo = (Integer) request.getAttribute("pageNo");
    String filter = (String) request.getAttribute("filter");

    if (searchCategory == null) {
        searchCategory = "";
    }
    if (search == null) {
        search = "";
    }
    if (filter == null) {
        filter = "";
    }
%>
<%!public String dot3(String msg) { // 글이 길 때 ...으로 줄임
    String str = "";
    if (msg.length() >= 8) {
        str = msg.substring(0, 8);
        str += "...";
    } else {
        str = msg.trim();
    }
    return str;
}%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>영화 - 큐트시네마</title>

    <!-- css -->
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/style_movieList.css">
    <link rel="stylesheet" href="/assets/css/swiper.css">

    <!-- 웹 폰트 -->
    <link
            href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
            rel="stylesheet">

    <!-- 자바스크립트 라이브러리 -->
    <script src="/assets/js/jquery.min_1.12.4.js"></script>
    <script src="/assets/js/modernizr-custom.js"></script>
    <script src="/assets/js/ie-checker.js"></script>
    <script src="/assets/js/swiper.min.js"></script>

</head>
<body>

<header id="header">
    <div class="container">
        <div class="row">
            <div class="header clearfix">
                <h1>
                    <a href="#"> <em><img src="/assets/img/cute-logo.png" alt="LOTTE"></em>
                    </a>
                </h1>
                <nav id="mNav">
                    <h2 class="ir_so">전체메뉴</h2>
                    <a href="#" class="ham"><span></span></a>
                </nav>
                <nav class="nav">
                    <ul class="clearfix">
                        <li><a href="/movie?param=list">영화</a></li>
                        <li><a href="#">영화관</a></li>
                        <li><a href="#">특별관</a></li>
                        <li><a href="#">마이페이지</a></li>
                        <li><a href="#">로그인</a></li>
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
                        <li class="active"><a href="#">평점 TOP5</a></li>
                        <li><a href="#">최신 개봉작</a></li>
                        <li><a href="#">모든 작품</a></li>
                    </ul>
                </div>

                <div class="movie_page">
                    <!-- FIXME 페이징 필터 -->
                    <%
                        for (int i=0; i<pageCnt; i++) {
                            if (pageNo == i) {
                    %>
                                <span style="background: red">
                                    <%=i + 1%>
                                </span>
                    <%
                            }
                            else {
                    %>
                                <a href="#" title="<%=i + 1%> 페이지" onclick="goPage(<%=i%>)">
                                    [<%=i + 1%>]
                                </a>
                    <%
                            }
                        }
                    %>
                </div>

                <div class="movie_filter">
                    <span title="rating" onclick="goFilter('rating')">평점순</span> &nbsp;&nbsp;
                    <span title="opening_date" onclick="goFilter('opening_date')">최신 개봉순</span> &nbsp;&nbsp;
                </div>

                <div class="movie_search">
                    <select id="searchCategory">
                        <option>검색</option>
                        <option value="title">제목</option>
                        <option value="director">감독</option>
                        <option value="actor">배우</option>
                    </select>

                    <input type="text" id="search" value="<%=search %>">
                    <button type="button" onclick="searchMovie()">검색</button>
                </div>

                <div class="movie_chart">
                    <!-- 영화 평점 TOP5 -->
                    <div class="chart_cont1">
                        <%
                            for (int i=0; i<ratingTop5.size(); i++) {
                                MovieDto movie = ratingTop5.get(i);
                         %>
                            <div class="movie_div">
                                <div class="poster">
                                    <figure>
                                        <img src="<%=movie.getImageUrl()%>" alt="<%=movie.getTitle()%>>">
                                    </figure>
                                    <div class="rank">
                                        <strong>
                                            <%=i + 1%>
                                        </strong>
                                    </div>
                                </div>
                                <div class="infor">
                                    <h3>
                                        <span class="icon a15 ir_pm"><%=movie.getRated()%>세 이상 관람</span>
                                        <strong><%=dot3(movie.getTitle())%>
                                        </strong>
                                    </h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a> <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>

                    </div>

                    <!-- 최신 개봉작 TOP5 -->
                    <div class="chart_cont2">
                        <%
                            for (int i=0; i<latestTop5.size(); i++) {
                                MovieDto movie = latestTop5.get(i);
                        %>
                        <div class="movie_div">
                            <div class="poster">
                                <figure>
                                    <img src="<%=movie.getImageUrl()%>" alt="<%=movie.getTitle()%>>">
                                </figure>
                                <div class="rank">
                                    <strong>
                                        <%=i + 1%>
                                    </strong>
                                </div>
                            </div>
                            <div class="infor">
                                <h3>
                                    <span class="icon a15 ir_pm"><%=movie.getRated()%>세 이상 관람</span>
                                    <strong><%=dot3(movie.getTitle())%>
                                    </strong>
                                </h3>
                                <div class="infor_btn">
                                    <a href="#">상세정보</a> <a href="#">예매하기</a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <!-- 모든 영화 -->
                    <div class="chart_cont3">

                        <%
                            for (int i=0; i<movies.size(); i++) {
                                MovieDto movie = movies.get(i);
                        %>
                        <div class="movie_div">
                            <div class="poster">
                                <figure>
                                    <img src="<%=movie.getImageUrl()%>" alt="<%=movie.getTitle()%>>">
                                </figure>
                                <div class="rank">
                                    <strong>
                                        <%=movie.getRated()%> <!-- 관람 등급 -->
                                    </strong>
                                </div>
                            </div>
                            <div class="infor">
                                <h3>
                                    <span class="icon a15 ir_pm"><%=movie.getRated()%>세 이상 관람</span>
                                    <strong><%=dot3(movie.getTitle())%>
                                    </strong>
                                </h3>
                                <div class="infor_btn">
                                    <a href="#">상세정보</a> <a href="#">예매하기</a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
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
                    <li class="icon s4"><a href="#"><span class="ir_pm">구글
									플레이</span></a></li>
                    <li class="icon s5"><a href="#"><span class="ir_pm">아이폰
									앱스토어</span></a></li>
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
                        <img src="/assets/img/logo-footer.png" alt="lotte">
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
      delay : 5000,
    },
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

  // 4번째 영화 오른쪽 마진 0 설정
  for (let i=0; i<movCont.length; i++) {
    let movDiv = movCont.eq(i).children(".movie_div");
    for (let j=0; j<movDiv.length; j++) {
      if (j%4 == 3) {
        movDiv.eq(j).css("margin-right", "0px");
      }
    }
  }

  // 초기 검색 카테고리 설정
  let search = "<%=search %>";
  if(search != ""){
    let obj = $("#searchCategory");
    obj.value = "<%=searchCategory %>";
    obj.setAttribute("selected", "selected");
  }

  function goPage(pageNo) {
    // FIXME 페이징, 필터
    location.href = "/movie?param=list&pageNo=" + pageNo + "&filter=" + "<%=filter%>";
  }

  function goFilter(filter) {
    location.href = "/movie?param=list&pageNo=0" + "&filter=" + filter;
  }

  function searchMovie() {
    let sc = $('#searchCategory');
    let ss = $('#search');
    let searchCategory = $('#searchCategory').value;
    let search = $('#search').value;

    location.href = "/movie?param=list&searchCategory=" + searchCategory + "&search=" + search;
  }
</script>
</body>
</html>