<%--
/**
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]reservationDetail.jsp
* -----------------------------------------------------------
* 수정일자           수정자         수정내용
* 2022.07.11       안채영         신규생성
* -----------------------------------------------------------
*/
--%>


<%@ page import="dto.ReservationDto" %>
<%@ page import="dto.MemberDto" %>
<%@ page import="dto.MovieDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String id = null;
    Object obj = session.getAttribute("login");
    MemberDto mem = null;
    if (obj != null) {
        mem = (MemberDto) obj;
        id = mem.getId();
    }else {
        %>
        <script type="text/javascript">
            alert("로그인 해주세요");
            location.href = "<%=request.getContextPath()%>/member?param=login";
        </script>
        <%
    }


%>

<%

    ReservationDto dto = (ReservationDto) request.getAttribute("reservation");
    MovieDto movieDto = (MovieDto) request.getAttribute("movie");

%>
<html>
<head>
    <title>예매 내역 - 큐트시네마</title>

    <!-- css -->
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
    <link rel="stylesheet" href="assets/css/style_moviedetail.css">
    <link rel="stylesheet" href="assets/css/style_reservationDetail.css">

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


<div align="center" class="poster_info" style="margin-top: 50px; margin-bottom: 50px;">

    <table class="table">

        <tr>
            <div class="reservation-title">
                <strong>예매가 확정되었습니다!</strong>
            </div>
        </tr>

        <tr>
            <div style="width: 300px; height: 400px; margin: 50px">
                <img src="<%= movieDto.getImageUrl()%>" class="movie-image">
            </div>
        </tr>

        <tr>
            <div class="tit_info align-center" style="margin-top: -50px;">
                <span::before class="ic_grade gr_<%= movieDto.getRated()%>">만<%= movieDto.getRated()%>이상관람가 </span::before>&nbsp;
                <strong style="font-size: 30px; margin-top: 10px;"><%= movieDto.getTitle()%></strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

        <tr>
            <div class="detail_info1">
                <span class="movie-detail-span"><%= dto.getCinema()%></span>&nbsp;&nbsp;
                <strong class="txt_ic_score ty2">
                    <strong><%= dto.getScreenAt().toString().split("T")[0]%> ~ </strong>
                    <strong><%= dto.calcEndTime()%></strong>
                    <span class="time_info"><strong>(<%= movieDto.getRuntime()%></strong>분)</span>&nbsp;&nbsp;&nbsp
                </strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

        <tr>
            <div class="sub_info1">
                <strong>
                    <strong><%= dto.getPeople_count() %>명</strong>&nbsp;&nbsp;&nbsp;
                </strong>
            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

        <tr>
            <div class="sub_info1">
                <ul>
                    <li >
                        극장 이용 시 마스크 착용은 필수 입니다.
                        <br>( 미착용 시 입장 제한)
                        <br>
                        입장 지연에 따른 관람 불편을 최소화 하기 위해 본 영화는 10분 후 상영이 시작됩니다.
                    </li>
                    <li>
                        영화 상영시작시간 15분 전까지 취소가 가능하며 캡쳐화면은 입장이 제한될 수 있습니다.
                    </li>
                </ul>


            </div>
            <div style="height:10px;">&nbsp;</div>
        </tr>

    </table>

    <button type="button" name="mainButton" onclick="goToMain()">확인</button>
</div>s


<script type="text/javascript">
  function goToMain() {
    location.href = "<%=request.getContextPath() %>/main";
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
