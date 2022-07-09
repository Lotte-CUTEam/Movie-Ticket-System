<%@ page import="dao.MovieDao" %>
<%@ page import="dto.MovieDto" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-07-07
  Time: 오후 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--
    로그인 세션 확인 코드 넣기
--%>

<%
    MovieDto dto = (MovieDto) request.getAttribute("movie");
%>
<html>
<head>
    <title>Title</title>

    <!-- css -->
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
    \<link rel="stylesheet" href="assets/css/style_moviedetail.css">
</head>
<body>

<header id="header">
    <div class="container">
        <div class="row">
            <div class="header clearfix">
                <h1>
                    <a href="#"> <em><img src="assets/img/cute-logo.png" alt="LOTTE"></em>
                    </a>
                </h1>
                <nav id="mNav">
                    <h2 class="ir_so">전체메뉴</h2>
                    <a href="#" class="ham"><span></span></a>
                </nav>
                <nav class="nav">
                    <ul class="clearfix">
                        <li><a href="#">영화</a></li>
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

<div class="detail_top_wrap">
    <div class="poster_info">
        <img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202207/18748_103_1.jpg" alt="토르: 러브 앤 썬더"></div>
    <div class="tit_info">
        <span class="ic_grade gr_12">만12세이상관람가 </span>
        <strong>토르: 러브 앤 썬더</strong>
    </div>
    <ul class="detail_info1">
        <li class="sub_info1" style="cursor: pointer;">
            <em>관람객 평점</em>
            <strong class="txt_ic_score ty2">
                <em>평점</em>
                <strong>7.9 </strong>
            </strong>
        </li>
        <li class="sub_info2">
            <em>예매율 1위 </em>
            <strong>48.5% </strong>
        </li>
        <li class="sub_info3">
            <em>누적관객수</em>
            <strong>831,866<em>명</em><span class="date_info"> </span>
            </strong>
        </li>
    </ul>
    <ul class="detail_info2">
        <li class="sub_info1">
            <em>장르</em>
            <strong>
                <em>액션, 어드벤쳐, 판타지 / 미국</em>
                <em>2022.07.06 개봉</em>
                <em class="time_info">119분</em>
            </strong>
        </li>
        <li class="sub_info2">
            <em>감독</em>
            <strong class="line_type">
                <a href="#none">타이카 와이티티</a></strong>
        </li>
        <li class="sub_info3">
            <em>출연</em>
            <strong class="line_type">
                <a href="#none">크리스 헴스워스</a>,
                <a href="#none">나탈리 포트만</a>,
                <a href="#none">테사 톰슨</a>,
                <a href="#none">크리스찬 베일</a>,
                <a href="#none">타이카 와이티티</a>
            </strong>
        </li>
    </ul>
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
    <div class="movie_detail_aside_menu">
        <ul>
            <li>
                <button type="button" class="btn_ic_share">
                    <em>공유하기</em>
                </button>
                <div id="layerShare" class="layer_wrap layer_share">

                </div>
            </li>
            <li>
                <button type="button" id="mylikemovie" class="btn_ic_wish">
                    <strong>좋아요</strong>
                    <em>2,947</em>
                </button>
            </li>
            <li class="area_reserve">
                <a href="https://www.lottecinema.co.kr/NLCHS/ticketing?movieCd=18748&amp;movieName=토르%3A 러브 앤 썬더" class="btn_col1 ty7 rnd">예매하기</a>
            </li>
        </ul>
    </div>
</div>




<div align="center">


    <table border="1">
        <%-- 이미지, 관람등급, 제목, 평점, 장르, 개봉일, 러닝타임, 감독, 주연--%>
        <col width="50"><col width="50"><col width="50"><col width="50"><col width="50">
        <col width="50"><col width="50"><col width="50"><col width="50"><col width="50">

        <tr>
            <th>
                이미지
            </th>
            <td>
                <img src="<%= dto.getImageUrl()%>" name="movieImage">
            </td>
        </tr>

        <tr>
            <th>
                관람등급
            </th>
            <td>
                <%= dto.getRated()%>
            </td>
        </tr>

        <tr>
            <th>
                제목
            </th>
            <td>
                <%= dto.getTitle()%>
            </td>
        </tr>

        <tr>
            <th>
                평점
            </th>
            <td>
                <%= dto.getRating()%>
            </td>
        </tr>

        <tr>
            <th>
                장르
            </th>
            <td>
                <%= dto.getGenre()%>
            </td>
        </tr>

        <tr>
            <th>
                개봉일
            </th>
            <td>
                <%= dto.getOpeningDate()%>
            </td>
        </tr>

        <tr>
            <th>
                러닝타임
            </th>
            <td>
                <%= dto.getRuntime()%>
            </td>
        </tr>

        <tr>
            <th>
                감독
            </th>
            <td>
                <%= dto.getDirector()%>
            </td>
        </tr>

        <tr>
            <th>
                주연
            </th>
            <td>
                <%= dto.getActor()%>
            </td>
        </tr>

        <tr>
            <td>
                <input type="button" name="reservationBtn" value="예매하기" onclick="reserve(<%= dto.getMovieId()%>)">
            </td>
        </tr>

    </table>
</div>

<script type="text/javascript">
    function reserve(id) {
        location.href = "reservation?id=" + id;
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
