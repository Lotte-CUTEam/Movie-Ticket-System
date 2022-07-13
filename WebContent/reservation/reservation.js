/*
* [프로젝트]롯데e커머스_자바전문가과정
* [시스템명]영화예매시스템
* [팀 명]CUTEam
* [파일명]reservation.js
* -----------------------------------------------------------
* 수정일자           수정자         수정내용
* 2022.07.11       장혜원         신규생성
* -----------------------------------------------------------
*/

$(document).ready(function() {
	
	domready();
	addEventListener();
	setWeekly();

});




/* 
 * 화면 초기 진입 세팅 영역
 * 
 */
// 화면 초기 진입 세팅
function domready() {
  // 초기 조회
  setCinema("서울");	//극장

}




/* 
 * 이벤트 리스너 
 * 
 */
function addEventListener() {
	
	
	// 지역 / 극장 리스트 선택 
	$(".depth1").click(function() {
		$(this).addClass("active");
		$(this).siblings("li").removeClass("active");
	});

		
	// 영화 선택
	$("#select_movie").change(function(){
		//alert("click");
		setScreen();
	});
	
	// 영화시간 클릭 
	$("#screen_list > li").click(function(){
		$("#reserveStep02").click();
	});

	// 화면 이동 (예매 Step)
  	goNextStep();

	// 결제하기 버튼 > 예약
	$("#link_rpay").click(function(){
		if (!confirm("예매하시겠습니까?")) {
				alert("예매 취소하셨습니다");
				return;
		} else {
			//$("#reserveStep04").click();
			goReservation();
	      	//reservationDetail.jsp 로 이동
			}
	});
}





/*
*	극장, 영화, 타임테이블 조회 영역
*/

// 지역 > 극장
function setCinema(location) {
	
      $.ajax({
      type:"get",
      url: "../screen?param=cinema&location=" + location,
      success:function( data ){
         console.log(data);
         $("#select_cinema").empty();
         

		if(data?.length) {
	         for (var i=0; i< data.length ; i++){
	            let cinema = data[i].CINEMA;
	            let onlyCinema = cinema.split('-')[1];
	
	            let htmlTxt = `<li class="depth1 cinema_li" value="${cinema}">
	                                <a href="#">${onlyCinema}</a>
	                           </li>`;
	
	            $("#select_cinema").append(htmlTxt);
	         }
	         $('.cinema_li').first().addClass("active");
	
	         // active deactive 처리를 위한 리스너
	         $('.cinema_li').click(function (){
	           $(this).addClass("active");
	           $(this).siblings().removeClass("active");
	         });
	
	         setMovie(data[0].CINEMA);
		} else {
			console.log("영화관 없음");
		}
      },

      error:function(){
         console.log("error");
      }
   });
};

// movie id 값 세팅
function getMovieId(v) {
	$("#movie_id").val(v);
	alert("func");
}


// 영화관 > 영화 목록
function setMovie(cinema) {
   $.ajax({
      type:"get",
      //url: $("#REALPATH").val() + "/movie?param=list",
      url: "../screen?param=movie&cinema=" + cinema,
      success:function( data ){
         $("#select_movie").empty();
         
         for (var i=0; i< data.length ; i++){
			htmlTxt = "<option class='movie_select' value=''>영화를 선택해주세요</option>";
            htmlTxt = "<option class='movie_select' onclick='setScreen()' value=" + data[i].MOVIE_ID + ">" + data[i].TITLE + "</option>";
            $("#select_movie").append(htmlTxt);
         }

         //setScreen();
      },

      error:function(){
         console.log("error");
      }
   });
};


// 타임 테이블 세팅
function setScreen() {
	let location = document.querySelector("#select_location > li.depth1.active > a").text;
	let cinema	 = document.querySelector("#select_cinema > li.depth1.active > a").text;
	
	let cinema_param = cinema;
	let movieid 	 = $("#select_movie option:selected").val();
	$("#movie_id").val(movieid);
	let inputdate	 = $("#input_date").val();
	inputdate = typeof inputdate == "undefined"?getTodayDate():inputdate;
	
	console.log(cinema_param +"/"+ movieid +"/"+ inputdate);
		
   $.ajax({
      type:"get",
      data:{ "cinema":cinema_param, 
            "movieid":movieid,
            "inputdate": inputdate}, // inputdate
      url: "../screen?param=timetable",
      success:function( data ){
		console.log(data);
         
		$("#time_container").empty();
		
		if(data?.length) {
			document.getElementById("notice").style.display = 'none';
			console.log("Not Empty");
			
			let title = data[0].TITLE;
			let rated = data[0].RATED;		
			
			let liTxt = "";
			let li = "";
			let screen_id = "";
			let time = "";
			data.forEach((e) => {
				console.log(e);
				screen_id = e.SCREEN_ID;
				time = e.SCREEN_AT.slice(-5);
				li = getTimeHtml(screen_id, time);		
				liTxt += li;
			});
			
			let htmlTxt = "<div class='group_time_select' name='screen_element'>";
				htmlTxt += getTitleHtml(movieid, title, rated);
				htmlTxt += "<div class='time_select_wrap timeSelect'>";
				htmlTxt += "<ul class='list_time' id='screen_list'>";
				htmlTxt += liTxt;
				htmlTxt += "</ul>";
				htmlTxt += "</div>";
				htmlTxt += "</div>";
			
		// var li  =$(htmlTxt);
        	 $("#time_container").append($(htmlTxt));
  
		} else {
			console.log("Empty");
			//$("#notice").css("display", "block");
			document.getElementById("notice").style.display = 'block';
		}

	 },

      error:function(){
         console.log("error");
      }
   });
};


// 영화정보
const getTitleHtml = (movieid, title, rated) => {
	let titleHtml = "<div class='time_select_tit' name='movie_name'>";
		titleHtml += "<input type='hidden' name='movie_id' value='" + movieid + "'>";
		titleHtml += "<span class='ic_grade gr_" + rated + "'>" + rated + "</span><strong>" + title + "</strong>";
		titleHtml += "</div>";
		titleHtml += "</div>";
	return titleHtml;
}


// 시간정보 
const getTimeHtml = (screen_id, time) => {
	let timeHtml = "<li class='temp_left'>";
		timeHtml += "<a role='button' href='#none' class='screen_time' value='" + screen_id + "' onclick='goStepTwo("+screen_id+")'>" + time;
		timeHtml += "</a>";
		timeHtml += "</li>";
	return timeHtml;
}


// 인원 선택 화면 세팅
const selectPeople = () => {
	
	$.ajax({
      type:"get",
      data : {screen_id : $("#screen_id").val()},
      url: "../screen?param=movieDetail",
      success:function( data ){
		console.log(data);
		
		// 관람가 + 제목 #movie_info_people
		$("#movie_info_people").empty();
		var title = "<span class='ic_grade gr_'"+ data.RATED +">관람가</span><strong>";
		title += "<strong>"+data.TITLE+"</strong>";	
		$("#movie_info_people").append(title);
		
		// 상영정보 #sub_info_screen
        $("#sub_info_screen").empty();
		var screen = data.SCREEN_AT + " / " + data.RUNTIME + "분";
		title += "<strong>"+data.TITLE+"</strong>";	
		$("#sub_info_screen").append(screen);
		
		// 포스터 이미지 #step02_movie_img
		$("#step02_movie_img").attr("src", data.IMAGE_URL);

		// 영화관 #sub_info_cinema
		$("#sub_info_cinema").text(data.CINEMA);
		
      },

      error:function(){
         console.log("error");
      }
   });
}


// 다음 예매 스텝
const goNextStep = () => {
	
	$("#reserveStep01").click(function(){
		$("#contentStep01").css("display", "");
		$("#contentStep02").css("display", "none");
		$("#reserveStep01").parent().addClass("active").addClass("step02").removeClass("disabled");
		$("#reserveStep02").parent().removeClass("active").removeClass("step01").addClass("disabled");
		//selectPeople();
	});
	
	$("#reserveStep02").click(function(){
		$("#contentStep01").css("display", "none");
		$("#contentStep02").css("display", "");
		$("#reserveStep01").parent().removeClass("active").removeClass("step01").addClass("disabled")
		$("#reserveStep02").parent().addClass("active").addClass("step02").removeClass("disabled");
		selectPeople();
	});
	
	$("#reserveStep03").click(function(){
		//$("#contentStep01").css("display", "none");
		//$("#contentStep02").css("display", "");
		$("#reserveStep02").parent().removeClass("active").removeClass("step01").addClass("disabled")
		$("#reserveStep03").parent().addClass("active").addClass("step02").removeClass("disabled");
		return;
	});
		
	$("#reserveStep04").click(function(){
		//$("#contentStep03").css("display", "none");
		//$("#contentStep04").css("display", "");
		$("#reserveStep03").parent().removeClass("active").removeClass("step01").addClass("disabled")
		$("#reserveStep04").parent().addClass("active").addClass("step02").removeClass("disabled");

		return;
	});
	

};



// insert to reservation
function goReservation() {
	
	  let people_count = $("#sub_info_people_cnt").val();
	  if (people_count < 1) {
			alert("1명 이상부터 예매가능합니다.");
			$("#people_count").focus();
			return;
	  }
	
	  $.ajax({
      type:"get",
      data:{ "member_id":$("#member_id").val(),
             "screen_id":$("#screen_id").val(),
             "people_count":people_count,
             "movie_id": $("#select_movie").val()
			/*
              "member_id":"hyewon",
              "screen_id": 1n,
              "people_count": "2",
              "movie_id": 17*/
      },

      url: "../reservation?param=success",

      success:function( data ){
            //location.href = "../mypage/myPage.jsp"
      },      

      error:function(){
         console.log("error");
      }
   });
   
};



// 날짜 세팅
function setWeekly() {
   let week = ['일', '월', '화', '수', '목', '금', '토'];

   let today = new Date();
   let year = today.getFullYear();
   let month = today.getMonth() + 1;
   let date = today.getDate();
   let day = today.getDay();
   
   let strMonth = month<10 ? '0'+ month : month ;
   let strdate  = date<10 ? '0' + date : date ;
   
   let inputdate = year + '-' + strMonth + '-' + strdate;
   
   //초기화
   $("#select_weekly").empty();
   $("#h4_date").text(inputdate);
   
   for (var i=0; i< 7 ; i++){
      let strMonth = month<10 ? '0'+ month : month ;
      let strdate  = date<10 ? '0' + date : date ;
      let inputdate = year + '-' + strMonth + '-' + strdate;
   
      htmlTxt = "<li>";
      htmlTxt += "<div class='owl-item' style='width:52.5px; float:left;'>";
      htmlTxt += "<span class = 'date'>";
      htmlTxt += "<label>";
	  htmlTxt += "<input class='inputdate_input' type='radio' name='radioDate1' value='"+ inputdate + "'  onclick='setDate(this)'>";
      htmlTxt += "<strong>"+ date + "</strong>";
      htmlTxt += "<em>" + week[(day+i)%7] + "</em>";
      htmlTxt += "</label>";
      htmlTxt += "</span";
      htmlTxt += "</div>";
      htmlTxt += "</li>";
      
      var li  =$(htmlTxt);
      $("#select_weekly").append(li);
      
      date++;
   }

	 let firstDate = $(".inputdate_input").val();
		$("#input_date").val(firstDate);

};


function goStepTwo(v) {
	
	console.log(v);
	$("#screen_id").val(v);
	
	$("#reserveStep02").click();
	
	
}

function setDate(e) {
	$(this).attr( "checked", "checked" );
	$("#input_date").val(e.value);
	setScreen();
}

const getTodayDate = () => {
	let today = new Date();
	let month = today.getMonth() + 1;
	let date = today.getDate();
	   
	let strMonth = month<10 ? '0'+ month : month ;
	let strdate  = date<10 ? '0' + date : date ;
	   
	let todayDate = today.getFullYear() + '-' + strMonth + '-' + strdate;
	
	return todayDate;
	
}