package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	String url = "jdbc:mysql://localhost:3306/shoppingdb";
    String user = "root";
    String password = "123456";
	
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, user, password);
	}
}
