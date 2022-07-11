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

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>롯데시네마 구현하기</title>

<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">

<!-- 웹 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">

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
	

	<!-- 
	---
	body
	---
 	-->
 	
 	
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