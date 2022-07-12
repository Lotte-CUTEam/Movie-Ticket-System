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

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="dto.MovieDto" %>

<html>
<head>
    <meta charset="UTF-8">

    <title>영화 상세 - 큐트시네마</title>

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

<%@include file="../header.jsp"%>

<%@include file = "/quickbar.jsp" %>

<%
    if (id != null)
        System.out.println("***id 확인: " + id + "***");

    MovieDto dto = (MovieDto) request.getAttribute("movie");
%>


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

<%@include file="../footer.jsp"%>


</body>
</html>
