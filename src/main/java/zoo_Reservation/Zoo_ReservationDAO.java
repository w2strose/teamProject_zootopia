package zoo_Reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import zoo_Reservation.Zoo_OperationVO;
import zoo_Reservation.Zoo_ReservationVO;

public class Zoo_ReservationDAO {

	private Connection getConnection() {// DBCP 
		
		Connection con = null;
		
		try {
			InitialContext ctx = new InitialContext();	
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/orcl");
			con = ds.getConnection();
		}catch(Exception e) {
			System.out.println("Connection 실패");
		}
		return con;

	}
	
	
	public List<Zoo_OperationVO> operationSearch(int year, int month, int day) {
		
		Connection con = null;
		PreparedStatement pstmt = null; // 바인딩변수
		ResultSet rs = null;
		Zoo_OperationVO vo = null;
		List<Zoo_OperationVO> voList = new ArrayList<Zoo_OperationVO>();
		
		try {
			con = getConnection();
			
			String strQuery = "select * from zoo_operation where o_date=?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, year+"-"+month+"-"+day);
			rs = pstmt.executeQuery();
					
			while(rs.next()) {// 아이디에 해당하는 회원이 존재한다면 
				vo = new Zoo_OperationVO();
				vo.setH_number(rs.getInt("h_number"));
				vo.setO_number(rs.getInt("o_number"));
				vo.setO_type(rs.getString("o_type"));
				vo.setO_date(rs.getString("o_date"));
				vo.setO_charge(rs.getString("o_charge"));
				vo.setO_ok(rs.getString("o_ok"));
			
				voList.add(vo);
			}// end of if
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		return voList;
	}
	
	public void insertResrvation(Zoo_ReservationVO vo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "";
		try {
			con = getConnection();
			sql = "insert into Zoo_reservation(id, o_number, r_number, r_date, r_member) values(?,?,board_seq.nextval,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getO_number());
			pstmt.setString(3, vo.getR_date());
			pstmt.setInt(4, vo.getR_member());
			
			pstmt.executeUpdate();
			
		}catch(Exception se) {
			System.out.println("Exception"+se);
		}finally {
			if(con!=null)try {con.close();}catch(SQLException s2) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s3) {}
			if(rs!=null)try {rs.close();}catch(SQLException s1) {}
		}
	
	}
	
	public void updateOK(Zoo_OperationVO vo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con=getConnection();
			sql="update zoo_operation set o_ok=0 where o_number=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, vo.getO_number());
			pstmt.executeUpdate();
			
			
			
		}catch(Exception se) {
			System.out.println("Exception"+se);
		}finally {
			if(con!=null)try {con.close();}catch(SQLException s2) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s3) {}
			if(rs!=null)try {rs.close();}catch(SQLException s1) {}
		}
	}
	
	public void insertOperation(Zoo_OperationVO vo) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement("insert into zoo_operation(H_number, O_number, O_type, O_date, O_charge, O_ok) values(?, operation_seq.nextval, ?, ?, ?, 1)");
			pstmt.setInt(1, vo.getH_number());
			pstmt.setString(2, vo.getO_type());
			pstmt.setString(3, vo.getO_date());
			pstmt.setString(4, vo.getO_charge());
			
			pstmt.executeUpdate();
			
			
			
		}catch(Exception se) {
			System.out.println("Exception"+se);
		}finally {
			if(con!=null)try {con.close();}catch(SQLException s2) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s3) {}
			if(rs!=null)try {rs.close();}catch(SQLException s1) {}
		}
	}
	
	
}
