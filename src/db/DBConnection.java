//DBConnection.java
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import util.PropertyParser;

/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]DBConnection.java
 * -----------------------------------------------------------
 * 수정일자           수정자       수정내용
 * 2022.07.07       정은우       신규생성
 * 2022.07.09		권나연		Local MySQL -> AWS RDS - MySQL로 변경
 * -----------------------------------------------------------
 */
public class DBConnection {
	
	public static void initConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loading Success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		Properties prop = PropertyParser.getInstance().readProperties("../config/db.properties");

		String url = prop.getProperty("db.url");
		String user = prop.getProperty("db.username");
		String password = prop.getProperty("db.password");

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("MySQL connection Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;

	}
}
