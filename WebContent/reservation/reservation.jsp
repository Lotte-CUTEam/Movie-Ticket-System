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
				<a href="../member/login.jsp">�α���</a>
			</li>
			<li>
				<a href="../member/regi.jsp">ȸ������</a>
			</li>
			<li>
				<a href="#">����������</a>
			</li>			
		</ul>
	</div>
	<div id="nav">
		<ul>
			<li class="">
				<a href="reservation.jsp">����</a>
			</li>
			<li class="">
				<a href="../movie/movieList.jsp">��ȭ</a>
			</li>
			<li class="">
				<a href="#">��ȭ��</a>
			</li>
			<li class="">
				<a href="#">�ð�ǥ</a>
			</li>
		</ul>
	</div>
	
	<!-- �������������� -->
	<div id="contents" class="contents_full contents_reserve">
		<div class="wrap_reserve">
			<h2 class="hidden">�����ϱ�</h2>
			
			<!-- ���� step side bar -->
			<div class="section_step_tit">
				<ul>
					<li class="active step01">
						<a href = "#reserveStep01">
							<strong class="tit">
							<span>01</span>
							<br>
							�󿵽ð�</strong>
						</a>
					</li>
					<li class="dsabled">
						<a id="reserveStep02" style="cursor: default;">
							<strong class="tit">
							<span>02</span>
							<br>
							�ο� ����</strong>
						</a>
					</li>
					<li class="dsabled">
						<a id="reserveStep03" style="cursor: default;">
							<strong class="tit">
							<span>03</span>
							<br>
							����</strong>
						</a>
					</li>
					<li class="dsabled">
						<a id="reserveStep04" style="cursor: default;">
							<strong class="tit">
							<span>04</span>
							<br>
							����Ȯ��</strong>
						</a>
					</li>
				</ul>
			</div>
			
			<!-- ������ --> 
			<div id="reserveStep01" class="section_step_con step01 active">
			<h3 class="hidden">�󿵽ð�</h3>
				<div class="article article_cinema">
					<div class="group_top">
						<h4 class="tit">���������</h4>
						<!-- ���⿡�ٰ� ��ȭ������ hidden value �ְ� �ڷκ����� -->
					</div>
					<div class="inner">
						<ul class="tap_wrap outer">
						
							<!-- ���� �����ϴ� �κ� -->
							<li class="active">
								<button type="button" class="tab_tit" style="width:50%; left:0%;">
									<span>��ü</span>
								</button>
								<div class="tab_con">
									<h5 class="hidden">��ü</h5>
									<div class="cinema_select_wrap cinemaSelect basicCinema">
										<ul>
										<!-- ���� enum �ִ� �κ� -->
											<li class="depth1 active">
												<a href="#">����</a>
											</li>
											<li class="depth1">
												<a href="#">���/��õ</a>
											</li>
											<li class="depth1">
												<a href="#">���/��õ</a>
											</li>
											<li class="depth1">
												<a href="#">���/��õ</a>
											</li>											
											<li class="depth1">
												<a href="#">���/��õ</a>
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