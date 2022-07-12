
/* 검색 시 조회된 영화 목록이 없는 경우, 표시하는 메시지 */
function getNotFoundMovieMsg(searchCategory, search) {
  return "<div align='center'>" +
      "<img width=100 src='<%=contextPath%>/mypage/images/nodata_icon.png'/>" +
      "<h1>" + data.searchCategory + ": " + search + " 와 일치하는 영화가 없습니다 :(</h1>" +
      "</div>";
}