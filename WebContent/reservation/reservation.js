/**
 * 예매화면
 */


window.addEventListener('DOMContentLoaded', function () {

   // 화면 초기 진입 시 세팅하는부분
    domready();

   // 클릭시
   $(".depth1").click(function() {
      $(this).addClass("active");
      $(this).siblings("li").removeClass("active");
   });
   
   // 지역 클릭시 재조회
	$("#select_location > li").click(function(){
		setCinema();
	});

   
   // 영화 클릭시 재조회
   $("#select_movie > li ").click(function(){
		alert("click");
		setScreen();
	});

	//영화시간 클릭 > 
   $("#screen_list > li").click(function(){
		
		$("#reserveStep02").click();
	});
	
   // 화면 이동
   goNextStep();
   
   // 극장 버튼 선택시
   $(".depth1").click(function() {
      $(this).addClass("active");
      $(this).siblings("li").removeClass("active");
   });

	// 결제하기 버튼 > 예약 
	$("#link_rpay").click(function(){
	  	if (!confirm("예매하시겠습니까?")) {
	       alert("예매 취소하셨습니다");
		   return;
	    } else {	
			$("#reserveStep04").click();
			goReservation();
			//reservationDetail.jsp 로 이동

	    }
		
	});
	
	
}); 


// 화면 초기 진입 세팅
const domready = () => {
   
   // 초기 조회
   setCinema();	//극장
   setMovie();	//영화
   setScreen();	//타임테이블
   
   // 달력 세팅
   setWeekly();

};


/** 화면 초기 진입 세팅 **/

// 극장 이름 세팅
// 왜인지 안먹음 .. 왜지
const setCinema = () => {
	
      $.ajax({
      type:"get",
      data : {location:$("#location_setting > div > div > ul > li.depth1.active").text()},
      url: "../screen?param=cinema",
      success:function( data ){
         console.log(data);
         $("#select_cinema").empty();
         
         for (var i=0; i< data.length ; i++){
			console.log(data[i]);
			console.log(data[i].CINEMA);
			htmlTxt = "<option value='" + data[i].CINEMA + "'>" + data[i].CINEMA + "</option>";
			console.log(htmlTxt);
			$("#select_cinema").append(htmlTxt);
         }        

      },

      error:function(){
         console.log("error");
      }
   });
};


// movie id 값 세팅

function getMovieId(e) {
	$("#movie_id").val(e.val());
	alert("func");
}

// 다음 예매 스텝
const goNextStep = () => {
	
	$("#reserveStep01").click(function(){
		$("#contentStep01").css("display", "");
		$("#contentStep02").css("display", "none");
		$("#reserveStep01").parent().addClass("active").addClass("step02").removeClass("disabled");
		$("#reserveStep02").parent().removeClass("active").removeClass("step01").addClass("disabled");
		selectPeople();
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

// 영화 이름 세팅
const setMovie = () => {
   $.ajax({
      type:"get",
      //url: $("#REALPATH").val() + "/movie?param=list",
      data : {cinema : $("#cinema").val()},
      url: "../screen?param=movie",
      success:function( data ){
         
         $("#select_movie").empty();
         
         for (var i=0; i< data.length ; i++){
			htmlTxt = "<option value=" + data[i].MOVIE_ID + ">" + data[i].TITLE + "</option>";
			$("#select_movie").append(htmlTxt);
         }         
      },

      error:function(){
         console.log("error");
      }
   });
};

// 타임 테이블 세팅
const setScreen = () => {
	let location = document.querySelector("#\\#select_location > li.depth1.active > a").text;
	let cinema	 = document.querySelector("#\\#select_cinema > li.depth1.active > a").text;
	
	let cinema_param = location + '-' + cinema;
	let movieid 	 = $("#select_movie option:selected").val();
	
	let inputdate	 = $("#input_date").val();
	inputdate = typeof inputdate == "undefined"?getTodayDate():inputdate;
	
	console.log(cinema_param, movieid, inputdate);
	
		
   $.ajax({
      type:"get",
      data:{ "cinema":cinema_param, 
            "movieid":movieid,
            "inputdate": inputdate},
      url: "../screen?param=timetable",
      success:function( data ){
         
         $("#time_container").empty();
         console.log(data);
         
		

         var title = data[0].title;
         for (var i=0; i< data.length ; i++){ // title 필터한 수
            var htmlTxt = "<div class='group_time_select dynamic' id='screen_element'>";
            htmlTxt += "<input type='hidden' id='screen_id' value='"+data[i].SCREEN_ID+"'>";
            htmlTxt += "<div class='time_select_tit' id='movie_name'>";
            htmlTxt += "<span class='ic_grade gr_'"+ data[i].RATED +">"+ data[i].RATED +"</span>&nbsp;<strong>"+ data[i].TITLE +"</strong>";
            htmlTxt += "</div>";
            
            
            htmlTxt += "<ul class='ist_time' id=''screen_list'>"
            for (var j=0;j<3;j++)
            htmlTxt += "<li class='temp_left'>";
            htmlTxt += "<a role='button' href='#none'><dl><dt>상영시간</dt><dd class='time'><strong>"+ data[i].SCREEN_AT +"</strong></a>";
            htmlTxt += "</li>";
            htmlTxt += "</ul>";
            
            htmlTxt += "</div>";
            var li  =$(htmlTxt);
            $("#time_container").append(li);
         }         
      },

      error:function(){
         console.log("error");
      }
   });
};

// 인원 선택 화면 세팅
const selectPeople = () => {
	
	
	console.log( $("#screen_id").val());
	  $.ajax({
      type:"get",
      data : {movie_id : $("#screen_id").val()},
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

// 날짜 세팅
const setWeekly = () => {
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
   $("#h4_date").text(inputdate +"오늘");
   
   for (var i=0; i< 7 ; i++){
      let strMonth = month<10 ? '0'+ month : month ;
      let strdate  = date<10 ? '0' + date : date ;
      let inputdate = year + '-' + strMonth + '-' + strdate;
   
      htmlTxt = "<li>";
      htmlTxt += "<div class='owl-item' style='width:52.5px; float:left;'>";
      htmlTxt += "<span class = 'date'>";
      htmlTxt += "<label>";
	  htmlTxt += "<input type='radio' name='radioDate1' value='"+ inputdate + "'  onclick='setDate(this.value)'>";
      htmlTxt += "<strong>"+ date + "</strong>";
      htmlTxt += "<em>" + week[i] + "</em>";
      htmlTxt += "</label>";
      htmlTxt += "</span";
      htmlTxt += "</div>";
      htmlTxt += "</li>";
      
      var li  =$(htmlTxt);
      $("#select_weekly").append(li);
      
      date++;
   }
};



// insert to reservation
const goReservation = () => {
      $.ajax({
      type:"get",
      data:{ "member_id":$("#member_id").val(), 
             "screen_id":$("#screen_id").val(),
             "people_count":$("#sub_info_people_cnt").val(),       
      },
      url: "../reservation?param=booking",
      success:function( data ){
            //location.href = "../mypage/myPage.jsp"
      },      

      error:function(){
         console.log("error");
      }
   });
   
};

function setDate(inputdate) {
	$("#input_date").val(inputdate);
}

/*const setDate = (inputdate) => {
	$("#input_date").val(inputdate);
};*/

const getTodayDate = () => {
	let today = new Date();
	let month = today.getMonth() + 1;
	let date = today.getDate();
	   
	let strMonth = month<10 ? '0'+ month : month ;
	let strdate  = date<10 ? '0' + date : date ;
	   
	let todayDate = today.getFullYear() + '-' + strMonth + '-' + strdate;
	
	return todayDate;
	
}