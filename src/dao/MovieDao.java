package dao;


import db.DBConnection;
import dto.MovieDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

    private MovieDao() { }

    public static MovieDao getInstance() {
        return dao;
    }


    /***
     * 영화 상세정보 조회 메소드
     * @param movieId
     */
    public MovieDto getMovie(Long movieId) {

        String sql = " select movie_id, title, director, actor, opening_date, rating, runtime, "
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


}
