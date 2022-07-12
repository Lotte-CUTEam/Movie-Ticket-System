// DBClose.java
package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]DBClose.java
 * -----------------------------------------------------------
 * 수정일자           수정자       수정내용
 * 2022.07.07       정은우       신규생성
 * -----------------------------------------------------------
 */
public class DBClose {
	public static void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
		try {
			if (conn != null) {
				conn.close();
			}

			if (psmt != null) {
				psmt.close();
			}

			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
