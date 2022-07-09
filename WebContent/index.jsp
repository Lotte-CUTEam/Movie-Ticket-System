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

<%
Object obj = session.getAttribute("login");
if(obj != null) {
	response.sendRedirect(request.getContextPath()+"/bbs?param=list");
}
else {
	response.sendRedirect(request.getContextPath()+"/member?param=login");
}
%>

</body>
</html>
