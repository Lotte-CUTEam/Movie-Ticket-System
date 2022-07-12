<!-- 
[프로젝트]롯데e커머스_자바전문가과정
[시스템명]영화예매시스템
[팀 명]CUTEam
[파일명]quickbar.jsp
-----------------------------------------------------------
수정일자			수정자		수정내용
2022.07.11		정은우		신규생성
-----------------------------------------------------------
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="quick_wrap"
	style="position: fixed; z-index: 11; right: 20px; width: 82px; text-align: center; color: #000; display: block; overflow: hidden; top: 150px;">
	<div class="quick_menu" id="quick_menu"
		style="padding-top: 15px; background-color: #fff; color: #000; box-shadow: 5px 3px 6px rgba(0, 0, 0, 0.16); border-radius: 5px; overflow: hidden;">
		<a href="" style="color: black; display: block;"><img
			src="<%=request.getContextPath()%>/assets/img/ticketing_icon.png" /></a>
		<a href="#" class="qick_top"
			style="margin-top: 10px; background: #3e3d3d; font-size: 11px; color: #fff; letter-spacing: 5px; padding: 5px 5px 5px 13px; text-decoration: none; display: block;">TOP</a>
	</div>
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