package controller;

import dao.MovieDao;
import dto.MovieDto;
<<<<<<< HEAD

=======
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
>>>>>>> 00a80d014175af29b0a9a2514f008132c13b2532
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import java.io.IOException;
=======
>>>>>>> 00a80d014175af29b0a9a2514f008132c13b2532

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
<<<<<<< HEAD
 * [팀   명]CUTEam
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.09       안채영         신규생성
 * -----------------------------------------------------------
 */
@WebServlet(name = "movieController", value = "/movie")
public class MovieController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    /***
     * GET,POST 처리 메소드
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

=======
 * [팀   명]CUTEam -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       권나연         신규생성
 * -----------------------------------------------------------
 */

@WebServlet("/movie")
public class MovieController extends HttpServlet {

    private MovieDao movieDao = MovieDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
>>>>>>> 00a80d014175af29b0a9a2514f008132c13b2532
        req.setCharacterEncoding("utf-8");

        String param = req.getParameter("param");

<<<<<<< HEAD
        if(param.equals("movieDetail")) {
            System.out.println("[movieDetail]: call success");

            Long id = Long.parseLong(req.getParameter("id"));

            MovieDto result = getMovieDetail(id);

            if(result == null) {
                System.out.println("[movieDetail]: result is null, FAIL");

                String msg = "movieDetail FAIL";
                resp.sendRedirect("message.jsp?msg=" + msg);
            }

            resp.setContentType("application/json");
            resp.setCharacterEncoding("utf-8");

            req.setAttribute("movie", result);
            req.getRequestDispatcher("movie/movieDetail.jsp").forward(req, resp);

            System.out.println("[movieDetail]: call end");
        }

    }

    /***
     * 영화 상세 정보 데이터 조회 메소드
     * @param id
     * @return
     */
    public MovieDto getMovieDetail(Long id) {

        MovieDao dao = MovieDao.getInstance();

        MovieDto dto = dao.getMovie(id);

        return dto;
    }


=======
        switch (param) {
            case "list":
                List<MovieDto> movies = movieDao.getMovies();
                // TODO [영화 목록] Controller throw Exception
                req.setAttribute("movies", movies);
                forward("/movie/movieList.jsp", req, resp);
                break;

            case "detail":
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
>>>>>>> 00a80d014175af29b0a9a2514f008132c13b2532
}
