package zoo_Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class Zoo_ReservationDAO {

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
	
	
	public void reservationSearch(int year, int month, int day) {
		
		Connection con = null;
		PreparedStatement pstmt = null; // 바인딩변수
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String strQuery = "select * from zoomember where id=?";
			pstmt = con.prepareStatement(strQuery);
			//pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {// 아이디에 해당하는 회원이 존재한다면 
				/*vo = new zoomemberVO();
				vo.setId(rs.getString("id"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setPhone1(rs.getString("phone1"));
				vo.setPhone2(rs.getString("phone2"));
				vo.setPhone3(rs.getString("phone3"));
				vo.setEmail(rs.getString("email"));
				vo.setBirth(rs.getString("birth"));*/
			}// end of if
			
		}catch(Exception e) {	}
		
	}
}
