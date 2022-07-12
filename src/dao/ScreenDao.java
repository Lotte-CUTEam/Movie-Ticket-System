package dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import db.DBClose;
import db.DBConnection;
import dto.MovieDto;
import dto.MovieScreenDto;
import dto.ScreenDto;


/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]ScreenDao.java
 * -----------------------------------------------------------
 * 수정일자           수정자        수정내용
 * 2022.07.08       장혜원        신규생성
 * -----------------------------------------------------------
 */

//

public class ScreenDao {


    private static ScreenDao dao = new ScreenDao();

    public ScreenDao() {
        db.DBConnection.initConnection();
    }

    public static ScreenDao getInstance() {
        return dao;
    }

    /**
     * 영화관 리스트 리턴
     * 
     * @return List<String>
     */
    public List<String> getCinemaList() {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        String sql = "select  SUBSTRING_INDEX(cinema, '-', -1) AS LOCATION from screen \n"
                + "GROUP BY SUBSTRING_INDEX(cinema, '-', -1)\n"
                + "ORDER BY SUBSTRING_INDEX(cinema, '-', -1);";

        List<String> CinemaList = new ArrayList<String>();

        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();


            while (rs.next()) {
                CinemaList.add(rs.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return CinemaList;
    }



    /**
     * 지역에따른 영화관 리스트
     * 
     * @param location
     * @return
     */
    public List<String> getCinemaList(String location) {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        if (location == null || location.equals("")) {
            location = "서울";
        }

        String sql = "select  SUBSTRING_INDEX(cinema, '-', -1) AS LOCATION from screen \n"
                + "where  SUBSTRING_INDEX(cinema, '-', 1) = '" + location.trim() + "' \n"
                + "GROUP BY SUBSTRING_INDEX(cinema, '-', -1)\n"
                + "ORDER BY SUBSTRING_INDEX(cinema, '-', -1);";



        List<String> CinemaList = new ArrayList<String>();
        String cinema = "";
        try {
            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);

            rs = psmt.executeQuery();


            while (rs.next()) {
                cinema = rs.getString(1);
                CinemaList.add(cinema);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return CinemaList;
    }



    /**
     * 현재 날짜 기준으로 7일 이내의 모든 상영 타임 테이블 조회
     * 
     * @return getMovieScreenList
     */
    public List<MovieScreenDto> getMovieScreenList() {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        String sql = " select s.screen_id, s.movie_id, s.screen_at, s.cinema, \n"
                + "        m.movie_id, m.title, m.director, m.actor, m.opening_date, m.rating, m.runtime, m.image_url, m.genre, m.rated \n"
                + "  from screen s, movie m \n" + " where m.movie_id = s.movie_id\r\n"
                + "   and s.screen_at > now() and s.screen_at < DATE_ADD(NOW(), INTERVAL 7 DAY); \n"
                + " ";

        List<MovieScreenDto> getMovieScreenList = new ArrayList<MovieScreenDto>();

        MovieDto movieDto = null;
        ScreenDto screenDto = null;

        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();


            while (rs.next()) {
                int i = 1;
                screenDto = new ScreenDto(rs.getLong(i++), rs.getLong(i++),
                        rs.getTimestamp(i++).toLocalDateTime(), rs.getString(i++));
                movieDto = new MovieDto(rs.getLong(i++), rs.getString(i++), rs.getString(i++),
                        rs.getString(i++), rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++),
                        rs.getInt(i++));

                getMovieScreenList.add(new MovieScreenDto(movieDto, screenDto));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return getMovieScreenList;
    }



    public List<String> getScreenMovieNameList(String inputDate) {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        String sql = "select m.title\n" + "  from screen s, movie m \n"
                + " where m.movie_id = s.movie_id \n"
                + "  and DATE_FORMAT(s.screen_at, '%Y%m%d') = ? \n" + " group by m.title;";


        // 선택날짜 (없는 경우 오늘을 기준으로 조회)
        if (inputDate == null || inputDate.equals("")) {
            inputDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        }
        if (inputDate.length() != 8) {
            inputDate = inputDate.replace("-", "");
        }
        List<String> getScreenMovieNameList = new ArrayList<String>();

        MovieDto movieDto = null;
        ScreenDto screenDto = null;

        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, inputDate);
            rs = psmt.executeQuery();


            while (rs.next()) {
                int i = 1;
                getScreenMovieNameList.add(rs.getString(i++));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return getScreenMovieNameList;
    }

    /**
     * 영화관, 영화, 선택날짜에 따른 조회
     * 
     * @param cinema
     * @param movieId
     * @param inputDate
     * @return
     */
    public List<MovieScreenDto> getMovieScreenList(String cinema, int movieId, String inputDate) {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;


        // 동적 파라미터 조건절
        String whereConditionWord = "";

        // 영화관 (없는 경우 디폴트 영화관 조회)
        if (cinema == null || cinema.equals("")) {
            cinema = "서울-월드타워";
        }
        whereConditionWord = " and s.cinema ='" + cinema + "'\n";

        // 영화 (없는 경우 디폴트 영화 조회)
        if (movieId < 1) {
            movieId = 1;
        }
        whereConditionWord += " and s.movie_id =" + movieId + "\n";

        // 선택날짜 (없는 경우 오늘을 기준으로 조회)
        if (inputDate == null || inputDate.equals("")) {
            inputDate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        }

        if (inputDate.length() != 8) {
            inputDate = inputDate.replace("-", "");
        }

        // whereConditionWord += " and DATE_FORMAT(screen_at, '%Y%m%d') = " + inputDate + "\n";

        String sql = " select s.screen_id, s.movie_id, s.screen_at, s.cinema, \n"
                + "        m.movie_id, m.title, m.director, m.actor, m.opening_date, m.rating, m.runtime, m.image_url, m.genre, m.rated \n"
                + "  from screen s, movie m \n" + " where m.movie_id = s.movie_id\r\n"
                + whereConditionWord + "; ";

        List<MovieScreenDto> getMovieScreenList = new ArrayList<MovieScreenDto>();

        MovieDto movieDto = null;
        ScreenDto screenDto = null;

        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();


            while (rs.next()) {
                int i = 1;
                screenDto = new ScreenDto(rs.getLong(i++), rs.getLong(i++),
                        rs.getTimestamp(i++).toLocalDateTime(), rs.getString(i++));
                movieDto = new MovieDto(rs.getLong(i++), rs.getString(i++), rs.getString(i++),
                        rs.getString(i++), rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++),
                        rs.getInt(i++));

                // System.out.println(movieDto.getActor());
                getMovieScreenList.add(new MovieScreenDto(movieDto, screenDto));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return getMovieScreenList;
    }


    /**
     * screen_id에 따른 상영정보 + 영화 조회
     * 
     * @param screenId
     * @return
     */
    public MovieScreenDto getMovieScreenDto(long screenId) {
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;


        // 동적 파라미터 조건절
        String whereConditionWord = "";


        // whereConditionWord += " and DATE_FORMAT(screen_at, '%Y%m%d') = " + inputDate + "\n";

        String sql = " select s.screen_id, s.movie_id, s.screen_at, s.cinema, \n"
                + "        m.movie_id, m.title, m.director, m.actor, m.opening_date, m.rating, m.runtime, m.image_url, m.genre, m.rated \n"
                + "  from screen s, movie m \n" + " where m.movie_id = s.movie_id\r\n"
                + "and s.screen_id = ? ";

        MovieScreenDto movieScreen = null;
        ScreenDto screenDto = null;
        MovieDto movieDto = null;

        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setLong(1, screenId);
            rs = psmt.executeQuery();


            if (rs.next()) {
                int i = 1;
                screenDto = new ScreenDto(rs.getLong(i++), rs.getLong(i++),
                        rs.getTimestamp(i++).toLocalDateTime(), rs.getString(i++));
                movieDto = new MovieDto(rs.getLong(i++), rs.getString(i++), rs.getString(i++),
                        rs.getString(i++), rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++),
                        rs.getInt(i++));

                // System.out.println(movieDto.getActor());
                movieScreen = new MovieScreenDto(movieDto, screenDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return movieScreen;
    }
}
