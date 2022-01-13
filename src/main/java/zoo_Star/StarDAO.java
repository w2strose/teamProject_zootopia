package zoo_Star;

import java.beans.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class StarDAO{
	
	
	private static StarDAO instance = null;
	
	public StarDAO() {
		// TODO Auto-generated constructor stub
	}
	public static StarDAO getinstance(){
	      
	      if(instance == null) {
	         synchronized (StarDAO.class) {
	            instance = new StarDAO();
	         }
	      }
	      return instance;
	   }
	
	public StarListVO getStar(String r_number)
	{
		Connection con = null; 			
		PreparedStatement pstmt = null	; 
		ResultSet rs = null;	
		StarListVO listStar = new StarListVO();
		String sql ="";
		
		try {
			con = ConnUtil.getConnection();	// DB占쎌삂 占쎈염野껓옙
			
			sql = "select * from zoo_star where r_number = ?";
			
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1,r_number);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				listStar.setS_title(rs.getString("s_title"));
				listStar.setS_star(rs.getDouble("s_star"));
				listStar.setS_coment(rs.getString("s_coment"));

			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		return listStar;
	}
	
	
	public void insertStar(String id, int r_number, String title, double star, String coment ) {
		
		Connection con = null; 			// DB占쎌삂 占쎈염野껓옙 占쎌뵥占쎄숲占쎈읂占쎌뵠占쎈뮞
		PreparedStatement pstmt = null	; // DB占쎈퓠 占쎌뿯占쎌젾占쎈릭疫꿸퀣�맄占쎈립 占쎌뵥占쎄숲占쎈읂占쎌뵠占쎈뮞
		//ResultSet rs = null;	// DB占쎈퓠占쎄퐣 �빊�뮆�젾占쎈퉸占쎄땋 占쎈�믭옙�뵠�뇡遺우뱽 占쏙옙占쎌삢占쎈릭占쎈뮉 占쎄깻占쎌삋占쎈뮞
		String sql ="";
		try {
			con = ConnUtil.getConnection();	// DB占쎌삂 占쎈염野껓옙
			
			sql = "insert into zoo_star values(?,?,star_seq.nextval,?,?,sysdate,?)";
			
			//StarVO vo = new StarVO();
		    
			
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1,id);
			pstmt.setInt(2, r_number);
			pstmt.setString(3, title);
			pstmt.setDouble(4,star);
			pstmt.setString(5,coment);

			pstmt.executeUpdate();
	
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		
	}
  
	
	public ArrayList<StarListVO> listBk(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StarListVO> listBk = null;
		
		try {
			
			con = ConnUtil.getConnection();
			
			String sql = "select * from zoo_star where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				listBk = new ArrayList<StarListVO>();
				
				do
				{
					listBk.add(new StarListVO(rs.getString("id"), rs.getInt("r_number"),
							rs.getInt("s_number"), rs.getString("s_title"),
							rs.getDouble("s_star"), rs.getString("s_regdate"),
							rs.getString("s_coment")));
					
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

	public double AvgStar()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double result = 0.0;
		
		try {
			
			con = ConnUtil.getConnection();
			
			String sql = "select ROUND(AVG(s_star),1) from zoo_star";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = rs.getDouble(1);	
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		return result;
	}
	
	public int updateStar(String r_number, String s_title, String s_star, String s_coment)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			
			con = ConnUtil.getConnection();
			String sql = "update zoo_star set s_title=?, s_star=?, s_coment=? where r_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, s_title);
			pstmt.setString(2, s_star);
			pstmt.setString(3, s_coment);
			pstmt.setString(4, r_number);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = 1;
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		
		return result;
	}
	public int deleteStar(String r_number)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			
			con = ConnUtil.getConnection();
			String sql = "delete from zoo_star where r_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r_number);
			
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				result = 1;
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}
		
		
		return result;
	}
}
