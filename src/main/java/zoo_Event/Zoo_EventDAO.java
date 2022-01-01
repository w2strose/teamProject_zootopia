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
	
	

	// 전체 글의 개수를 가져올 메소드 구현하기
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
				x = rs.getInt(1); // num의 값
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
	
	

	// board table에서 가져올 메소드 구현 (List로 구현)                       q               f
	public List<Zoo_EventVO> getEvents(int start, int end){// 수정1
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Zoo_EventVO> eventList = null;
		
		try {
			con = ConnUtil.getConnection();			
					pstmt = con.prepareStatement(
						"select * from (select rownum rnum, E_number, E_name, E_content, E_image, E_readcount, E_regdate from (select * from Zoo_Event order by E_number desc)) where rnum >=? and rnum <=?");
					pstmt.setInt(1, start);  //
					pstmt.setInt(2, end);   // 수정3
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
					event.setE_regdate(rs.getTimestamp("E_regdate"));
							
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

	// board table에서 가져올 메소드 구현 (List로 구현)                       q               f
	public List<Zoo_EventVO> getEvents(){// 수정1
		
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
					event.setE_regdate(rs.getTimestamp("E_regdate"));
							
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
	 * 글 제목을 누르면 글 내용을 볼 수 있도록 해야함.
	 * 우리는 글num 을 매개변수로 해서 하나의 글에 대한 세부정보를 DB에서 가져와야함.
	 * DB에서 글 하나의 정보를 가져올 메소드 구현
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
				event.setE_regdate(rs.getTimestamp("E_regdate"));
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
	

}
