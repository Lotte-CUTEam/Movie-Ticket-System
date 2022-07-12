<%--

/**
[프로젝트]롯데e커머스_자바전문가과정
[시스템명]영화예매시스템
[팀   명]CUTEam
* -----------------------------------------------------------
수정일자           수정자         수정내용
2022.07.09       안채영         신규생성
2022.07.11       안채영         css구현
* -----------------------------------------------------------
*/

--%>

<%@ page import="dto.MovieDto" %>
<%@ page import="dto.MemberDto" %>

<%@ page import="dao.MovieDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<%
    MovieDto dto = (MovieDto) request.getAttribute("movie");
%>
<html>
<head>
    <title>영화 상세 페이지</title>

    <!-- css -->
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
    <link rel="stylesheet" href="assets/css/style_moviedetail.css">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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


<div align="center" class="poster_info">

    <table class="table">
        <tr>
            <div style="width: 300px; height: 400px; margin: 50px">
                <img src="<%= dto.getImageUrl()%>" style="margin-top:30px; box-shadow: 10px 11px 10px 0 black;" width="300px" height="400px">
            </div>
        </tr>

        <tr>
            <div class="tit_info align-center">
                <span::before class="ic_grade gr_<%= dto.getRated()%>">만<%= dto.getRated()%>이상관람가 </span::before>&nbsp;
                <strong style="font-size: 30px; margin-top: 10px;"><%= dto.getTitle()%></strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>


        <tr>
            <div class="detail_info1">
                <span class="movie-detail-span">관람객 평점</span>
                <strong class="txt_ic_score ty2">
                    <strong style="font-size: 25px"><%= dto.getRating()%></strong>점
                </strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

        <tr>
            <div class="sub_info1">
                <span class="movie-detail-span">장르</span>
                <strong>
                    <strong><%= dto.getGenre()%></strong>&nbsp;&nbsp;&nbsp;
                    <span><strong><%= dto.parseOpeningDate()%></strong>&nbsp;개봉</span>&nbsp;&nbsp;&nbsp;
                    <span class="time_info"><strong><%= dto.getRuntime()%></strong>분</span>&nbsp;&nbsp;&nbsp;
                </strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

        <tr>
            <div class="sub_info2">
                <span class="movie-detail-span">감독</span>
                <strong><%= dto.getDirector()%></strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

        <tr>
            <div class="sub_info3">
                <span class="movie-detail-span">출연</span>
                <strong><%= dto.getActor()%></strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>
    </table>

    <div class="detail_top_wrap">
        <div class="spacial_hall_info">
                <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/e2a94c82115c46f7b326baee6e10266a.png" alt="샤롯데바로가기">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/61fb906fbd9b4ff1b34d6e0bd78dc655.png" alt="수퍼4D 바로가기">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/c9078226c9ad4085b1b629bee2aba138.png" alt="수퍼플렉스 바로가기">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/3ffca854b1844fdc8b54d8d9db45a03f.png" alt="수퍼플렉스 G 바로가기">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/ff43cb260a2647dbb5f3c62b709103c4.png" alt="수퍼S 바로가기">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/5c23288d3a104f7fa4f7d3e725a2c6a8.PNG" alt="씨네컴포트">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/208a5ede362244fb8ab2e5cc3ab07529.PNG" alt="씨네살롱">
                </span>
            <span>
                    <img src="http://caching.lottecinema.co.kr//Media/WebAdmin/2a366799460a49359bf93250f50852cf.png" alt="컬러리움">
                </span>
        </div>

    </div>

    <button type="button" name="reservationBtn" onclick="reserve(<%= dto.getMovieId()%>)" style="padding: 10px; margin-bottom: 50px; border: 1px solid black ">예매하기</button>
</div>


<script type="text/javascript">
    function reserve(id) {

      <%
        Object loginObj = session.getAttribute("login");

        if(loginObj ==null) {
        %>
            alert('로그인 해 주십시오');
            location.href = "<%=request.getContextPath() %>/member?param=login";
        <%
        } else {
            %>
            // location.href = "/screen?param=screenChoice&movie_id=" + id;

            location.href = "/reservation?param=reservation&movie_id=" + id;
            <%
        }
      %>

    }
</script>


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

</body>
</html>
