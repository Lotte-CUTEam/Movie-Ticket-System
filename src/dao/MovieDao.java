package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.DBConnection;
import dto.MovieDto;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]MovieDao.java
 * -----------------------------------------------------------
 * 수정일자         수정자         수정내용
 * 2022.07.08     권나연         신규생성
 * -----------------------------------------------------------
 */

public class MovieDao {

    private static MovieDao dao = new MovieDao();

    public static final int PAGE_CONTENT_COUNT = 8;

    private MovieDao() {
        DBConnection.initConnection();
    }

    public static MovieDao getInstance() {
        return dao;
    }

    /* 전체 영화 리스트 */
    public List<MovieDto> getMovies() {
        String sql = " SELECT movie_id, title, rating, image_url, rated " + " FROM MOVIE";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            System.out.println("[MovieDao] getMovies: success db connection. ");

            try (ResultSet rs = psmt.executeQuery();) {
                List<MovieDto> list = new ArrayList<>();
                while (rs.next()) {
                    MovieDto dto = new MovieDto(rs.getLong(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getInt(5));
                    list.add(dto);
                }
                System.out.println("[MovieDao] getMovies: success get movie from db. ");
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovies: fail get movies. ");

        return null;
    }

    /* 페이지 영화 리스트 */
    public List<MovieDto> getMovies(String searchCategory, String search, Integer pageNo,
            String filter) {
        System.out.println(
                String.format("[MovieDao] info: page no = %d, filter = %s", pageNo, filter));

        String sql = " SELECT movie_id, title, rating, image_url, rated "
                + " FROM (SELECT ROW_NUMBER() ";

        // 필터 파라미터 적용
        switch (filter) {
            case "": // filter == ""
            case "rating":
                sql += " OVER(ORDER BY rating DESC) ";
                break;

            case "opening_date":
                sql += " OVER(ORDER BY opening_date DESC) ";
                break;
        }
        System.out.println(sql);
        sql += " AS rnum, movie_id, title, rating, image_url, rated " + "      FROM MOVIE ";

        // 검색 파라미터 적용
        String sCondition = "";
        switch (searchCategory) {
            case "title":
                sCondition = " WHERE title LIKE '%" + search + "%' ";
                break;

            case "director":
                sCondition = " WHERE director LIKE '%" + search + "%' ";
                break;

            case "actor":
                sCondition = " WHERE actor LIKE '%" + search + "%' ";
                break;
        }
        sql += sCondition;
        sql += ") row_num_tb ";
        sql += " WHERE rnum BETWEEN ? AND ? ";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            int pageStartNo = 1 + PAGE_CONTENT_COUNT * pageNo;
            int pageEndNo = PAGE_CONTENT_COUNT + PAGE_CONTENT_COUNT * pageNo;

            psmt.setInt(1, pageStartNo);
            psmt.setInt(2, pageEndNo);

            System.out.println("[MovieDao] getMovies: success db connection. ");

            try (ResultSet rs = psmt.executeQuery();) {
                List<MovieDto> list = new ArrayList<>();
                while (rs.next()) {
                    MovieDto dto = new MovieDto(rs.getLong(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getInt(5));
                    list.add(dto);
                }
                System.out.println("[MovieDao] getMovies: success get movie from db. ");
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovies: fail get movies. ");

        return null;
    }

    public Integer getMovieCount() {

        String sql = " SELECT COUNT(*) FROM MOVIE ";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            System.out.println("[MovieDao] getMovieCount: success db connection. ");

            try (ResultSet rs = psmt.executeQuery();) {
                if (rs.next()) {
                    System.out
                            .println("[MovieDao] getMovieCount: success get movie count from db. ");
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovieCount: fail get movie count. ");
        return null;
    }

    /* 영화 */
    public MovieDto getMovie(Long movieId) {

        String sql = " SELECT movie_id, title, director, actor, opening_date, rating, runtime, "
                + " image_url, genre, rated " + " FROM MOVIE " + " WHERE movie_id=?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            System.out.println("[MovieDao] getMovie: success db connection. ");
            psmt.setLong(1, movieId);
            try (ResultSet rs = psmt.executeQuery();) {
                if (rs.next()) {
                    System.out.println("[MovieDao] getMovie: success get movie from db. ");

                    int i = 1;
                    MovieDto movieDto = new MovieDto(rs.getLong(i++), rs.getString(i++),
                            rs.getString(i++), rs.getString(i++),
                            rs.getTimestamp(i++).toLocalDateTime(), rs.getString(i++),
                            rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++));

                    return movieDto;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovie: fail get movie. ");

        return null;
    }

    /* 영화 이름 리스트 */
    public List<MovieDto> getMovieNames() {

        String sql = " SELECT movie_id, title " + " FROM MOVIE ";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            System.out.println("[MovieDao] getMovieNames: success db connection. ");

            try (ResultSet rs = psmt.executeQuery();) {
                List<MovieDto> list = new ArrayList<>();
                while (rs.next()) {
                    MovieDto movieDto = new MovieDto(rs.getLong(1), rs.getString(2));

                    list.add(movieDto);
                }

                System.out.println("[MovieDao] getMovieNames: success get movie from db. ");

                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovieNames: fail get movie names. ");


        return null;
    }

    /* 영화 평점 TOP5 리스트 */
    public List<MovieDto> getMoviesScreeningRatingTop5() {

        String sql = " SELECT movie_id, title, rating, image_url, rated " + "FROM ("
                + "         SELECT *, RANK() OVER (ORDER BY rating DESC) " + "         FROM MOVIE "
                + "      ) rating_rank " + "LIMIT 5";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            System.out.println("[MovieDao] getMoviesScreeningRatingTop5: success db connection. ");

            try (ResultSet rs = psmt.executeQuery()) {
                List<MovieDto> list = new ArrayList<>();

                while (rs.next()) {
                    MovieDto dto = new MovieDto(rs.getLong(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getInt(5));

                    list.add(dto);
                }
                System.out.println("[MovieDao] getMoviesScreeningRatingTop5: success get movies.");

                return list;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMoviesScreeningRatingTop5: fail get movies.");

        return null;
    }

    /* 영화 최신작 TOP5 리스트 */
    public List<MovieDto> getMoviesLatestScreeningTop5() {

        String sql = " SELECT movie_id, title, rating, image_url, rated " + " FROM ("
                + "         SELECT *, RANK() OVER (ORDER BY opening_date DESC) "
                + "         FROM MOVIE" + "     ) opening_date_rank " + " LIMIT 5 ";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement psmt = conn.prepareStatement(sql);) {
            System.out.println("[MovieDao] getMoviesLatestScreeningTop5: success db connection. ");

            try (ResultSet rs = psmt.executeQuery()) {
                List<MovieDto> list = new ArrayList<>();

                while (rs.next()) {
                    MovieDto dto = new MovieDto(rs.getLong(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getInt(5));

                    list.add(dto);
                }
                System.out.println("[MovieDao] getMoviesLatestScreeningTop5: success get movies.");

                return list;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMoviesLatestScreeningTop5: fail get movies.");

        return null;
    }
}
