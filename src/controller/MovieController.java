package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.MovieDao;
import dto.AllMovieDto;
import dto.MovieDto;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 *
 * [시스템명]영화예매시스템
 *
 * [팀 명]CUTEam -----------------------------------------------------------
 *
 * 수정일자 수정자 수정내용
 *
 * 2022.07.08 권나연 신규생성
 *
 * 2022.07.11 권나연 URL Path 수정 및 요청 처리 방식 변경
 *
 * 2022.07.11 권나연 Gson 생성 방식 변경
 *
 * -----------------------------------------------------------
 */

@WebServlet("/movies/*")
public class MovieController extends HttpServlet {

    private final MovieDao movieDao = MovieDao.getInstance();

    private Gson gson;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer());
        gson = gsonBuilder.setPrettyPrinting().create();

        req.setCharacterEncoding("utf-8");

        int rIdx = req.getRequestURI().lastIndexOf('/');
        String resource = req.getRequestURI().substring(rIdx + 1);
        doProcess(resource, req, resp);
    }

    /***
     * @param resource URL 마지막 경로 (요청 데이터 표시)
     * @param req
     * @param resp
     * @throws IOException
     */
    public void doProcess(String resource, HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        switch (resource) {
            case "rating-top5":

                List<MovieDto> ratingTop5 = movieDao.getMoviesScreeningRatingTop5();
                resp.getWriter().print(gson.toJson(ratingTop5));

                break;

            case "latest-top5":

                List<MovieDto> latestTop5 = movieDao.getMoviesLatestScreeningTop5();
                resp.getWriter().print(gson.toJson(latestTop5));

                break;

            case "all":
                String searchCategory = req.getParameter("searchCategory");
                String search = req.getParameter("search");
                String spageNo = req.getParameter("pageNo");
                String filter = req.getParameter("filter");
                int pageNo = 0;

                if (searchCategory == null) {
                    searchCategory = "";
                }
                if (search == null) {
                    search = "";
                }
                if (spageNo != null && !spageNo.equals("")) {
                    pageNo = Integer.parseInt(spageNo);
                }
                if (filter == null) {
                    filter = "";
                }

                List<MovieDto> movies = movieDao.getMovies(searchCategory, search, pageNo, filter);

                Integer movieCnt = movieDao.getMovieCount();
                int pageCnt = movieCnt / MovieDao.PAGE_CONTENT_COUNT;
                if ((pageCnt % MovieDao.PAGE_CONTENT_COUNT) > 0) {
                    pageCnt = pageCnt + 1;
                }

                AllMovieDto dto = new AllMovieDto(searchCategory, search, pageCnt, pageNo, movies);
                resp.getWriter().print(gson.toJson(dto));

                break;
        }
    }
}

