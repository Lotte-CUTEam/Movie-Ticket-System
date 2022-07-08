package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao {

  private static MemberDao dao = new MemberDao();

  private MemberDao() {
    DBConnection.initConnection();
  }

  public static MemberDao getInstance() {
    return dao;
  }

  public boolean addMember(MemberDto dto) {

    String sql = " insert into member(id, pwd, name, email) " + "	   values(?, ?, ?, ?, 3) ";

    Connection conn = null;
    PreparedStatement psmt = null;
    int count = 0;

    try {
      conn = DBConnection.getConnection();

      psmt = conn.prepareStatement(sql);
      psmt.setInt(1, dto.getId());
      psmt.setString(2, dto.getPwd());
      psmt.setString(3, dto.getName());
      psmt.setString(4, dto.getEmail());

      count = psmt.executeUpdate();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      DBClose.close(conn, psmt, null);
    }

    return count > 0 ? true : false;
  }

  public boolean getId(String id) {

    String sql = " SELECT ID " + " FROM MEMBER " + " WHERE ID=? ";
    /*
     * String sql = " SELECT COUNT(*) " + " FROM MEMBER " + " WHERE ID=? ";
     */

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

  public MemberDto login(MemberDto dto) {
    String sql = " select id, name, email, auth " + " from member " + " where id=? and pwd=? ";

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    MemberDto mem = null;

    try {
      conn = DBConnection.getConnection();
      System.out.println("1/3 login success");

      psmt = conn.prepareStatement(sql);
      psmt.setInt(1, dto.getId());
      psmt.setString(2, dto.getPwd());

      rs = psmt.executeQuery();
      System.out.println("2/3 login success");

      if (rs.next()) {
        int id = rs.getInt(1);
        String name = rs.getString(2);
        String email = rs.getString(3);
        mem = new MemberDto(id, null, name, email);
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


