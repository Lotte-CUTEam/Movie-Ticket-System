<%-- index.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--<%
Object obj = session.getAttribute("login");
if(obj != null) {
	response.sendRedirect(request.getContextPath()+"/bbs?param=list");
}
else {
	response.sendRedirect(request.getContextPath()+"/member?param=login");
}
%>--%>

<a href="movie?param=movieDetail&id=1">영화 상세 페이지로 이동</a>

</body>
</html>
