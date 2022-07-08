package dao;


import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * [프로젝트]롯데e커머스_자바전문가과정 
 * [시스템명]영화예매시스템 
 * [팀 명]CUTEam
 * ----------------------------------------------------------- 
 * 수정일자 수정자 수정내용 2022.07.08 이충현 신규생성
 * -----------------------------------------------------------
 */
public class MemberDao {

  private static MemberDao dao = new MemberDao();

  /**
   * 디비 연결 및 실글톤
   */
  private MemberDao() {
    DBConnection.initConnection();
  }

  /**
   * member dao 객체 반환
   * 
   * @return dao
   */
  public static MemberDao getInstance() {
    return dao;
  }

  /**
   * 맴버 추가
   * 
   * @param dto
   * @return boolean
   */
  public boolean addMember(MemberDto dto) {

    String sql = " insert into member(member_id,pwd, name, email,  phone_number,created_at) "
        + "	   values(?, ?, ?, ?, ?, now() ) ";

    Connection conn = null;
    PreparedStatement psmt = null;
    int count = 0;

    try {
      conn = DBConnection.getConnection();

      psmt = conn.prepareStatement(sql);
      psmt.setString(1, dto.getId());
      psmt.setString(2, dto.getPwd());
      psmt.setString(3, dto.getName());
      psmt.setString(4, dto.getEmail());
      psmt.setString(5, dto.getPhoneNumber());

      count = psmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      DBClose.close(conn, psmt, null);
    }

    return count > 0 ? true : false;
  }

  /**
   * 아이디 검색
   * 
   * @param id
   * @return boolean
   */
  public boolean getId(String id) {

    String sql = " SELECT member_id " + " FROM MEMBER " + " WHERE member_id=? ";

    Connection conn = null; // DB 연결
    PreparedStatement psmt = null; // Query문을 실행
    ResultSet rs = null; // 결과 취득

    boolean findId = false;

    try {
      conn = DBConnection.getConnection();

      psmt = conn.prepareStatement(sql);
      psmt.setString(1, id);

      rs = psmt.executeQuery();
      if (rs.next()) {
        findId = true;
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      DBClose.close(conn, psmt, rs);
    }

    return findId;
  }

  /**
   * 로그인
   * 
   * @param dto
   * @return MemberDto
   */
  public MemberDto login(MemberDto dto) {
    String sql = " select member_id, name, email, pwd, phone_number " + " from member "
        + " where member_id=? and pwd=? ";

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    MemberDto mem = null;

    try {
      conn = DBConnection.getConnection();
      System.out.println("1/3 login success");

      psmt = conn.prepareStatement(sql);
      psmt.setString(1, dto.getId());
      psmt.setString(2, dto.getPwd());

      rs = psmt.executeQuery();
      System.out.println("2/3 login success");

      if (rs.next()) {
        String id = rs.getString(1);
        String name = rs.getString(2);
        String email = rs.getString(3);
        String phoneNumber = rs.getString(4);

        mem = new MemberDto(id, null, name, email, phoneNumber);
      }
      System.out.println("3/3 login success");

    } catch (SQLException e) {
      System.out.println("login fail");
    } finally {
      DBClose.close(conn, psmt, rs);
    }

    return mem;
  }
}


