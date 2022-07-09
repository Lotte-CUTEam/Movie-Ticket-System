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
