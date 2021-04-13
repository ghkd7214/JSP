package kr.co.farmstory2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {

	// 싱글톤 객체
	private static DBConfig instance = new DBConfig();
	private DBConfig() {}

	public static DBConfig getInstance() {
		return instance;
	}

	// DB 정보
	private final String HOST ="jdbc:mysql://192.168.10.114:3306/ljh";
	private final String USER ="ljh";
	private final String PASS ="1234";

	public Connection getConnection() throws Exception {
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
