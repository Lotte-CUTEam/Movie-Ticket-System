<!-- /**
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* -----------------------------------------------------------
* 수정일자 수정자 수정내용
* 2022.07.08 이충현 신규생성
* -----------------------------------------------------------
*/-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en"
	xmlns:text-decoration-line="http://www.w3.org/1999/xhtml">
<head>

<!-- Bootstrap/css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- css -->
<link rel="stylesheet" href="./css/login.css?ver=3.0">
<!-- JavaScript -->
<script src="js/login.js"></script>

<meta charset="UTF-8">
<title>롯데ON 로그인 : 롯데ON</title>
</head>
<body>
	<main>

		<!-- main -->
		<div class="container">
			<div class="login">
				<h1 id="login">로그인</h1>
				<div>
					<form action="<%=request.getContextPath()%>/member?param=loginAf" method="post">
						<input type="hidden" name="param" value="loginAf">
						<!-- login form -->
						<div class="loginForm">


							<div class="form-group shadow-none inid">
								<input name="id" type="text" class="form-control"
									placeholder="아이디" id="inId" title="아이디" required>
							</div>
							<div class="form-group shadow-none inpassword">
								<div>
									<input type="hidden" class="form-group" id="tempPwd"
										name="password"><input id="Password" type="password"
										class="form-control" placeholder="비밀번호" name="pwd"
										autocomplete="new-password" title="비밀번호" required>
								</div>
							</div>
						</div>
						<type type="submit" value="로그인">
						<button class="btn btn-danger">로그인하기</button>
					</form>
					<div></div>
					<div class="autoLogin">
						<div class="form-check" id="chk">
							<input id="chk_save_id" type="checkbox" name="checkbox1"
								class="form-check-input" checked="checked"><label
								for="chk_save_id">아이디 저장</label>
						</div>
						<input id="checkbox11" type="hidden" name="checkbox" value="N">
						<div class="login_or_regi">
							<a class="login_search"> ID/PW 찾기 </a> <a id="i"> | </a> <a
								class="login_regi"
								href="<%=request.getContextPath()%>/member?param=regi"> 회원가입
							</a>
						</div>
					</div>

					<!-- social login -->
					<div class="socialSignupWrap ">
						<button data-v-46bd225e="" class="kakaoLoginBtn btn socialbtn"
							disabled>
							<span class="inner"><span class="icon kakaoLogo"></span><span>
									카카오로 시작하기 </span> <!----></span>
						</button>
						<button class="naverLoginBtn btn socialbtn" disabled>
							<span class="inner"><span class="icon naverLogo"></span><a
								class="naver" style="display: none;"></a> 네이버로 시작하기 <!----></span>
						</button>
						<button class="facebookLoginBtn btn socialbtn" disabled
							title="새 창 열림">
							<span class="inner"><span class="icon facebookLogo"></span><span
								class=""> 페이스북으로 시작하기 </span> <!----></span>
						</button>
						<button class="otherLoginBtn btn socialbtn" disabled>
							<!---->
							<span class=""> 휴대폰으로 로그인 </span>
							<!---->
						</button>
						<!---->
					</div>
				</div>
			</div>
		</div>


	</main>
</body>
</html>