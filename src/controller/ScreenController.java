package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import dao.MovieDao;
import dao.ScreenDao;
import dto.MovieDto;
import dto.MovieScreenDto;


@WebServlet("/screen")
public class ScreenController extends HttpServlet {

    private ScreenDao screenDao = ScreenDao.getInstance();
    private MovieDao movieDao = MovieDao.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doProcess(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doProcess(req, resp);
    }


    /**
     * 
     * @param req
     * @param resp
     * @throws IOException
     * @throws ServletException
     */
    public void doProcess(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        req.setCharacterEncoding("utf-8");
        String param = req.getParameter("param");

        /*
         * if (param.equals("cinema")) { // 영화관 리스트 List<String> cinemaList =
         * screenDao.getCinemaList(); req.setAttribute("cinemaList", cinemaList);
         * 
         * forward("reservation/reservation.jsp", req, resp);
         * 
         * } else
         */

        if (param.equals("movie")) {
            // 영화 리스트
            List<MovieDto> movies = movieDao.getMovies("", "", 0, "");
            sendMovieList(movies, resp);

        } else if (param.equals("movieDetail")) {
            // send movie

        } else if (param.equals("cinema")) {
            // 극장 리스트
            String location = req.getParameter("location");
            List<String> cinemaList = null;
            if (location == null || location.equals("")) {
                cinemaList = screenDao.getCinemaList();
            } else {
                cinemaList = screenDao.getCinemaList(location);
            }
            sendCinemaList(cinemaList, resp);

        } else if (param.equals("timetable")) {
            // 상영 타임 테이블
            String cinema = req.getParameter("cinema");
            int movieId = Integer.parseInt(req.getParameter("movieid"));
            String inputDate = req.getParameter("inputdate");

            List<MovieScreenDto> movieScreenList =
                    screenDao.getMovieScreenList("서울-월드타워", 0, inputDate);
            sendMovieScreenList(movieScreenList, resp);
        }
    }



    /**
     * 영화 리스트
     * 
     * @param movieScreenList
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void sendMovieList(List<MovieDto> movieList, HttpServletResponse resp)
            throws ServletException, IOException {

        JSONArray jsonArr = new JSONArray();
        JSONObject obj = null;
        for (int i = 0; i < movieList.size(); i++) {

            obj = new JSONObject();
            MovieDto movie = movieList.get(i);
            obj.put("MOVIE_ID", movie.getMovieId());
            obj.put("TITLE", movie.getTitle());
            obj.put("RATED", movie.getRated());


            jsonArr.add(obj);
        }

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(jsonArr);

    }

    protected void sendCinemaList(List<String> cinemaList, HttpServletResponse resp)
            throws ServletException, IOException {

        JSONArray jsonArr = new JSONArray();
        JSONObject obj = null;
        for (int i = 0; i < cinemaList.size(); i++) {

            obj = new JSONObject();
            obj.put("CINEMA", cinemaList.get(i));
            System.out.println(cinemaList.get(i));
            System.out.println("극장불러오기");
            jsonArr.add(obj);
        }

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(jsonArr);

    }

    /**
     * 상영시간 테이블
     * 
     * @param movieScreenList
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void sendMovieScreenList(List<MovieScreenDto> movieScreenList,
            HttpServletResponse resp) throws ServletException, IOException {

        JSONArray jsonArr = new JSONArray();
        JSONObject obj = null;
        for (int i = 0; i < movieScreenList.size(); i++) {

            obj = new JSONObject();
            MovieScreenDto movieScreen = movieScreenList.get(i);
            obj.put("SCREEN_ID", movieScreen.getScreenDto().getScreenId());
            obj.put("MOVIE_ID", movieScreen.getMovieDto().getMovieId());
            obj.put("SCREEN_AT", movieScreen.getScreenDto().getScreenAt());
            obj.put("CINEMA", movieScreen.getScreenDto().getCinema());

            obj.put("TITLE", movieScreen.getMovieDto().getTitle());
            obj.put("RATED", movieScreen.getMovieDto().getRated());


            // System.out.println(movieScreen.getScreenDto().getCinema());
            jsonArr.add(obj);
        }

        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(jsonArr);

    }

    //

    public void forward(String arg, HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher dispatch = req.getRequestDispatcher(arg);
        dispatch.forward(req, resp);
    }
}

