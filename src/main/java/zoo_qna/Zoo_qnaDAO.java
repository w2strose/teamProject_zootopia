package zoo_qna;
import java.sql.*;
import java.util.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;




public class Zoo_qnaDAO {
	
	private static Zoo_qnaDAO instance = null;
	
	
	
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
	
	public int getboardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement("select count(*) from zoo_board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
				
			}
			
			
			
		}catch(Exception se) {
			System.out.println("Exception"+se);
		}finally {
			if(con!=null)try {con.close();}catch(SQLException s2) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s3) {}
			if(rs!=null)try {rs.close();}catch(SQLException s1) {}
		}
		
		return x;
				
	}
	
	public List<Zoo_qnaVO> getBoardList(int start, int end, String what, String text) { // 수정 1
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Zoo_qnaVO> boardList = null;
		
		try {
			con = getConnection();
			// 수정 2
			//pstmt = con.prepareStatement("select * from board order by num desc");
			if(text!=null) {pstmt = con.prepareStatement("select * from (select rownum rnum, num, writer, email, subject, pass, regdate, readcount, ref, step, depth, content, ip from (select * from board where "+what+" like ? order by ref desc, step asc)) where rnum >= ? and rnum <=?");
			// 수정 3
			pstmt.setString(1, "%"+text+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			}else{
				pstmt = con.prepareStatement("select * from (select rownum rnum, id, b_number, b_subject, b_content from (select * from Zoo_board order by B_number desc)) where rnum >= ? and rnum <=?");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
			}
			
			if(rs.next()) {
				
				boardList = new ArrayList<Zoo_qnaVO>();
				do {
					Zoo_qnaVO board = new Zoo_qnaVO();
					board.setId(rs.getString("id"));
					board.setB_number(rs.getInt("b_number"));
					board.setB_subject(rs.getString("b_subject"));
					board.setB_content(rs.getString("b_content"));
					
					boardList.add(board);
				 
				}while(rs.next());
			}else {
				boardList = new ArrayList<Zoo_qnaVO>();
			}
			
		}catch(Exception se) {
			System.out.println("Exception"+se);
		}finally {
			if(con!=null)try {con.close();}catch(SQLException s2) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s3) {}
			if(rs!=null)try {rs.close();}catch(SQLException s1) {}
		}
		return boardList;
	}
	
	public Zoo_qnaVO getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Zoo_qnaVO board = null;
		
		try {
			con = getConnection();
			//pstmt = con.prepareStatement("update board set readcount = readcount+1 where num=?");
			//pstmt.setInt(1, num);
			//pstmt.executeUpdate();
			pstmt = con.prepareStatement("select * from zoo_board where B_number=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Zoo_qnaVO();
				board.setB_number(rs.getInt("B_number"));
				board.setId(rs.getString("id"));
				board.setB_subject(rs.getString("B_subject"));
				board.setB_content(rs.getString("B_content"));
			}
			
		}catch(Exception se) {
			System.out.println("Exception"+se);
		}finally {
			if(con!=null)try {con.close();}catch(SQLException s2) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s3) {}
			if(rs!=null)try {rs.close();}catch(SQLException s1) {}
		}
		return board;
		
	}
	
}
