package zoo_Hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import zoo_Breakdown.ConnUtil;
import zoo_Breakdown.Zoo_breakdownDAO;
import zoo_Breakdown.Zoo_breakdownVO;

public class zoo_HotelDAO {
	
	private static zoo_HotelDAO instance = null;
	
	public zoo_HotelDAO() {
		// TODO Auto-generated constructor stub
	}

	public static zoo_HotelDAO getinstance(){
			
			if(instance == null) {
				synchronized (Zoo_breakdownDAO.class) {
					instance = new zoo_HotelDAO();
				}
			}
			return instance;
		}
	
	
	public ArrayList<zoo_HotelVO> listHt(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<zoo_HotelVO> listBk = null;
		
		try {
			
			con = ConnUtil.getConnection();
			
			String sql = "select * from zoo_hotel where h_number = ?";
			System.out.println(id);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				listBk = new ArrayList<zoo_HotelVO>();
				
				do
				{
					listBk.add(new zoo_HotelVO(rs.getInt("h_number"),
							rs.getString("h_name"), rs.getString("h_phone1"),
							rs.getString("h_phone2"),rs.getString("h_phone3"),
							rs.getString("h_postnum"),rs.getString("h_address"),
							rs.getString("h_coment"),rs.getString("h_jibunaddress"),
							rs.getString("h_roomnumber")));
							
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
