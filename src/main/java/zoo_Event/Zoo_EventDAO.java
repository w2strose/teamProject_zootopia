package zoo_Event;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Zoo_EventDAO {

	// 디비 연결 함수
	private Connection getConnection() {// DBCP 
				
		Connection con = null;
				
		try {
			InitialContext ctx = new InitialContext();	
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
			con = ds.getConnection();
			
			}catch(Exception e) {
				System.out.println("Connection 실패");
			}
		
			return con;

		}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
