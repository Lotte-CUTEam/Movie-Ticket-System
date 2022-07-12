<!-- /**
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]message.jsp
* -----------------------------------------------------------
* 수정일자		수정자		수정내용
* 2022.07.11	정은우		신규생성
* -----------------------------------------------------------
*/-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String msg = request.getParameter("msg");
    String param = request.getParameter("param");
%>

<%
if (param.equals("mypage")) {
    if (msg.equals("url")) {
        %>
        <script type="text/javascript">
            alert("잘못된 접근입니다.");
            location.href = "<%=request.getContextPath()%>";
        </script>
        <%
    } else if (msg.equals("login")) {
        %>
        <script type="text/javascript">
            alert("로그인 해주세요.");
            location.href = "<%=request.getContextPath()%>/member?param=login";
        </script>
        <%
    } else if (msg.equals("deletefail")) {
        %>
        <script type="text/javascript">
            alert("예약 취소에 실패했습니다. 다시 시도해주세요.");
            location.href = "<%=request.getContextPath()%>/mypage?param=mypage";
        </script>
        <%
    }
}
%>