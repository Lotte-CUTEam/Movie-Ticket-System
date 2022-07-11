

package controller;

import com.google.gson.Gson;
import dao.MovieDao;
import dto.AllMovieDto;
import dto.MovieDto;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 *
 * [시스템명]영화예매시스템
 *
 * [팀   명]CUTEam -----------------------------------------------------------
 *
 * 수정일자           수정자         수정내용
 *
 * 2022.07.08       권나연         신규생성
 *
 * 2022.07.11       권나연         URL Path 수정 및 요청 처리 방식 변경
 *
 * -----------------------------------------------------------
 */

// rating-top5
// latest-top5
// all
// names

@WebServlet("/movies/*")
public class MovieController extends HttpServlet {

    private final MovieDao movieDao = MovieDao.getInstance();

    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        int rIdx = req.getRequestURI().lastIndexOf('/');
        String resource = req.getRequestURI().substring(rIdx + 1);
        System.out.println(String.format("[MovieController] doGet: rIdx = %s, resource = %s", rIdx, resource));


        doProcess(resource, req, resp);

    }

    public void doProcess(String resource, HttpServletRequest req, HttpServletResponse resp)
        throws IOException {

        JSONObject obj = new JSONObject();

        switch (resource) {
            case "rating-top5":

                List<MovieDto> ratingTop5 = movieDao.getMoviesScreeningRatingTop5();

                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().print(gson.toJson(ratingTop5));

                break;

            case "latest-top5":

                List<MovieDto> latestTop5 = movieDao.getMoviesLatestScreeningTop5();

                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
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
                // TODO [영화 목록] Controller throw Exception

                List<MovieDto> movies = movieDao.getMovies(searchCategory, search, pageNo, filter);

                Integer movieCnt = movieDao.getMovieCount();
                int pageCnt = movieCnt / MovieDao.PAGE_CONTENT_COUNT;
                if ((pageCnt%MovieDao.PAGE_CONTENT_COUNT) > 0) {
                    pageCnt = pageCnt + 1;
                }

                AllMovieDto dto = new AllMovieDto(searchCategory, search, pageCnt, pageNo, movies);

                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().print(gson.toJson(dto));

                break;
            // 영화 예매
            case "names":


                List<MovieDto> movieNames = movieDao.getMovieNames();

                // TODO [영화 목록] 영화 이름 리스트 ReservationController 쪽으로 넘기기

                break;
        }
//
//        resp.setContentType("application/json");
//        resp.setCharacterEncoding("UTF-8");
//        resp.getWriter().print(obj.toString());



    }

    public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        RequestDispatcher dispatch = req.getRequestDispatcher(arg);
        dispatch.forward(req, resp);
    }
}

