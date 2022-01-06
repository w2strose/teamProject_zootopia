package zootopia;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class zoomemberDAO {

	// 디비 연결 함수
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
	
		// 아이디 체크 함수
		public boolean idCheck(String id) {
			boolean result = true;

			Connection con = null;
			PreparedStatement pstmt = null; // 동적	
			ResultSet rs = null;

			try {
				// DB연결
				con = getConnection();
				pstmt = con.prepareStatement("select * from zoomember where id=?");
				pstmt.setString(1,id);

				rs = pstmt.executeQuery();

				if(!rs.next()) result = false;

			}catch(SQLException se) {
				se.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
				if(con != null) try {con.close();}catch(SQLException s1) {}
			}

			return result;
		}
		

		// regProc에 사용 회원가입
		public boolean memberInsert(zoomemberVO vo) {

			Connection con = null;
			PreparedStatement pstmt = null; // 바인딩변수
			ResultSet rs = null;
			boolean flag = false;
			
			try {
				con = getConnection();
				
				String strQuery = "insert into zoomember values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPass());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getPhone1());
				pstmt.setString(5, vo.getPhone2());
				pstmt.setString(6, vo.getPhone3());
				pstmt.setString(7, vo.getEmail());
				pstmt.setString(8, vo.getBirth());
				int count = pstmt.executeUpdate();
				if(count > 0) flag = true;
				
			}catch(Exception se) {
				System.out.println("Exception " + se);
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
				if(con != null) try {con.close();}catch(SQLException s1) {}
			}// end of try&catch
			
			return flag;
		
		}// end of memberInsert(zoomemberVO vo)
		

		// DB에서 ID/PASSWORD를 비교하여 그 결과를 정수형으로 리턴해주는 메소드를 구현함. 
		// 1 : 로그인 성공, 0 : 로그인 실패, -1 : 아이디없음
		public int loginCheck(String id, String pass) {
			
			Connection con = null; // 커넥션
			PreparedStatement pstmt = null; //동적쿼리 
			ResultSet rs = null; // 결과집합
			int check = -1;
			try {
				con = getConnection();
				
				String strQuery = "select pass from zoomember where id=?";
				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String dbPass = rs.getString("pass"); // "pass"는 DB컬럼명
					if(pass.equals(dbPass)) check =1;
					else check = 0;
				}
			}catch(Exception se) {
				System.out.println("Exception " + se);
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
				if(con != null) try {con.close();}catch(SQLException s1) {}
			}// end of try&catch
			
			return check;
			
		}// end of loginCheck(String id, String pass)
		
		

		public zoomemberVO getMember(String id) {// student테이블 값을 가져오는 메소드 
		
			Connection con = null; // 커넥션
			PreparedStatement pstmt = null; //동적쿼리 
			ResultSet rs = null; // 결과집합
			zoomemberVO vo = null;
			
			try {
				con = getConnection();
				
				String strQuery = "select * from zoomember where id=?";
				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
		
				if(rs.next()) {// 아이디에 해당하는 회원이 존재한다면 
					vo = new zoomemberVO();
					vo.setId(rs.getString("id"));
					vo.setPass(rs.getString("pass"));
					vo.setName(rs.getString("name"));
					vo.setPhone1(rs.getString("phone1"));
					vo.setPhone2(rs.getString("phone2"));
					vo.setPhone3(rs.getString("phone3"));
					vo.setEmail(rs.getString("email"));
					vo.setBirth(rs.getString("birth"));
				}// end of if
		
			}catch(Exception se) {
				System.out.println("Exception " + se);
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
				if(con != null) try {con.close();}catch(SQLException s1) {}
			}// end of try&catch
			
			return vo;
		}// end of getMember(String id)
		
		
		// 정보수정 버튼 클릭시 데이터베이스에 update를 수행해야함.
		// 정보수정을 처리해줄 메소드 추가.
		public void updateMember(zoomemberVO vo) {
			Connection con = null;
			PreparedStatement pstmt = null; // 바인딩변수
			
			try {
				con = getConnection();
				
				String strQuery = "update zoomember set pass=?, phone1=?, phone2=?, phone3=?, email=?, birth=? where id=?";
				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, vo.getPass());
				pstmt.setString(2, vo.getPhone1());
				pstmt.setString(3, vo.getPhone2());
				pstmt.setString(4, vo.getPhone3());
				pstmt.setString(5, vo.getEmail());
				pstmt.setString(6, vo.getBirth());
				pstmt.setString(7, vo.getId());
				
				pstmt.executeUpdate();
			}catch(Exception se) {
				System.out.println("Exception " + se);
			}finally {
				if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
				if(con != null) try {con.close();}catch(SQLException s1) {}
			}// end of try&catch
			
		}// end of updateMember(StudentVO vo)
		

		// 탈퇴버튼을 클릭하면, 실제로 데이터베이스에서 회원데이터가 삭제되어야함.
		// DB에서 회원삭제를 처리해줄 메소드 추가
		public int deleteMember(String id, String pass) {
			
			Connection con = null; // 커넥션
			PreparedStatement pstmt = null; //동적쿼리 
			ResultSet rs = null; // 결과집합
		
			String dbPass=""; // 실제 DB에 저장된 비밀번호
			int result = -1;
			try {
				con= getConnection();
				String strQuery ="select pass from zoomember where id=?";
				pstmt = con.prepareStatement(strQuery);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dbPass = rs.getString("pass");
					if(dbPass.equals(pass)) {
						pstmt = con.prepareStatement("delete from zoomember where id=?");
						pstmt.setString(1,id);
						pstmt.executeUpdate();
						result=1; // 회원탈퇴 성공
					}else {
						result=0;// 비밀번호 오류
					}
				}
			}catch(Exception se) {
				System.out.println("Exception " + se);
			}finally {
				if(rs != null) try {rs.close();}catch(SQLException s1) {}
				if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
				if(con != null) try {con.close();}catch(SQLException s1) {}
			}// end of try&catch
		
			return result;
		
		}// end of deleteMamber(String id, String pass) 
		
		
		
}
