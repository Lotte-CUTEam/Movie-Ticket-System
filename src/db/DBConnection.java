//DBConnection.java
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import util.PropertyParser;

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
