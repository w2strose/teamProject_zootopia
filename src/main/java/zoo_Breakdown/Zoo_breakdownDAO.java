package zoo_Breakdown;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import zoo_Event.Zoo_EventDAO;

public class Zoo_breakdownDAO {

private static Zoo_breakdownDAO instance = null;
	
public Zoo_breakdownDAO() {
	// TODO Auto-generated constructor stub
}

public static Zoo_breakdownDAO getinstance(){
		
		if(instance == null) {
			synchronized (Zoo_breakdownDAO.class) {
				instance = new Zoo_breakdownDAO();
			}
		}
		return instance;
	}
	
	public boolean listBkSet(String id, int number)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean coment = false;
		
		try {
			
			con = ConnUtil.getConnection();
			
			String sql = "select H.id,H.h_name,O.o_type, O.o_charge,R.r_date,R.r_member,R.r_number,S.s_coment from zoo_star S,zoo_hotel H,zoo_operation O,zoo_reservation R "
					+ "where H.id=? and O.o_number = r.o_number and s.r_number = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, number);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString("s_coment") != null)
				{
					coment = true;
				}
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		return coment;
	}
	
	
	public ArrayList<Zoo_breakdownVO> listBk(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Zoo_breakdownVO> listBk = null;
		
		try {
			
			con = ConnUtil.getConnection();
			
			String sql = "select H.id,H.h_name,O.o_type, O.o_charge,R.r_date,R.r_member,R.r_number from zoo_hotel H,zoo_operation O,zoo_reservation R "
					+ "where H.id=? and O.o_number = r.o_number";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				listBk = new ArrayList<Zoo_breakdownVO>();
				
				do
				{
					listBk.add(new Zoo_breakdownVO(rs.getString("id"),
							rs.getString("h_name"),rs.getString("o_type"),
							rs.getString("o_charge"), rs.getString("r_date"),
							rs.getInt("r_member"),rs.getInt("r_number")));
				}while(rs.next());
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		return listBk;
	}
	

	
}
