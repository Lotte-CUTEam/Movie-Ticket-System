/**
 * 
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

   
   // 화면 이동
   $("#select_step").find("li").click(function(){
		console.log(this);
       goNextStep($("#reserveStep02 > strong > span").text());
   });
   
   // 극장 버튼 선택시
   $(".depth1").click(function() {
      $(this).addClass("active");
      $(this).siblings("li").removeClass("active");
   });

	$("#select_weekly li").click(function() {
		$(t)
	});
	
	
}); 


// 화면 초기 진입 세팅
const domready = () => {
   
   // 초기 조회
   setCinema();
   setMovie();
   setScreen();
   
   // 달력 세팅
   setWeekly();

};


/** 화면 초기 진입 세팅 **/

// 극장 이름 세팅
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
const goNextStep = (step) => {
	
	
	switch (step) {
	  case '02':
		$("#reserveStep01").parent().removeClass("active").removeClass("step01").addClass("disabled");
		$("#reserveStep01").parent().removeClass("disabled").addClass("active").addClass("step02");
		document.getElementById("reserveStep01").display = none;
		document.getElementById("reserveStep02").display = block;
	    break;
	
	  case '03': 
		break;
	  case '04':

	    break;
	
	  default:
	   
	}
	
	
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
   $.ajax({
      type:"get",
      data:{ "cinema":$("#h4_location").text()+$("#h4_cinema").text(), 
            // "movieid":$("#movie_id").val(), 
            "movieid":$("movie_id").val(),
            "inputdate":$("input[name=radioDate1]:checked").val() },
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
      if (i==0) {
         htmlTxt += "<input type='radio' name='radioDate1' value='"+ inputdate + "' checked>";
      } else {
         htmlTxt += "<input type='radio' name='radioDate1' value='"+ inputdate + "'>";   
      }
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



const goReservation = () => {
      $.ajax({
      type:"get",
      data:{ "member_id":$("#member_id").val(), 
             "screen_id":$("#screen_id").val(),
             "people_count":$("#people_count").val(),       
      },
      url: "../reservation?param=reservation",
      success:function( data ){
            location.href = "../mypage/myPage.jsp"
      },      

      error:function(){
         console.log("error");
      }
   });
   
};

const gotoReservation = () => {
   
   let cinema = $("#location_setting > div > div > ul > li.depth1.active > a").text();
   let movie  = $("#select_movie > li.depth1.active > a").text();
}