package dao;


import db.DBConnection;
import dto.MovieDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀   명]CUTEam
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       권나연         신규생성
 * -----------------------------------------------------------
 */

public class MovieDao {

    private static MovieDao dao = new MovieDao();

    private MovieDao() {
        DBConnection.initConnection();
    }

    public static MovieDao getInstance() {
        return dao;
    }


    // TODO [영화 리스트] 모든 영화 리스트 출력 TOP5, Pagination, Filter
    public List<MovieDto> getMovies() {

        String sql = " SELECT movie_id, title, rating, image_url, rated "
                    + " FROM MOVIE ";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            )
        {
            System.out.println("[MovieDao] getMovies: success db connection. ");

            try (
                ResultSet rs = psmt.executeQuery();
                )
            {
                List<MovieDto> list = new ArrayList<>();
                while (rs.next()) {
                    System.out.println("[MovieDao] getMovies: success get movie from db. ");
                    MovieDto dto = new MovieDto(rs.getLong(1),
                                                rs.getString(2),
                                                rs.getString(3),
                                                rs.getString(4),
                                                rs.getInt(5));
                    list.add(dto);
                }
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovies: fail get movies. ");

        return null;
    }

    public MovieDto getMovie(Long movieId) {

        String sql = " SELECT movie_id, title, director, actor, opening_date, rating, runtime, "
                    + " image_url, genre, rated "
                    + " FROM MOVIE "
                    + " WHERE movie_id=?";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
            )
        {
            System.out.println("[MovieDao] getMovie: success db connection. ");
            psmt.setLong(1, movieId);
            try (
                ResultSet rs = psmt.executeQuery();
            )
            {
                if (rs.next()) {
                    System.out.println("[MovieDao] getMovie: success get movie from db. ");

                    int i = 1;
                    MovieDto movieDto = new MovieDto(rs.getLong(i++),
                        rs.getString(i++),
                        rs.getString(i++),
                        rs.getString(i++),
                        rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getString(i++),
                        rs.getInt(i++),
                        rs.getString(i++),
                        rs.getString(i++),
                        rs.getInt(i++));

                    return movieDto;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovie: fail get movie. ");

        return null;
    }

    public List<MovieDto> getMovieNames() {

        String sql = " SELECT movie_id, title "
                    + " FROM MOVIE ";

        try (
            Connection conn = DBConnection.getConnection();
            PreparedStatement psmt = conn.prepareStatement(sql);
        )
        {
            System.out.println("[MovieDao] getMovieNames: success db connection. ");

            try (
                ResultSet rs = psmt.executeQuery();
            )
            {
                List<MovieDto> list = new ArrayList<>();
                while (rs.next()) {
                    System.out.println("[MovieDao] getMovieNames: success get movie from db. ");

                    MovieDto movieDto = new MovieDto(rs.getLong(1),
                                                    rs.getString(2));

                    list.add(movieDto);
                }

                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("[MovieDao] getMovieNames: fail get movie names. ");


        return null;
    }

}
