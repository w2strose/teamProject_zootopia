package zoo_Star;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ConnUtil {
	
	private static DataSource ds;

	   static {

	      try {

	         InitialContext ctx = new InitialContext();   
	         ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");

	      }catch(NamingException e) {
	         e.printStackTrace();
	      }
	   }
	   
	   public static Connection getConnection() throws SQLException{
	      return ds.getConnection();
	   }

	
	
}
