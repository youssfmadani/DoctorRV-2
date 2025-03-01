package conn.db;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBconnect {
 public static Connection getConn()
 {
	 Connection con = null;
	 String username = "root";
	 String password = "admin";

	 String url =
			 "jdbc:mysql://localhost:3306/onlinehospital?allowPublicKeyRetrieval=true&useSSL=false";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			System.out.println("La connection avec la base de donn�e est �tablie.");
		} catch (Exception e) {
			System.out.print("D�sol� ! la connection � la base de donn�e n'est pas �tablie");
		}
		return con ;
	

 }
}
