

package controller;

import dao.MovieDao;
import dto.MovieDto;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
 * -----------------------------------------------------------
 */

@WebServlet("/movie")
public class MovieController extends HttpServlet {

    private MovieDao movieDao = MovieDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String param = req.getParameter("param");

        switch (param) {
            case "list":
                // TODO [영화 목록] Controller throw Exception
                List<MovieDto> ratingTop5 = movieDao.getMoviesScreeningRatingTop5();
                List<MovieDto> latestTop5 = movieDao.getMoviesLatestScreeningTop5();
                List<MovieDto> movies = movieDao.getMovies();

                req.setAttribute("rating-top5", ratingTop5);
                req.setAttribute("latest-top5", latestTop5);
                req.setAttribute("movies", movies);

                forward("/movie/movieList.jsp", req, resp);

                break;

            case "names":
                List<MovieDto> movieNames = movieDao.getMovieNames();
                req.setAttribute("movies", movieNames);
                // TODO [영화 목록] 영화 이름 리스트 ReservationController 쪽으로 넘기기
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String param = req.getParameter("param");
    }

    public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        RequestDispatcher dispatch = req.getRequestDispatcher(arg);
        dispatch.forward(req, resp);
    }
}

