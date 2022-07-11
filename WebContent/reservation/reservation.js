/**
 * 
 */


window.addEventListener('DOMContentLoaded', function () {

    domready();

	$(".depth1").click(function() {
		//alert("hwioweowq");
		$(this).addClass("active");
		$(this).siblings("li").removeClass("active");
	});
	
	$("#cinema_setting > div > div > ul > li > a").click(function() {
		$("#h4_cinema").text($("#cinema_setting > div > div > ul > li.depth1.active > a").text()); 
	});
	
	
}); 


const domready = () => {
	// 초기설정
	
	// 초기 조회
	setMovie();
	setScreen();
	//setCinema();
	

};



const selectloc = () => {
	$("#h4_location").text($("#location_setting > div > div > ul > li.depth1.active > a").text()); 
};

/*
const setCinema = () => {
		$.ajax({
		type:"get",
		url: "../screen?param=cinema",
		success:function( data ){
			
			$("#select_cinema").empty();
			console.log(data);
			
			for (var i=0; i< data.length ; i++){
				var liTxt = i==0?"<li class='depth1 active'":"<li class='depth1'>";
				liTxt += "<a href='#' onclick='getcinema("+data[i].CINEMA+")'>" + data[i].CINEMA + "</a>";
				liTxt += "</li>";
	
				var li  =$(liTxt);
				$("#select_cinema").append(li);
			}			
		},

		error:function(){
			console.log("error");
		}
	});
};
*/
  

const setMovie = () => {
	$.ajax({
		type:"get",
		//url: $("#REALPATH").val() + "/movie?param=list",
		url: "../screen?param=movie",
		success:function( data ){
			
			$("#select_movie").empty();
			console.log(data);
			
			for (var i=0; i< data.length ; i++){
				var liTxt = i==0?"<li class='depth1 active'":"<li class='depth1'>";
				liTxt += "	<a href='#'>";
				liTxt += "		<div class='bx_tit'>";
				liTxt += "			<span class=ic_grade gr_"+data[i].RATED+">"+data[i].RATED+"세 관람가</span>";
				liTxt += "			<strong class='tit'>"+data[i].TITLE+"</strong>";
				liTxt += "			<input type='hidden' id='movie_id' value='"+data[i].MOVIE_ID+"'>";
				liTxt += "		</div>"
				liTxt += "	</a>";
				liTxt += "</li>";
				var li  =$(liTxt);
				$("#select_movie").append(li);
			}			
		},

		error:function(){
			console.log("error");
		}
	});
};


const setScreen = () => {
	$.ajax({
		type:"get",
		data:{ "cinema":$("#h4_location").text()+$("#h4_cinema").text(), 
				// "movieid":$("#movie_id").val(), 
				"movieid":1,
				"inputdate":$("#inputdate").val() },
		url: "../screen?param=timetable",
		success:function( data ){
			
			$("#time_container").empty();
			console.log(data);
			
			for (var i=0; i< data.length ; i++){
				var htmlTxt = "<div class='group_time_select dynamic' id='screen_element'>";
				htmlTxt += "<input type='hidden' id='screen_id' value='"+data[i].SCREEN_ID+"'>";
				htmlTxt += "<div class='time_select_tit' id='movie_name'>";
				htmlTxt += "<span class='ic_grade gr_'"+ data[i].RATED +">"+ data[i].RATED +"</span><strong>"+ data[i].TITLE +"</strong>";
				htmlTxt += "</div>";
				
				htmlTxt += "<ul class='ist_time' id=''screen_list'>"
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


const goReservation = () => {
		$.ajax({
		type:"get",
		data:{ "member_id":$("#member_id").val(), 
		"movie_id":$("#movie_id").val(), 
						"screen_id":$("#screen_id").val(),
						"cinema":$("#cinema").val(),
						 "people_count":$("#people_count").val(), 
						"title":$("#title").val(),
						"runtime":$("#runtime").val(),
						"screen_at":$("#screen_at").val(),
						"inputdate":$("#inputdate").val()
		
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
