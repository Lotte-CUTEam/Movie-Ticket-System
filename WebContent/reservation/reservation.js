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
	
	
	
}); 


const domready = () => {
	// 초기설정
	
	// 초기 조회
	setMovie();
	setCinema();
	

};

const click_cinema = (cinema) => {
	
}

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
				liTxt += "<a href='#'>" + data[i].CINEMA + "</a>";
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
		url: "../movie?param=list",
		data : {"page": "reservation"},
		success:function( data ){
			
			$("#select_movie").empty();
			console.log(data);
			
			for (var i=0; i< data.length ; i++){
				var liTxt = i==0?"<li class='depth1 active'":"<li class='depth1'>";
				liTxt += "	<a href='#'>";
				liTxt += "		<div class=''bx_tit'>";
				liTxt += "			<span class=ic_grade gr_"+data[i].RATED+">"+data[i].RATED+"세 관람가</span>";
				liTxt += "			<strong class='tit'>"+data[i].TITLE+"</strong>";
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
		//url: $("#REALPATH").val() + "/movie?param=list",
		url: "../movie?param=timetable",
		success:function( data ){
			
			$("#time_container").empty();
			console.log(data);
			
			for (var i=0; i< data.length ; i++){
				var htmlTxt = "<div class='group_time_select' id='screen_element'>";
				
				htmlTxt += "<div class='time_select_tit' id='movie_name'>";
				htmlTxt += "<span class='ic_grade gr_'"+ data.RATED +">"+ data.RATED +"</span><strong>"+ data.TITLE +"</strong>";
				htmlTxt += "</div>";
				
				htmlTxt += "<ul class='ist_time' id=''screen_list'>"
				htmlTxt += "<li class='temp_left'>";
				htmlTxt += "<a role='button' href='#none'><dl><dt>상영시간</dt><dd class='time'><strong>"+ data.SCREEN_AT +"</strong></a>";
				htmlTxt += "</li>";
				htmlTxt += "</ul>";
				
				htmlTxt += "</div>";
			}			
		},

		error:function(){
			console.log("error");
		}
	});
};


const selectloc = () => {

	$(this).parent().addClass("active");
	$(this).parent("li").addClass("active").siblings("li").removeClass("active");
};

const getCinema = () => {

	
};

