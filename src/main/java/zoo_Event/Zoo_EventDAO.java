package zoo_Event;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Zoo_EventDAO {

	// ��� ���� �Լ�
	private Connection getConnection() {// DBCP 
				
		Connection con = null;
				
		try {
			InitialContext ctx = new InitialContext();	
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
			con = ds.getConnection();
			
			}catch(Exception e) {
				System.out.println("Connection ����");
			}
		
			return con;

		}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
