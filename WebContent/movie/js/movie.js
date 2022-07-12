/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]movie.js
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.11       권나연         신규생성
 * -----------------------------------------------------------
 */


/* 사용자가 선택한 목록을 저장하는 전역 변수 */
let curSearchCategory = ""; // 선택된 검색 카테고리
let curSearch = ""; // 검색어
let curFilter = ""; // 필터
let curPageNo = 0; // 페이지


/* 영화 차트 탭 메뉴 */
var movBtn = $(".movie_title > ul > li");
var movCont = $(".movie_chart > div");
let chartCont = $('.chart_cont1');

movCont.hide().eq(0).show();

/* 영화 차트 목록 버튼 클릭 이벤트 (전체 영화 목록, TOP5) */
movBtn.click(function(e) {
  e.preventDefault();

  var target = $(this);
  var index = target.index();

  movBtn.removeClass("active");
  target.addClass("active");

  movieMenuBtnToggle(index);
});

/* 영화 차트 목록 토클 */
// 버튼을 클릭하면 이전 내용을 지우고,
// 요청을 보내서 새로운 내용으로 출력
function movieMenuBtnToggle(index) {
  curSearchCategory = "";
  curSearch = "";
  curFilter = "";

  let moviesCtrl = $('.movies_ctrl');
  if (index == 0) {
    moviesCtrl.show();
    getMovies();

  } else if (index == 1) {
    moviesCtrl.hide();
    getMoviesScreeningRatingTop5();

  } else if (index == 2) {
    moviesCtrl.hide();
    getMoviesLatestScreeningTop5();
  }
}
movieMenuBtnToggle(0);


/* 영화 DIV margin-top 설정 */
// (4번째 영화 오른쪽 마진 0 설정)
function setMovieDivMarginTop() {
  let movDiv = $(".movie_div");
  for (let i=0; i<movDiv.length; i++) {
    if (i%4 == 3) {
      movDiv.eq(i).css("margin-right", "0px");
    }
  }
}

/* 영화 목록 조회 조건 설정 */
// 전역 변수로 저장해 뒀다가, 요청 응답 시 변수 값을 사용
function goPage(pageNo) {
  curPageNo = pageNo;
  getMovies();
}

function goFilter(filter) {
  curFilter = filter;
  curPageNo = 0; // 새로운 필터로 조회하면 페이지는 0번 페이지로
  getMovies();
}

function searchMovie() {
  let vSearchCategory = $('#searchCategory').val();
  let vSearch = $('#search').val();

  if (vSearchCategory == "") {
    alert("검색 조건을 다시 확인해주세요 :(");

    $('#searchCategory').val("");
    $('#search').val("");

    return;
  }

  curSearchCategory = vSearchCategory;
  curSearch = vSearch;

  getMovies();
}

/* 평점 순 영화 5개 조회 */
function getMoviesScreeningRatingTop5() {
  chartCont.empty();

  $.ajax({
    url: `${contextPath}/movies/rating-top5`,
    type: "GET",
    success: function (data) {
      console.log("[index.jsp] getMovies: success get movies data ");

      makeMovieTop5Div(data);
      setMovieDivMarginTop();
    },
    error: function (request,status,error) {
      alert("[movie list] movie.js: getMoviesScreeningRatingTop5() error.");
    }
  }) ;

}

/* 최신 순 영화 5개 조회 */
function getMoviesLatestScreeningTop5() {
  chartCont.empty();

  $.ajax({
    url: `${contextPath}/movies/latest-top5`,
    type: "GET",
    success: function (data) {
      console.log("[index.jsp] getMovies: success get movies data ");
      console.log(data);

      makeMovieTop5Div(data);
      setMovieDivMarginTop();
    },
    error: function (request,status,error) {
      alert("[movie list] movie.js: getMoviesLatestScreeningTop5() error.");
    }
  }) ;

}

/* 모든 영화 조회 */
function getMovies() {
  chartCont.empty();

  $.ajax({
    url: `${contextPath}/movies/all?searchCategory=` + curSearchCategory + "&search=" + curSearch + "&pageNo="
        + curPageNo + "&filter=" + curFilter,
    type: "GET",
    success: function (data) {
      console.log("[index.jsp] getMovies: success get movies data ");

      if (data.movies.length != 0) {
        makeMoviesDiv(data.movies); // 영화 DIV 생성
        setMovieDivMarginTop(); // 생성한 DIV의 오른쪽 마진 설정
        makeMoviePageIdx(data.pageCnt, data.pageNo); // 페이지 목록 출력
      }
      // 확인된 영화 목록이 없는 경우 메시지 출력
      else {
        alert(curSearchCategory + ":" + curSearch + "와 일치하는 영화 목록이 없습니다 :(");
        location.reload();
      }

      curSearchCategory = data.searchCategory;
      curSearch = data.search;
    },
    error: function (request,status,error) {
      alert("[movie list] movie.js: getMovies() error.");
    }
  });
}

/* 페이지 번호 생성 */
function makeMoviePageIdx(pageCnt, pageNo) {

  let moviePage = $('.movie_page');

  let html = "<ul class=clearfix>";
  for (let i=0; i<pageCnt; i++) {
    if (pageNo == i) {
      html += `<li class="active"><a>` + (i + 1) + `</a></li>`;
    }
    else {
      html += `<li><a onclick="goPage(`+ i + `)">` + (i + 1) + `</a></li>`;
    }
  }
  html += "</ul>";

  moviePage.empty();
  moviePage.append(html);
}

function makeMovieTop5Div(movies) {
  let html = "";
  $.each(movies, function(idx, movie) {
    html += `         <div class="movie_div">
                                    <div class="poster">
                                        <figure>
                                            <img src="` + movie.imageUrl + `" alt="` + movie.title + `">
                                        </figure>
                                        <div class="rank">
                                            <strong>` + (idx + 1) + `</strong>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h4 align="center" style="margin-top: -10px; margin-bottom: 10px;">
                                            <span class="icon a15 ir_pm">` + movie.rated + `세 이상 관람</span>
                                            <strong>` + dot3(movie.title) + `</strong>
                                        </h4>
                                        <div class="infor_btn">
                                            <a href="${contextPath}/movieDetail?param=detail&id=` + movie.movieId + `">상세정보</a> <a href="#">예매하기</a>
                                        </div>
                                    </div>
                                </div>`;
  });
  chartCont.append(html);
}

function makeMoviesDiv(movies) {
  let html = "";
  $.each(movies, function(idx, movie) {
    html += `         <div class="movie_div">
                                    <div class="poster">
                                        <figure>
                                            <img src="` + movie.imageUrl + `" alt="` + movie.title + `">
                                        </figure>
                                        <div class="rated">
                                            <strong>` + (movie.rated) + `</strong>
                                        </div>
                                    </div>
                                    <div class="infor">
                                        <h4 align="center" style="margin-top: -10px; margin-bottom: 10px;">
                                            <span class="icon a15 ir_pm">` + movie.rated + `세 이상 관람</span>
                                            <strong>` + dot3(movie.title) + `</strong>
                                        </h4>
                                        <div class="infor_btn">
                                            <a href="${contextPath}/movieDetail?param=detail&id=` + movie.movieId + `">상세정보</a>
											<a href="${contextPath}/reservation?param=reservation">예매하기</a>
                                        </div>
                                    </div>
                                </div>`;
  });
  chartCont.append(html);
}

/* 글이 긴 경우 ... 으로 표시 (최대 20자) */
function dot3(msg) {
  let str = "";
  if (msg.length >= 20) {
    str = msg.substring(0, 20);
    str += "...";
  } else {
    str = msg.trim();
  }
  return str;
}