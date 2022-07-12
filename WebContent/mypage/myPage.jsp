<!-- 
[프로젝트]롯데e커머스_자바전문가과정
[시스템명]영화예매시스템
[팀 명]CUTEam
[파일명]myPage.jsp
-----------------------------------------------------------
수정일자			수정자		수정내용
2022.07.08		정은우		신규생성
-----------------------------------------------------------
 -->
<%@page import="dto.MemberDto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="dto.ReservationDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%//request.setCharacterEncoding("utf-8");
	List<ReservationDto> list = (List<ReservationDto>) request.getAttribute("resvList");
	//List<ReservationDto> list = null;%>

<!-- 로그인 확인 -->

<%
String memberId = (String) request.getAttribute("memberId");
MemberDto myPageMem = (MemberDto) session.getAttribute("login");

if (myPageMem == null) {
    
%>
<script type="text/javascript">
	alert('로그인 해주세요');
	location.href = "<%=request.getContextPath()%>/member?param=login";
</script>
<%
} else if (myPageMem.getId() == null || myPageMem.getId().equals("") ) {
%>
<script type="text/javascript">
	alert('잘못된 접근입니다. 다시 로그인해주세요');
	location.href = "<%=request.getContextPath()%>/member?param=login";
</script>
<%
} else if(myPageMem.getId() != memberId) {
%>
<script type="text/javascript">
	alert('잘못된 접근입니다. 다시 시도해주세요 mem.getId():'+<%=myPageMem.getId()%>+'memberId'+memberId);
	location.href = "<%=request.getContextPath()%>";
</script>
<%
}
%>

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
<title>마이페이지 - 큐트시네마</title>

<link rel="stylesheet" href="assets/css/reset_hnf.css">
<link rel="stylesheet" href="assets/css/style_hnf.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
	rel="stylesheet">
</head>
<body>

	<!-- 공통부분 header -->
	<%@include file = "/header.jsp" %>

	<!-- 퀵메뉴 -->
	<%@include file = "/quickbar.jsp" %>

	<div align="center">
		<div id="contents" class="contents_mypage" align="center"
			style="padding-top: 50px; width: 980px;">

			<!-- 내 정보 -->
			<div class="mypage_myinfo" align="left"
				style="margin-top: 35px; border: 1px solid #eee; border-radius: 10px; padding: 25px 30px 25px 30px; box-shadow: 3px 3px 15px rgba(0, 0, 0, 0.1); background-color: white;">
				<p>
					<%=mem.getName() %>님 반가워요!
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
				<div class="mypage_data" style="margin-bottom: 50px;">
					<%
					if (list == null || list.size() == 0) {
					%>
					<div class="list-empty"
						style="border: none; margin-top: 50px; margin-bottom: 50px; padding: 50px;">
						<img src="<%=request.getContextPath() %>/mypage/images/nodata_icon.png" />
						<p>예매 내역이 존재하지 않습니다.</p>
					</div>
					<%
					} else {
					%>
					<table style="align-content:center; font-size: 13px;">
						<col width="200"><col width="100"><col width="300"><col width="100">
						<col width="80"><col width="80"><col width="100">
						<thead>
							<tr>
								<th>상영일시</th>
								<th>영화상태</th>
								<th>제목</th>
								<th>금액</th>
								<th>예매번호</th>
								<th>취소가능여부</th>
								<th>상세화면</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (int i = 0; i < list.size(); i++) {
							    ReservationDto resvDto = list.get(i);
							    // 취소여부 확인
							    String cancelStr = "";
							    if(resvDto.getStatus() == 1) {
							        cancelStr = resvDto.getDeleteddAt()+"취소완료";
							    }
							    else if(resvDto.getScreenAt().isAfter(
							                    LocalDateTime.now().plusMinutes(20))
							            ){
							        cancelStr = "취소가능";
							    }
							    
							    // 제목 출력
							    String title = "";
							    if(resvDto.getTitle().length() > 20) {
							        title = resvDto.getTitle().substring(0, 20) + "...";
							    } else {
							        title = resvDto.getTitle();
							    }
							%>
							<tr>
								<td align="center"><%=resvDto.getScreenAt().format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일(E) HH:SS")) %></td>
								<td align="center"><%if(resvDto.getStatus() == 1){%>취소<%}%></td>
								<th align="left" style="font-size: 15px;"><%=title %></th>
								<td align="right"><%=resvDto.getPeople_count() * 14000 %>원</td>
								<td align="center"><%=resvDto.getReservationId() %></td>
								<td align="center"><%= cancelStr%></td>
								<td align="center">
									<button id="btn_<%=resvDto.getReservationId()%>" type="button" value="<%=resvDto.getReservationId()%>" 
									onclick="location.href='<%=request.getContextPath() %>/mypage?param=detail&resvId=<%=resvDto.getReservationId()%>&memberId=<%=mem.getId()%>'">상세정보보기</button>
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
		<%@include file = "../footer.jsp" %>
		
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