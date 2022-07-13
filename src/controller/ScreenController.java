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

/**
 * [프로젝트]롯데e커머스_자바전문가과정 [시스템명]영화예매시스템 [팀 명]CUTEam [파일명]ScreenController.java
 * ----------------------------------------------------------- 수정일자 수정자 수정내용 2022.07.11 장혜원 신규생성
 * -----------------------------------------------------------
 */
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


        if (param.equals("movie")) {
            String cinema = req.getParameter("cinema");
            List<MovieScreenDto> dto = screenDao.getMovieScreenList(cinema);

            sendMovieScreenList(dto, resp);

        } else if (param.equals("movieDetail")) {
            // send movie
            String screenId = req.getParameter("screen_id");
            long id = 0;
            if (screenId != null && !(screenId.equals(""))) {
                id = Long.parseLong(screenId);
            }

            MovieScreenDto movieScreen = screenDao.getMovieScreenDto(id);
            sendMovieScreen(movieScreen, resp);

        } else if (param.equals("cinema")) {
            // 극장 리스트
            String location = req.getParameter("location");
            location = location.trim().replaceAll("\n", "");

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
                    // screenDao.getMovieScreenList("서울-월드타워", 0, inputDate);
                    screenDao.getMovieScreenList(cinema, movieId, inputDate);
            sendMovieScreenList(movieScreenList, resp);
        }
    }



    /**
     * 영화 상영 디테일 정보
     * 
     * @param MovieScreenDto
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void sendMovieScreen(MovieScreenDto movieScreen, HttpServletResponse resp)
            throws ServletException, IOException {

        JSONObject obj = new JSONObject();

        obj.put("MOVIE_ID", movieScreen.getMovieDto().getMovieId());
        obj.put("GENRE", movieScreen.getMovieDto().getGenre());
        obj.put("IMAGE_URL", movieScreen.getMovieDto().getImageUrl());
        obj.put("TITLE", movieScreen.getMovieDto().getTitle());
        obj.put("RUNTIME", movieScreen.getMovieDto().getRuntime());
        obj.put("RATED", movieScreen.getMovieDto().getRated());

        obj.put("SCREEN_ID", movieScreen.getScreenDto().getScreenId());
        obj.put("CINEMA", movieScreen.getScreenDto().getCinema());
        obj.put("SCREEN_AT", movieScreen.getScreenDto().getScreenAt().toString());

        System.out.println("moviedetail :" + movieScreen.getMovieDto().getTitle());
        System.out.println(obj.toString());
        resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(obj);

    }


    /**
     * 영화 정보 리스트 (제목+관람가)
     * 
     * @param movieList
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

    /**
     * 영화관 리스트
     * 
     * @param cinemaList
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void sendCinemaList(List<String> cinemaList, HttpServletResponse resp)
            throws ServletException, IOException {

        JSONArray jsonArr = new JSONArray();
        JSONObject obj = null;
        for (int i = 0; i < cinemaList.size(); i++) {

            obj = new JSONObject();
            obj.put("CINEMA", cinemaList.get(i));

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
    @SuppressWarnings("unchecked")
    protected void sendMovieScreenList(List<MovieScreenDto> movieScreenList,
            HttpServletResponse resp) throws ServletException, IOException {

        JSONArray jsonArr = new JSONArray();
        JSONObject obj = null;
        for (int i = 0; i < movieScreenList.size(); i++) {

            obj = new JSONObject();
            MovieScreenDto movieScreen = movieScreenList.get(i);
            obj.put("SCREEN_ID", movieScreen.getScreenDto().getScreenId());
            obj.put("MOVIE_ID", movieScreen.getMovieDto().getMovieId());
            obj.put("SCREEN_AT", movieScreen.getScreenDto().getScreenAt().toString());
            obj.put("CINEMA", movieScreen.getScreenDto().getCinema());

            obj.put("TITLE", movieScreen.getMovieDto().getTitle());
            obj.put("RATED", movieScreen.getMovieDto().getRated());

            System.out.println(movieScreen.getScreenDto().getCinema());
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

