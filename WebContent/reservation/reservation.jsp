<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/res_default.css">
<link rel="stylesheet" href="../assets/css/res_content.css">

<link rel="stylesheet" href="../assets/css/reservation.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

li {
	font-size:13px;
	font-weight :
}
</style>	
</head>
<body>
<div id="header_section" class="header">
	<h1 class="logo">
		<a href="../main.jsp">LOTTE CINEMA</a>
	</h1>
	<div class="gnb">
		<ul class="g_menu2">
			<li>
				<a href="../member/login.jsp">로그인</a>
			</li>
			<li>
				<a href="../member/regi.jsp">회원가입</a>
			</li>
			<li>
				<a href="#">마이페이지</a>
			</li>			
		</ul>
	</div>
	<div id="nav">
		<ul>
			<li class="">
				<a href="reservation.jsp">예매</a>
			</li>
			<li class="">
				<a href="../movie/movieList.jsp">영화</a>
			</li>
			<li class="">
				<a href="#">영화관</a>
			</li>
			<li class="">
				<a href="#">시간표</a>
			</li>
		</ul>
	</div>
	
	<!-- 메인콘텐츠시작 -->
	<div id="contents" class="contents_full contents_reserve">
		<div class="wrap_reserve">
			<h2 class="hidden">예매하기</h2>
			
			<!-- 예매 step side bar -->
			<div class="section_step_tit">
				<ul>
					<li class="active step01">
						<a href = "#reserveStep01">
							<strong class="tit">
							<span>01</span>
							<br>
							상영시간</strong>
						</a>
					</li>
					<li class="dsabled">
						<a id="reserveStep02" style="cursor: default;">
							<strong class="tit">
							<span>02</span>
							<br>
							인원 선택</strong>
						</a>
					</li>
					<li class="dsabled">
						<a id="reserveStep03" style="cursor: default;">
							<strong class="tit">
							<span>03</span>
							<br>
							예약</strong>
						</a>
					</li>
					<li class="dsabled">
						<a id="reserveStep04" style="cursor: default;">
							<strong class="tit">
							<span>04</span>
							<br>
							예매확인</strong>
						</a>
					</li>
				</ul>
			</div>
			
			<!-- 콘텐츠 --> 
			<div id="reserveStep01" class="section_step_con step01 active">
			<h3 class="hidden">상영시간</h3>
				<div class="article article_cinema">
					<div class="group_top">
						<h4 class="tit">가산디지털</h4>
						<!-- 여기에다가 영화관정보 hidden value 넣고 뒤로보내자 -->
					</div>
					<div class="inner">
						<ul class="tap_wrap outer">
						
							<!-- 지역 선택하는 부분 -->
							<li class="active">
								<button type="button" class="tab_tit" style="width:50%; left:0%;">
									<span>전체</span>
								</button>
								<div class="tab_con">
									<h5 class="hidden">전체</h5>
									<div class="cinema_select_wrap cinemaSelect basicCinema">
										<ul>
										<!-- 지역 enum 넣는 부분 -->
											<li class="depth1 active">
												<a href="#">서울</a>
											</li>
											<li class="depth1">
												<a href="#">경기/인천</a>
											</li>
											<li class="depth1">
												<a href="#">경기/인천</a>
											</li>
											<li class="depth1">
												<a href="#">경기/인천</a>
											</li>											
											<li class="depth1">
												<a href="#">경기/인천</a>
											</li>											
											
										</ul>
									</div>
								</div>
							</li>
							
							<li class="">
								<button type="button" class="tab_tit" style="width: 50%; left: 50%;"></button>
							</li>
						</ul>
					
					</div>
				</div>
				
			</div>
		</div>
	
	</div>
</div>
</body>
</html>