<!-- /**
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]logout.jsp
* -----------------------------------------------------------
* 수정일자          수정자          수정내용
* 2022.07.11       이충현          신규생성
* -----------------------------------------------------------
*/-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
<script type="text/javascript">
    alert("로그아웃 되었습니다.");
    location.href = "<%=request.getContextPath()%>/main";
</script>



