<!-- 
[프로젝트]롯데e커머스_자바전문가과정
[시스템명]영화예매시스템
[팀 명]CUTEam
-----------------------------------------------------------
수정일자			수정자		수정내용
2022.07.08		정은우		신규생성
-----------------------------------------------------------
 -->
<%@page import="java.time.LocalDateTime"%>
<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%//request.setCharacterEncoding("utf-8");
	List<ReservationDto> list = (List<ReservationDto>) request.getAttribute("resvList");
	//List<ReservationDto> list = null;%>

<!-- 로그인 확인 -->
<%-- 
<%
MemberDto mem = (MemberDto) session.getAttribute("login");
if (mem == null) {
%>
<script type="text/javascript">
	alert('로그인 해주세요');
	location.href = "login.jsp";
	</script>
<%
}
%>
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
/* 배경색 지정 */
div#contents::before {
	content: "";
	position: absolute;
	z-index: -1;
	left: 0;
	right: 0;
	/*     top: 114px; */
	height: 120px;
	background-color: #FF7787;
}
</style>
<title>My Page</title>
</head>
<body>

	<!-- 공통부분 header -->
	<div class="main_header"></div>

	<!-- 퀵메뉴 -->
	<div class="quick_wrap"
		style="position: fixed; z-index: 11; right: 20px; width: 82px; text-align: center; color: #000; display: block; overflow: hidden; top :150px;">
		<div class="quick_menu" id="quick_menu"
			style="padding-top: 15px; background-color: #fff; color: #000; box-shadow: 5px 3px 6px rgba(0, 0, 0, 0.16); border-radius: 5px; overflow: hidden;">
			<a href="" style="color: black; display: block;"><img
				src="./images/ticketing_icon.png" /></a> <a href="#" class="qick_top"
				style="margin-top: 10px; background: #3e3d3d; font-size: 11px; color: #fff; letter-spacing: 5px; padding: 5px 5px 5px 13px; text-decoration: none; display: block;">TOP</a>
		</div>
	</div>

	<div align="center">

		<div id="contents" class="contents_mypage" align="center"
			style="padding-top: 50px; width: 980px;">

			<!-- 내 정보 -->
			<div class="mypage_myinfo" align="left"
				style="margin-top: 35px; border: 1px solid #eee; border-radius: 10px; padding: 25px 30px 25px 30px; box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.1); background-color: white;">
				<p>
					<%-- <%= %> --%>
					님 반가워요!
				</p>
			</div>
			<br>
			<!-- 마이페이지 메인메뉴탭 -->
			<div class="mypage_main_menu" align="center">
				<table style="border-bottom: 1px solid;">
					<col width="500px">
					<!-- <col width="200"><col width="200"> -->
					<tr>
						<th><a href=""><span>결제내역</span></a></th>
						<!-- <th><a><span>My Page</span></a></th> -->
					</tr>
				</table>
			</div>

			<!-- 결재내역 -->
			<div class="mypage_wrap" align="center">
				<div class="mypage_data">
					<%
					if (list == null || list.size() == 0) {
					%>
					<div class="list-empty"
						style="border: none; margin-top: 50px; margin-bottom: 50px; padding: 50px;">
						<img src="./images/nodata_icon.png" />
						<p>예매 내역이 존재하지 않습니다.</p>
					</div>
					<%
					} else {
					%>
					<table>
						<col width="100"><col width="50"><col width="200"><col width="100">
						<col width="100"><col width="100"><col width="100">
						<thead>
							<tr>
								<th>날짜</th>
								<th>영화상태</th>
								<th>제목</th>
								<th>금액</th>
								<th>예매번호</th>
								<th>취소여부</th>
								<th>상세화면</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < list.size(); i++) {
							    ReservationDto resvDto = list.get(i);
							    String cancelStr = "";
							    if(resvDto.getStatus() == 1) {
							        cancelStr = resvDto.getDeleteddAt()+"취소완료";
							    }
							    else if(resvDto.getScreenAt().isBefore(
							                    LocalDateTime.now().minusMinutes(70))
							            ){
							        cancelStr = "취소가능";
							    }
							%>
							<tr>
								<td><%=resvDto.getScreenAt() %></td>
								<td><%if(resvDto.getStatus() == 1){%>취소<%}%></td>
								<td><%=resvDto.getTitle() %></td>
								<td><%=resvDto.getPeople_count() * 14000 %>원</td>
								<td><%=resvDto.getReservationId() %></td>
								<td><%= cancelStr%></td>
								<td>
									<a href="/mypage?param=detail&seq=<%=resvDto.getReservationId() %>">상세페이지</a>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<%
					}
					%>

				</div>
				<div class="mypage_warning_box" align="left"
					style="border: 1px solid #eee; padding: 30px 25px;">
					<h5 style="border-bottom: 1px #eee solid;">유의사항</h5>
					<div class="mypage_warning_inner_box">
						<h5 style="color: red;">환불 안내</h5>
						<dl class="list_define"
							style="font-size: 13px; line-height: 15px;">
							<dt style="font: bold; font-size: 15px;">예매 및 추가상품 구매 취소 안내</dt>
							<dd style="margin-left: 5px;">- 온라인 예매 구매 취소는 상영 20분 전까지
								가능하며, 20분 이전부터는 현장 취소만 가능합니다.</dd>
							<dd style="margin-left: 5px;">- 티켓에 표기된 상영시작시간 이후 환불은 불가합니다.</dd>
							<dd style="margin-left: 5px;">- 온라인 예매 후 현장에서 티켓 발권 시 온라인으로
								예매 취소는 불가능하며, 현장 취소만 가능합니다.</dd>
							<dd style="margin-left: 5px;">- 예고편과 광고 상영으로 실제 영화 시작 시간이
								10분 정도 차이 날 수 있습니다.</dd>
							<dd style="margin-left: 5px;">- 반드시 전체 취소만 가능하며, 예매나 추가상품 중
								부분 취소는 불가능합니다.</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
		<!-- 공통부분 footer -->
		<div class="main_footer"></div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).resize(function() {
				if ($(window).width() < 980) {
					$('#quick_menu').hide();
				} else {
					$('#quick_menu').show();
				}
			});
		});
	</script>
</body>
</html>