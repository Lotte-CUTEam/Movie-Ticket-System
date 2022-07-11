<!-- 
[프로젝트]롯데e커머스_자바전문가과정
[시스템명]영화예매시스템
[팀 명]CUTEam
[파일명]myPageBf.jsp
-----------------------------------------------------------
수정일자			수정자		수정내용
2022.07.11		정은우		신규생성
-----------------------------------------------------------
 -->
<%@page import="dto.MemberDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
MemberDto mem = (MemberDto) session.getAttribute("login");

if (mem == null || mem.getId() == null || mem.getId().equals("")) {
%>
<script type="text/javascript">
	alert('로그인 해주세요');
	location.href = "<%=request.getContextPath()%>/member?param=login";
</script>
<%
} else {
%>
<script type="text/javascript">
	location.href = "<%=request.getContextPath()%>/mypage?param=showMypage&memberId=<%=mem.getId()%>";
</script>
<%
}
%>