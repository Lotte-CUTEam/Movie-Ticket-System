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
</head>
<body>

<h2>영화 상세 페이지</h2>

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

</body>
</html>
