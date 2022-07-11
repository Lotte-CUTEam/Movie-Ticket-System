<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = null;
    Object obj = session.getAttribute("login");
    MemberDto mem = null;
    if (obj != null) {
        mem = (MemberDto) obj;
        id = mem.getId();
    }

if (id == null)
    id = "";
else
    System.out.println("***id 확인: " + id + "***");
%>


<header id="header">
	<div class="container">
		<div class="row">
			<div class="header clearfix">
				<h1>
					<a href="main"> <em><img src="assets/img/cute-logo.png"
							alt="LOTTE"></em>
					</a>
				</h1>
				<nav id="mNav">
					<h2 class="ir_so">전체메뉴</h2>
					<a href="#" class="ham"><span></span></a>
				</nav>
				<nav class="nav">
					<ul class="clearfix">
						<li><a href="movies">영화</a></li>
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