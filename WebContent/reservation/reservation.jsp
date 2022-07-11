<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
<title>예매하긴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="reservation.js"></script>
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

<%-- <%
MemberDto mem = (MemberDto) session.getAttribute("login");

if (mem == null) {
%>
<script type="text/javascript">
	alert('로그인 해주세요');
	location.href = "login.jsp";
	</script>
<%
}
%> --%>

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
 </div> 
   <!--  -->
   <div id="contents" class="contents_full contents_reserve">
      <div class="wrap_reserve">
         <h2 class="hidden">예매하기</h2>
         
         <!--      step side bar -->
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
         
        
         <!-- /////////////// 극장 선택 ///////////////  -->
            <div id="location_article" class="article article_cinema" style="width:170px;">
               <div class="group_top">
                  <h4 class="tit" id="h4_location">서울</h4>
			<!-- 여기에다가 영화관정보 hidden value 넣고 뒤로보내자 -->
               </div>
               
				<!-- 지역 선택 -->
               <div class="inner">
                  <ul class="tap_wrap outer">
                  
                     <!-- 지역 선택하는 부분 -->
                     <li class="active" id="location_setting">
                        
                        <div class="tab_con">
                           <h5 class="hidden">전체</h5>
                           <div class="cinema_select_wrap cinemaSelect basicCinema">
                              <ul>
                             <!-- 지역 enum 넣는 부분 -->
                            	<% 	int idx = 0;
                            		for(Location loc : Location.values()) { 
                            			idx++;
                            			if (idx==1) {%>
		                               		<li class="depth1 active" value="<%=loc%>"><a href="#" onclick="selectloc()"><%=loc.getLocationName()%></a>                         			    
                            			<% } else {%>
 		                               		<li class="depth1" value="<%=loc%>"><a href="#" onclick="selectloc()"><%=loc.getLocationName()%></a>                         			    
											<% }
                            			} %>
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


				<!-- 영화관 선택 -->
            <div id="location_article" class="article article_cinema" style="width:181px;">
               <div class="group_top">
                  <h4 class="tit" id="h4_cinema">가산디지털</h4>
			<!-- 여기에다가 영화관정보 hidden value 넣고 뒤로보내자 -->
               </div>
               

               <div class="inner">
                  <ul class="tap_wrap outer">
                  
                     <!-- 지역 선택하는 부분 -->
                     <li class="active" id="cinema_setting">
                        
                        <div class="tab_con">
                           <h5 class="hidden">전체</h5>
                           <div class="cinema_select_wrap cinemaSelect basicCinema">
                              <ul list="#select_cinema">
<%--                               
                              <%
                              ScreenDao dao = ScreenDao.getInstance();
                              List<String> cinemaList = dao.getCinemaList();
                              
                              int i = 0;
                              for (String cinema : cinemaList) {
                                  if (i==0) {
                                      %>
                                      	<li class="depth1 active">
                                      		<a href='#' onclick="getCinema(<%=cinema%>)"><%=cinema%></a>
                                      	<li>
                                      <%
                                  } else {
                                      %>
                                    	<li class="depth1">
                                    		<a href='#' onclick="getCinema(<%=cinema%>)"><%=cinema%></a>
                                    	<li>
                                    <%                                     
                                  }
                              	i++;
                              }
                              
                              %>
                               --%>
                              
                             <!-- 지역 enum 넣는 부분 -->
                                 <li class="depth1 active">
                                    <a href="#" onclick="getCinema()">가산디지털</a>
                                 </li>
                                 <li class="depth1">
                                    <a href="#" onclick="getCinema()">가양</a>
                                 </li>
                                 <li class="depth1">
                                    <a href="#" onclick="getCinema()">강동</a>
                                 </li>
                                 <li class="depth1">
                                    <a href="#" onclick="getCinema()">건대입구</a>
                                 </li>                                 
                                 <li class="depth1">
                                    <a href="#" onclick="getCinema()">김포공항</a>
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
         
                <div class="article article_movie">
               <div class="group_top">
                  <h4 class="tit" id="h4_movie">영화</h4>
               </div>

                    <div class="inner">
                        <div class="list_filter">
                            <select title="영화 정렬 방법 선택" onchange="setMovie()">
                                <option value="A">예매순</option>
                                <option value="B">관객순</option>
                                <option value="C">평점순</option>
                                <option value="D">예정작</option>
                            </select>
                        </div>

                  <div class="cinema_select_wrap cinemaSelect basicCinema">
                     <ul id="select_movie">
                        <li class="depth1 active">
                           <a href="#">
                              <div class="bx_tit">
                                 <span class="ic_grade gr_12">12세 관람가</span>
                                 <strong class="tit">탑건: 매버릭</strong>
                              </div>
                           </a>
                        </li>
                        <li class="depth1">
                           <a href="#">
                              <div class="bx_tit">
                                 <span class="ic_grade gr_12">12세 관람가</span>
                                 <strong class="tit">토르: 러브 앤 썬더</strong>
                              </div>
                           </a>
                        </li>
                        <li class="depth1">
                           <a href="#">
                              <div class="bx_tit">
                                 <span class="ic_grade gr_15">15세 관람가</span>
                                 <strongmovieid class="tit">헤어질 결심</strong>
                              </div>
                           </a>
                        </li>
                        <li class="depth1">
                           <a href="#">
                              <div class="bx_tit">
                                 <span class="ic_grade gr_12">12세 관람가</span>
                                 <strong class="tit">탑건: 매버릭</strong>
                              </div>
                           </a>
                        </li>                              
                        <li class="depth1">
                           <a href="#">
                              <div class="bx_tit">
                                 <span class="ic_grade gr_12">12세 관람가</span>
                                 <strong class="tit">탑건: 매버릭</strong>
                              </div>
                           </a>
                        </li>
                     </ul>
                  </div>


                    </div>
                    

             </div>

            <div class="article article_time">
               <div class="group_top" >
                  <h4 class="tit" id="h4_date">2022-07-11(오늘)</h4>
               </div>
               <div class="inner">
                  <div class="date_select_wrap dateReserveWrap">
                     <div class="slide_wrap slide_reserve_date">
                        <ul class="owl-carousel owl-loaded owl-drag">
                                 <!-- 위클리 -->
                                 <li class="item">
 	                                <div class="owl-item" style="width: 52.5px; float:left;">
                                    
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>10</strong><em>일</em>
                                          </label>
                                       </span>
                                    
                                 	</div>
                                 </li>
                                  <li class="item" >
                                	<div class="owl-item" style="width: 52.5px;float:left;">
                                   
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                                    
                              	   </div>
                                 </li>
                                 <li class="item" >
	                                 <div class="owl-item" style="width: 52.5px;float:left;">
                                    
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                               
                                 	</div>
                                 </li>
                                 <div class="owl-item" style="width: 52.5px;float:left;">
                                    <li class="item" >
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                                    </li>
                                 </div>
                                 <div class="owl-item" style="width: 52.5px;float:left;">
                                    <li class="item" >
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                                    </li>
                                 </div>
                                 <div class="owl-item" style="width: 52.5px;float:left;">
                                    <li class="item" >
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                                    </li>
                                 </div>
                                 <div class="owl-item" style="width: 52.5px;float:left;">
                                    <li class="item" >
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                                    </li>
                                 </div>
                                 <div class="owl-item" style="width: 52.5px;float:left;">
                                    <li class="item" >
                                       <span class="date sun disabled">
                                          <label>
                                             <input type="radio" name="radioDate1" data-displayyn="N" data-playdate="2022-07-10" data-isplaydate="Y" data-playweek="일">
                                             <strong>11</strong><em>월</em>
                                          </label>
                                       </span>
                                    </li>
                                 </div>                                 


                        </ul>
                     </div>
                  </div>
                  <div class="tab_con ty5">
                     <div id="time_container" class="mCSB_container" style="position:relative; top:0; left:30px;">
                        
                        <!-- 영화 정보 (1) -->
                        <div class="group_time_select" id="screen_element">
                        	<input type='hidden' id="screen_id" value=2> 
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
                        
                       <div class="group_time_select" id="screen_element">
                        	<input type='hidden' id="screen_id" value=1> 
                           <div class="time_select_tit" id="movie_name">
                           		<span class="ic_grade gr_12">12</span><strong>토르 러브 앤 썬더</strong>
                           </div>
                        	<div class="time_select_wrap timeSelect">
                           
                           <ul class="list_time" id="screen_list">
                              <li class="temp_left">
                                 <a role="button" href="#none" class="screen_time" onclick="goReservation()">12:05
                                 </a>
                              </li>
                              <li class="temp_left">
                                 <a role="button" href="#none" class="screen_time" onclick="goReservation()">16:05
                              </li>
                           </ul>
							</div>
                        </div>
                     </div>
                  </div>
                  
                  
               </div>
            </div>
      </div>
   
   </div>
</div>

<form method="post">
	<%-- <input type="hidden" id="member_id" name="member_id" value="<%=mem.getId()%>"> --%>
	<input type="hidden" id="member_id" name="member_id" value="hyewon">
	<input type="hidden" id="screen_id" name="screen_id" value="32">
	<input type="hidden" id="cinema" 	name="cinema" value="서울-월드타워">
	<input type="hidden" id="people_count" name="people_count" value="2">
	<input type="hidden" id="title" 	name="title" value="토르 : 러브앤 썬더">
	<input type="hidden" id="runtime" 	name="runtime" value="119">
	<input type="hidden" id="screen_at" name="screen_at" value="2022-07-12 16:20:00">
	
	<input type="hidden" id="inputdate" name="inputdate" value="20220711">
	
	<input type="hidden" id="REALPATH"><%=request.getContextPath()%>
</form>



</body>
</html>