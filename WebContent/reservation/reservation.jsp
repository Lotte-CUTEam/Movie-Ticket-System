<%--
/*
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]reservation.jsp
* -----------------------------------------------------------
* 수정일자           수정자         수정내용
* 2022.07.11       장혜원         신규생성
* 2022.07.12       권나연         상영관, 영화정보 가져오도록 수정
* -----------------------------------------------------------
*/
--%>

<%@page import="dao.ScreenDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="enums.Location"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 - 큐트시네마</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="../assets/css/res_default.css">
<link rel="stylesheet" href="../assets/css/res_content.css">
<link rel="stylesheet" href="../assets/css/reservation.css">
<link rel="stylesheet" href="../assets/css/reset_hnf.css">
<link rel="stylesheet" href="../assets/css/style_hnf.css">
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
   rel="stylesheet">
<style>
* {
   font-family: 'Noto Sans KR', sans-serif;
}


.temp_left {
   float: left;
   margin-top : 5px;
   margin-left : 10px;
   padding : 3px;
   background-color:azure;
   border-radius: 1mm;
   text-align: center;

}

.screen_time {
   font-size: 14px;
}

.tmp_btm_area {
  position: fixed; /* 이 부분을 고정 */
  bottom: 0; /* 하단에 여백 없이 */
  width: 100%; /* 가로 사이즈를 브라우저에 가득 채움 */
}

.bx_tit {
   width:250px;
}
</style>   
</head>

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
} --%>
%>

<body>
<%-- <%@include file = "/header.jsp" %> --%>
<div id="header_section" class="header">
   <h1 class="logo" style="width: 11%">
      <a href="../main.jsp">LOTTE CINEMA</a>
   </h1>
<div class="gnb">
      <ul class="g_menu2">
         <li>
            <a href="../member?param=login">로그인</a>
         </li>
         <li>
            <a href="../member?param=regi">회원가입</a>
         </li>
         <li>
            <a href="../mypage?param=mypage">마이페이지</a>
         </li>         
      </ul>
   </div>
   <div id="nav">
      <ul>
         <li class="">
            <a href="../reservation?param=reservation">예매</a>
         </li>
         <li class="">
            <a href="../movies">영화</a>
         </li>
         <li class="">
            <a href="../movies">영화관</a>
         </li>
         <li class="">
            <a href="../movies">시간표</a>
         </li>
      </ul>
   </div>
 </div> 

 
 
 
   <!-- 콘텐츠 시작 -->
   <div id="contents" class="contents_full contents_reserve">
      <div class="wrap_reserve">
         <h2 class="hidden">예매하기</h2>
         
         <!-- 예매 단계 사이드바 -->
         <div class="section_step_tit">
            <ul id="select_step">
               <li class="active step01">
                  <a href = "#reserveStep01" id="reserveStep01">
                     <strong class="tit">
                     <span>01</span>
                     <br>
                     상영시간</strong>
                  </a>
               </li>
               <li class="disabled step01">
                  <a href="#reserveStep02" id="reserveStep02">
                     <strong class="tit">
                     <span>02</span>
                     <br>
                     인원 선택</strong>
                  </a>
               </li>
               <li class="disabled">
                  <a id="#reserveStep03">
                     <strong class="tit">
                     <span>03</span>
                     <br>
                     예매확인</strong>
                  </a>
               </li>
               <li class="disabled">
                  <a id="#reserveStep04">
                     <strong class="tit">
                     <span></span>
                     <br>
                     </strong>
                  </a>
               </li>
            </ul>
         </div>
         <!-- 예매 단계 사이드바 종료 -->
         
         
         
        <!-- STEP 01. 극장, 영화, 상영 시간 선택 --> 
         <div id="contentStep01" class="section_step_con step01 active">
         <h3 class="hidden">상영시간</h3>
           
            <!-- 1.1 극장 선택 -->
            <!-- FIXME -->
            <div id="" class="article article_cinema" style="width:170px;">
               <div class="group_top">
                  <h4 class="tit" id="h4_location">지역</h4>
               </div>
               
            <!-- 지역 선택 -->
               <div class="inner">
                  <ul class="tap_wrap outer">
                     <li class="active" id="location_setting">                      
                        <div class="tab_con">
                        <h5 class="hidden">전체</h5>
                           <div class="cinema_select_wrap cinemaSelect basicCinema">
                              <ul id="select_location">
                             <!-- 지역 enum -->
                               <%    int idx = 0;
                                  for(Location loc : Location.values()) { 
                                     idx++;
                                     String locName = loc.getLocationName();
                                     if (idx==1) {%>
                                 <li class="depth1 active" value="<%=loc%>" onclick="setCinema('<%=locName%>')"><a href="#"><%=locName%></a></li>
                                     <% } else {%>
                                 <li class="depth1" value="<%=loc%>" onclick="active(this); setCinema('<%=locName%>')"><a href="#"><%=locName%></a></li>
                                 <% }
                                     } %>
                              </ul>
                           </div>
                        </div>
                     </li>
                  </ul> 
               </div> 
            </div>
            <!-- 지역 선택 종료 -->


         <!-- 1.2 영화관 선택 -->
            <div id="location_article" class="article article_cinema" style="width:181px;">
               <div class="group_top">
                  <h4 class="tit" id="h4_cinema">영화관</h4>
               </div>
               
               <div class="inner">
                  <ul class="tap_wrap outer">
                     <li class="active" id="cinema_setting">
                        
                        <div class="tab_con">
                           <h5 class="hidden">전체</h5>
                           <div class="cinema_select_wrap cinemaSelect basicCinema">
                              <!-- 영화관 선택 -->
                              <ul id="select_cinema">
 
                              </ul>
                           </div>
                        </div>
                     </li>
                     
                  </ul>
               
               </div> 
            </div>
            <!-- 1.2 영화관 선택 종료 -->
            
            <!-- 1.3 영화 선택 -->
             <div class="article article_movie">
               <div class="group_top">
                  <h4 class="tit" id="h4_movie">영화</h4>
               </div>

                    <div class="inner">
                        <div class="list_filter">
                            <select id = "select_movie" title="영화선택" onchange="setScreen()">
                            </select>
                        </div>
            		</div>
              </div>
			<!-- 1.3 영화 선택 종료-->
			
			<!-- 1.3 시간 선택 -->
            <div class="article article_time">
               <div class="group_top" >
                  <h4 class="tit" id="h4_date">2022-07-11(오늘)</h4>
               </div>
               <div class="inner">
                  <div class="date_select_wrap dateReserveWrap">
                     <div class="slide_wrap slide_reserve_date">
                        <ul id="select_weekly" class="owl-carousel owl-loaded owl-drag">
                                <!-- 위클리 -->                      
                        </ul>
                     </div>
                  </div>
                  
                  
                  
                  <div class="tab_con ty5">
                     <div id="notice" style="font-size:16px; padding: 50px; margin:10px; display: block; text-align:center;"><span>해당하는 날짜에 상영하는 영화가 없습니다.<br>다른 날짜를 선택해주세요.</span></div>
                  
                     <div id="time_container" class="mCSB_container" style="position:relative; top:0; left:30px;">
                        
                        <!-- 영화 정보 (1) -->
                        <div class="group_time_select" id="screen_element">
                           <input type='hidden' value=2>
                           <div class="time_select_tit" id="movie_name">
                                 <span class="ic_grade gr_12">12</span><strong>탑건: 매버릭</strong>
                           </div>
                           <div class="time_select_wrap timeSelect">
                           <ul class="list_time" id="screen_list">
                              <li class="temp_left">
                                 <a role="button" href="#none" class="screen_time"onclick="goReservation()">12:05</a>
                              </li>
                              <li class="temp_left">
                                 <a role="button" href="#none" class="screen_time"onclick="goReservation()">16:05</a>
                              </li>
                           </ul>
                           </div>
                           

                        </div>
                        
                       <div class="group_time_select">
                           <input type='hidden' value=1>
                           <div class="time_select_tit">
                                 <span class="ic_grade gr_12">12</span><strong>토르 러브 앤 썬더</strong>
                           </div>
                           <div class="time_select_wrap timeSelect">
                           
                           <ul class="list_time">
                              <li class="temp_left">
                                 <a role="button" href="#none" class="screen_time" onclick="goReservation()">12:05
                                 </a>
                              </li>
                              <li class="temp_left">
                                 <a role="button" href="#none" class="screen_time" onclick="goReservation()">16:05
                                 </a>
                              </li>
                           </ul>
                     </div>
                        </div>
                     </div>
                  </div>
                  
                  
               </div>
            </div>
      </div>
   
   
   		<!-- 인원 선택 -->
           <div id="contentStep02" class="article article_seat" style="margin-left: 78px;">
            <div class="group_top" style="background-color: black; color: white;">
               <h1 style="text-align: center; padding: 40px; margin-bottom: 10px;">인원/좌석 선택</h1>
            </div>
            <div class="inner">

               <div id="PersonSeatCount">
                  <div class="select_num_people_wrap" style="height: 695px; text-align: center;">
                     <h5 class="hidden">인원선택</h5>
                     
                     <div style="text-align: center; font-size: 20px;">
                        <h6 class="hidden">예매 정보</h6>
                        <span id="movie_thm" class="thm" style="display:block; overflow:hidden; margin-bottom:30px; border-radius:4px;"><img
                        style="width:300px;"
                          id = "step02_movie_img" src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202006/14702_103_1.jpg"></span>
                        <div class="group_infor">
                           <div id="movie_info_people">
                              <span class="ic_grade gr_12">관람가</span><strong>
                              탑건: 매버릭
                              </strong>
                           </div>
                           <dl>
                              <dt>일시</dt>
                              <dd class="sub_info1" id="sub_info_screen">
                                 22.07.11<em>(월)</em><span class="time">14:00 ~ 16:20</span>
                              </dd>
                              <dt>영화관</dt>
                              <dd class="sub_info1" id="sub_info_cinema">가산디지털</dd>
                           </dl>
                        </div>
                     </div>
                     
                     <div class="count_people" style="width: 660px;">
                        <ul>
                           <li id="person_10" data-code="10" data-peple="성인"
                              data-count="0"><strong class="tit">성인</strong><span
                              class="bx_num"> <input type="number" id="sub_info_people_cnt" value=0
                                 min=0 onchange="cnt_price(this.value)">
                           </span></li>
                        </ul>
                     </div>
                  </div>

               </div>

               <div id="PersonSeatSummery" >
                  <div class="select_seat_result">
                     <div class="group_lft">
                        <dl class="total_price" style="font-size: 25px;">
                           총 합계
                           <input type="number" id="res" value=0 min=0 >원
                        </dl>

                     </div>
                     <div class="group_rgt">
                        <button type="button" class="btn_col1" id="link_rpay">결제하기</button>

                     </div>
                  </div>
               </div>

            </div>
         </div>


      </div>
   </div>
          
          
         <!-- STEP 03. 극장, 영화, 상영 시간 선택 --> 
          <div id="reserveStep03" class="section_step_con step03"></div>
          
         <!-- STEP 04. 극장, 영화, 상영 시간 선택 --> 
          <div id="reserveStep04" class="section_step_con step04"></div>
          
        <%@include file = "/footer.jsp" %> 
   </div> 
   
</div>

<form method="post">
   <input type="hidden" id="member_id" name="member_id" value="hyewon">

<%--    <input type="hidden" id="member_id" name="member_id" value="<%=mem.getId()%>">
 --%>   <input type="hidden" id="screen_id" name="screen_id" value="">
   <input type="hidden" id="movie_id" name="movie_id" value="">
   <input type="hidden" id="input_date" name="input_date" value="">
   
   <input type="hidden" id="people_count" name="people_count" value="">

   
   <input type="hidden" id="REALPATH"><%=request.getContextPath()%>
</form>

<!-- 예약 페이지 자바스크립트 -->
<script src="reservation.js" type="text/javascript"></script>

<script type="text/javascript">

function active(obj) {
  $(obj).addClass("active");
  $(obj).siblings("li").removeClass("active");
}

function cnt_price(c) {
   document.getElementById('res').value = c * 14000;
   
}

</script>

</body>
</html>
