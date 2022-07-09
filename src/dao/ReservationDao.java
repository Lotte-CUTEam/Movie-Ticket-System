package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.DBClose;
import db.DBConnection;
import dto.ReservationDto;



/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀   명]CUTEam
 * 
 * 예매 내역 생성 조회 삭제
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.09      장혜원         신규생성
 * -----------------------------------------------------------
 */ 

public class ReservationDao {

    private static ReservationDao dao = new ReservationDao();

    public ReservationDao() {
        db.DBConnection.initConnection();
    }

    public static ReservationDao getInstance() {
        return dao;
    }


    /**
     * [예매 리스트] 사용자의 예매 내역 출력 (취소 x)
     * 
     * @param id
     * @return
     */
    public List<ReservationDto> getReservations(String id) {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        String sql =
                "select reservation_id, member_id, screen_id, movie_id, screen_at, people_count"
                        + ", cinema, title, runtime, created_at, deleted_at, status \n"
                        + " from reservation \n" + "where member_id = ?";

        List<ReservationDto> ReservationList = new ArrayList<ReservationDto>();


        ReservationDto reservationDto = null;

        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, id);
            rs = psmt.executeQuery();


            while (rs.next()) {
                int i = 1;
                reservationDto = new ReservationDto(rs.getLong(i++), rs.getString(i++),
                        rs.getLong(i++), rs.getLong(i++), rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),
                        rs.getTimestamp(i++).toLocalDateTime(), rs.getTimestamp(i++) == null ? null
                                : rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getInt(i++));

                ReservationList.add(reservationDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return ReservationList;
    }



    /**
     * [예매 리스트] 사용자의 예매 내역 출력 (취소내역 포함)
     * 
     * @param id 사용자ID
     * @param month 이전 n개월 내역만 조회
     * @param status 취소여부
     * @return
     */
    public List<ReservationDto> getReservations(String id, int month, int status) {

        Connection conn = null;
        System.out.println("1/4");
        PreparedStatement psmt = null;
        System.out.println("2/4");

        ResultSet rs = null;

        // 기준 개월수 없는 경우 12개월 이전 내역까지
        int monthsAgo = month < 0 ? 12 : month;
        int delStatus = status;

        String sql =
                "select reservation_id, member_id, screen_id, movie_id, screen_at, people_count"
                        + ", cinema, title, runtime, created_at, deleted_at, status \n"
                        + " from reservation \n" + "where member_id = ? \n"
                        + " and now() > DATE_SUB(created_at, INTERVAL" + monthsAgo + " MONTH)\n"
                        + " and status = " + delStatus;

        List<ReservationDto> ReservationList = new ArrayList<ReservationDto>();
        System.out.println(sql);

        ReservationDto reservationDto = null;

        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, id);


            rs = psmt.executeQuery();

            while (rs.next()) {
                int i = 1;
                reservationDto = new ReservationDto(rs.getLong(i++), rs.getString(i++),
                        rs.getLong(i++), rs.getLong(i++), rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),
                        rs.getTimestamp(i++).toLocalDateTime(), rs.getTimestamp(i++) == null ? null
                                : rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getInt(i++));

                ReservationList.add(reservationDto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return ReservationList;
    }


    /**
     * [예매 상세 조회] 사용자의 예매 상세 내역 출력
     * 
     * @param id
     * @param reservation_id
     * @return
     */
    public ReservationDto getReservation(String id, long reservation_id) {

        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;


        String sql =
                "select reservation_id, member_id, screen_id, movie_id, screen_at, people_count"
                        + ", cinema, title, runtime, created_at, deleted_at, status \n"
                        + " from reservation \n" + "where member_id = ? \n"
                        + "  and reservation_id = ?";

        ReservationDto reservationDto = null;
        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, id);
            psmt.setLong(2, reservation_id);

            rs = psmt.executeQuery();

            if (rs.next()) {
                int i = 1;
                reservationDto = new ReservationDto(rs.getLong(i++) // reservationId
                        , rs.getString(i++) // memberId
                        , rs.getLong(i++) // screenId
                        , rs.getLong(i++), rs.getTimestamp(i++).toLocalDateTime(), rs.getInt(i++),
                        rs.getString(i++), rs.getString(i++), rs.getInt(i++),
                        rs.getTimestamp(i++).toLocalDateTime(), rs.getTimestamp(i++) == null ? null
                                : rs.getTimestamp(i++).toLocalDateTime(),
                        rs.getInt(i++));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, rs);
        }

        return reservationDto;
    }

    
    /**
     * 예매 내역 생성
     * 
     * @param id
     * @param people_count
     * @param screen_id
     * @return
     */
    public int makeReservation(String id, int people_count, long screen_id) {

        Connection conn = null;
        PreparedStatement psmt = null;


        String sql =
                "insert into reservation ( member_id, screen_id, movie_id, screen_at, people_count, cinema, title, runtime, created_at, deleted_at, status) \n"
                        + "select '" + id + "' as member_id, a.screen_id, a.movie_id, a.screen_at, "
                        + people_count
                        + " as people_count, a.cinema, a.title, a.runtime, now() as created_at, null as deleted_at, 0 as status \n"
                        + "from (\n"
                        + "    select s.screen_id, s.movie_id, s.screen_at, s.cinema, m.title, m.runtime\n"
                        + "      from screen s, movie m\n"
                        + "     where s.movie_id = m.movie_id and screen_id = " + screen_id + ") a;"
                        + "";

        int count = 0;
        try {

            conn = DBConnection.getConnection();
            psmt = conn.prepareStatement(sql);


            count = psmt.executeUpdate(sql);


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBClose.close(conn, psmt, null);
        }

        return count;
    }
}
