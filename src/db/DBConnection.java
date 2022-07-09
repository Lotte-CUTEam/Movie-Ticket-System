//DBConnection.java
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
		String url = "jdbc:mysql://localhost:3306/mydb";
		String user = "root";
		String password = "1234";
		
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
