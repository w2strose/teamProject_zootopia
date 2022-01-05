package zoo_Event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Zoo_EventDAO {

private static Zoo_EventDAO instance = null;
	
	public Zoo_EventDAO(){}
	
	public static Zoo_EventDAO getinstance(){
		
		if(instance == null) {
			synchronized (Zoo_EventDAO.class) {
				instance = new Zoo_EventDAO();
			}
		}
		return instance;
	}
	
	public void insertEvent(Zoo_EventVO event) {
		Connection con = null;
		PreparedStatement pstmt = null;
	
		try {
			con = ConnUtil.getConnection();
					
			String sql = "insert into Zoo_Event(E_number, E_name, E_content, E_image, E_startDate, E_endDate) values(event_seq.nextval,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, event.getE_name());
			pstmt.setString(2, event.getE_content());
			pstmt.setString(3, event.getE_image());
			pstmt.setString(4, event.getE_startDate());
			pstmt.setString(5, event.getE_endDate());
			pstmt.executeUpdate();
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch
	
	}
	
	public int insertEvent2(Zoo_EventVO event) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int flag=1;
		try {
			con = ConnUtil.getConnection();
					
			String sql = "insert into Zoo_Event(E_number, E_name, E_content, E_image, E_startDate, E_endDate) values(event_seq.nextval,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, event.getE_name());
			pstmt.setString(2, event.getE_content());
			pstmt.setString(3, event.getE_image());
			pstmt.setString(4, event.getE_startDate());
			pstmt.setString(5, event.getE_endDate());
			int result = pstmt.executeUpdate();
			if(result == 1) 
				flag=0;
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch
		return flag;
	}
	
	public int updateEvent(Zoo_EventVO event) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int flag=1;
		try {
			con = ConnUtil.getConnection();
					
			String sql = "update Zoo_Event set E_name=?, E_content=?, E_image=?, E_startDate=?, E_endDate=? where E_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, event.getE_name());
			pstmt.setString(2, event.getE_content());
			pstmt.setString(3, event.getE_image());
			pstmt.setString(4, event.getE_startDate());
			pstmt.setString(5, event.getE_endDate());
			pstmt.setInt(6, event.getE_number());
			int result = pstmt.executeUpdate();
			if(result == 1) 
				flag=0;
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch
		return flag;
	}
	
	

	// ��ü ���� ������ ������ �޼ҵ� �����ϱ�
	public int getEventCount() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
	
		try {
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement("select count(*) from Zoo_Event");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1); // num�� ��
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch
		
		return x;
	}// getArticleCount()
	
	

	// board table���� ������ �޼ҵ� ���� (List�� ����)                       q               f
	public List<Zoo_EventVO> getEvents(int start, int end){// ����1
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Zoo_EventVO> eventList = null;
		
		try {
			con = ConnUtil.getConnection();			
					pstmt = con.prepareStatement(
						"select * from (select rownum rnum, E_number, E_name, E_content, E_image, E_readcount, E_startDate, E_endDate from (select * from Zoo_Event order by E_number desc)) where rnum >=? and rnum <=?");
					pstmt.setInt(1, start);  //
					pstmt.setInt(2, end);   // ����3
					rs = pstmt.executeQuery();
							
			if(rs.next()) {
				eventList = new ArrayList<Zoo_EventVO>();
				do {
					Zoo_EventVO event = new Zoo_EventVO();
					event.setE_number(rs.getInt("E_number"));
					event.setE_name(rs.getString("E_name"));
					event.setE_content(rs.getString("E_content"));
					event.setE_image(rs.getString("E_image"));
					event.setE_readcount(rs.getInt("E_readcount"));
					event.setE_startDate(rs.getString("E_startDate"));
					event.setE_endDate(rs.getString("E_endDate"));
							
					eventList.add(event);
					
				}while(rs.next()); // end of do-while
			}else {
				eventList = new ArrayList<Zoo_EventVO>();
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch

		return eventList;

	}

	// board table���� ������ �޼ҵ� ���� (List�� ����)                       q               f
	public List<Zoo_EventVO> getEvents(){// ����1
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Zoo_EventVO> eventList = null;
		
		try {
			con = ConnUtil.getConnection();			
					pstmt = con.prepareStatement("select * from Zoo_Event order by E_number desc");
					rs = pstmt.executeQuery();
							
			if(rs.next()) {
				eventList = new ArrayList<Zoo_EventVO>();
				do {
					Zoo_EventVO event = new Zoo_EventVO();
					event.setE_number(rs.getInt("E_number"));
					event.setE_name(rs.getString("E_name"));
					event.setE_content(rs.getString("E_content"));
					event.setE_image(rs.getString("E_image"));
					event.setE_readcount(rs.getInt("E_readcount"));
					event.setE_startDate(rs.getString("E_startDate"));
					event.setE_endDate(rs.getString("E_endDate"));
							
					eventList.add(event);
					
				}while(rs.next()); // end of do-while
			}else {
				eventList = new ArrayList<Zoo_EventVO>();
			}
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch

		return eventList;

	}
	

	/*
	 * �� ������ ������ �� ������ �� �� �ֵ��� �ؾ���.
	 * �츮�� ��num �� �Ű������� �ؼ� �ϳ��� �ۿ� ���� ���������� DB���� �����;���.
	 * DB���� �� �ϳ��� ������ ������ �޼ҵ� ����
	 */
	public Zoo_EventVO getEvent(int E_number) {
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Zoo_EventVO event = null;
		
		try {
		
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement("update Zoo_Event set E_readcount = E_readcount+1 where E_number=?");
			pstmt.setInt(1, E_number);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = con.prepareStatement("select * from Zoo_Event where E_number=?");
			pstmt.setInt(1, E_number);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				event = new Zoo_EventVO();
				event.setE_number(rs.getInt("E_number"));
				event.setE_name(rs.getString("E_name"));
				event.setE_content(rs.getString("E_content"));
				event.setE_image(rs.getString("E_image"));
				event.setE_readcount(rs.getInt("E_readcount"));
				event.setE_startDate(rs.getString("E_startDate"));
				event.setE_endDate(rs.getString("E_endDate"));
			}
	
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch
		return event;
	}


	
	public void deleteEvent(Zoo_EventVO event) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement("delete from Zoo_Event where E_number=?");
			pstmt.setInt(1, event.getE_number());
			pstmt.executeUpdate();
			
		}catch(Exception se) {
			System.out.println("Exception " + se);
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
			if(con != null) try {con.close();}catch(SQLException s1) {}
		}// end of try&catch

	}// end of deleteArticle(int num, String pass)	
	
	
	
	
}
