package models;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {
	public static Connection getConnect() {
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/db_tintuc";
            Connection conn = DriverManager.getConnection(url, "root", "");
			if (conn != null) {
				return conn;
			} else {
				System.out.println("Ket noi that bai");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void closeConnect(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
