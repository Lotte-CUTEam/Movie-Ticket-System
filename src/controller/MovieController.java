package controller;

import dao.MovieDao;
import dto.MovieDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
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

        req.setCharacterEncoding("utf-8");

        String param = req.getParameter("param");

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


}
