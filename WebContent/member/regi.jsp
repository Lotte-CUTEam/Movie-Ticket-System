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
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="./css/regi.css">


<!-- javascript -->
<script src="js/regi.js"></script>

</head>

<body>

	<main>


		<!-- backgroud Player -->
		<div class="wrap">
			<div class="jb-box">
				<video muted autoplay loop>
					<source src="resources/lotteIntro.mp4" type="video/mp4">
				</video>
			</div>
		</div>


		<div class="container">
			<!-- signup form -->
			<div class="input-form-backgroud row">


				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3">회원가입</h4>
					<form class="validation-form"
						action="<%=request.getContextPath()%>/member?param=regiAf"
						method="post" novalidate>
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="id">어이디</label> <input type="text"
									class="form-control" name="id" id="id" placeholder="아이디"
									value="" required>
								<div class="invalid-feedback">아이디를 입력해주세요.</div>
							</div>

							<div class="col-md-6 mb-3">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" name="pwd" id="password"
									placeholder="비밀번호" value="" required>
								<div class="invalid-feedback">비밀번호을 입력해주세요.</div>
							</div>
						</div>
						<button class="chk_id" id="id_chk" type="button">아이디 중복체크</button>
						<p id="idcheck"></p>
						<div class="mb-3">
							<label for="name">이름</label> <input type="name"
								class="form-control" id="name" name="name"
								placeholder="이름을 입력해주세요." required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="mb-3">
							<label for="email">이메일</label> <input type="email"
								class="form-control" id="email" name="email"
								placeholder="you@example.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>

						<div class="mb-3">
							<label for="phoneNumber">휴대폰 번호</label> <input type="text"
								class="form-control" id="phoneNumber" name="phoneNumber"
								placeholder="휴대폰 번호를 입력해주세요." required>
						</div>

						<hr class="mb-4">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="aggrement" required> <label
								class="custom-control-label" for="aggrement">개인정보 수집 및
								이용에 동의합니다.</label>
						</div>
						<div class="mb-4"></div>
						<button class="btn btn-primary btn-lg btn-block" type="submit">가입
							완료</button>
					</form>
				</div>
			</div>


		</div>
		<footer class="my-3 text-center text-small">
		<div onclick="location.href='<%=request.getContextPath() %>/main'">
			<img class="footer_img" src="./resources/CUTEam.png">
		</div>
		</footer>
	</main>

</body>

</html>