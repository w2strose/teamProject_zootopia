package zoo_Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import zoo_Reservation.Zoo_OperationVO;

public class Zoo_ReservationDAO {

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
	
	
	public Zoo_OperationVO operationSearch(int year, int month, int day) {
		
		Connection con = null;
		PreparedStatement pstmt = null; // ���ε�����
		ResultSet rs = null;
		Zoo_OperationVO vo = null;
		
		
		try {
			con = getConnection();
			
			String strQuery = "select * from zoo_operation where o_date=?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, year+"-"+month+"-"+day);
			rs = pstmt.executeQuery();
					
			if(rs.next()) {// ���̵� �ش��ϴ� ȸ���� �����Ѵٸ� 
				vo = new Zoo_OperationVO();
				vo.setH_number(rs.getInt("h_number"));
				vo.setO_number(rs.getInt("o_number"));
				vo.setO_type(rs.getString("o_type"));
				vo.setO_date(rs.getString("o_date"));
				vo.setO_charge(rs.getString("o_charge"));
				vo.setO_ok(rs.getString("o_ok"));
			
			}// end of if
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		return vo;
	}
}
