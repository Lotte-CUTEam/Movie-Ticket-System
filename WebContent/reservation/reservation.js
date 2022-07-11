/**
 * 
 */


window.addEventListener('DOMContentLoaded', function () {
    domready();
}); 


const domready = () => {
	// 초기설정
	// 초기 조회
	setMovie();
};

const setMovie = () => {
	$.ajax({
		type:"get",
		//url: $("#REALPATH").val() + "/movie?param=list",
		url: "../movie?param='list'&page='reservation'",
		success:function( data ){
			
			$("#select_movie").empty();
			console.log(data);
			
			for (var i=0; i< data.length ; i++){
				var liTxt = i==0?"<li class='depth1 active'":"<li class='depth1'";
				li += "<a href='#'>";
				li += "	<a href='#'>";
				li += "		<div class=''bx_tit'>";
				li += "			<span class=ic_grade gr_"+data[i].RATED+">"+data[i].RATED+"세 관람가</span>";
				li += "			<strong class='tit'>"+data[i].TITLE+"</strong>";
				li += "		</div>"
				li += "	</a>";
				li += "</li>";
				var li  =$(liTxt);
				$("#select_movie").append(li);
			}			
		},

		error:function(){
			console.log("error");
		}
	});
};

const selectLoc = (e) => {
	
	alert($(this).val());
	$(this).parent().addClass("active");
	//$(this).parent("li").addClass("active").siblings("li").removeClass("active");
};


