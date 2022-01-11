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
				System.out.println("입력 완료");
			}while(rs.next());
		}
		System.out.println("입력 실패");

	}catch(Exception se) {
		System.out.println("Exception " + se);
	}finally {
		if(rs != null) try {rs.close();}catch(SQLException s1) {}
		if(pstmt != null) try {pstmt.close();}catch(SQLException s1) {}
		if(con != null) try {con.close();}catch(SQLException s1) {}
	}
	
	return listBk;
}



	


////�뜝�떛怨ㅼ삕�뜝�룞�삕 �뜝�뙃�룞�삕�뜝�룞�삕 �뜝�뙗�뼲�삕�뜝�룞�삕 �뜝�룞�삕�붷뜝�룞�삕�뜝占� �뜝�떦�냲�삕�뜝�떦�냲�삕 �뜝�뙣�냼�벝�삕�뜝占� �뜝�뙥怨ㅼ삕�뜝�떦紐뚯삕 �뜝�룞�삕
//	public void insertArticle(StarVO article) {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		int num = article.getNum();
//		int ref = article.getRef();
//		int step = article.getStep();
//		int depth = article.getDepth();
//		
//		int number = 0;
//		
//		String sql = "";
//		
//		try {
//			con = ConnUtil.getConnection();
//			pstmt = con.prepareStatement("select max(num) from board");
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) number = rs.getInt(1)+1;//�뜝�룞�삕�뜝�룞�삕
//			else number = 1;//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�떍�뙋�삕 �뜝�룞�삕�뜝占�
//			
//			if(num != 0) {// �뜝�뜲蹂��뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占�
//				sql = "update board set step=step+1 where ref=? and step > ?";
//				pstmt = con.prepareStatement(sql);
//				
//				pstmt.setInt(1, ref);
//				pstmt.setInt(2, step);
//				
//				pstmt.executeUpdate();
//				
//				step = step+1;
//				depth = depth+1;
//			}else {// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占�
//				ref=number;
//				step=0;
//				depth=0;
//			}
//			// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙥怨ㅼ삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�뙗�눦�삕
//			sql = "insert into zoo_star(id, password, email, subject, pass, regdate,"
//					+" ref, step, depth, content, ip)"
//					+"values(board_seq.nextval, ?,?,?,?,?,?,?,?,?,? )";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, article.getId());
//			pstmt.setString(2, article.getS_PASSWORD());
//			pstmt.setDouble(3, article.getSTARS());
//			pstmt.setString(4, article.getS_COMENT());
//			pstmt.setString(5, article.getS_title());
//			//pstmt.setInt(6, ref);
//			//pstmt.setInt(7, step);
//			//pstmt.setInt(8, depth);
//			
//			//pstmt.setString(10, article.getIp());
//			
//			pstmt.executeUpdate();
//		
//			
//		}catch(Exception ex) {
//			System.out.println("Exception " + ex);
//		}finally {
//			if(rs != null)
//				try {
//					rs.close();
//				}catch(SQLException s1) {
//					
//				}
//			if(pstmt != null)
//				try {
//					pstmt.close();
//				}catch(SQLException s1) {
//					
//				}
//			if(con != null)
//				try {
//					con.close();
//				}catch(SQLException s1) {
//					
//				}
//		    }
//		}
//		
//		// �뜝�룞�삕泥� �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�룞�삕
//		public int getArticleCount() {
//			
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			int x = 0;
//			
//			try {
//				con = ConnUtil.getConnection();
//				pstmt = con.prepareStatement("select count(*) from board");
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					x= rs.getInt(1);
//				}
//				
//			}catch(Exception ex) {
//				System.out.println("Exception " + ex);
//			}finally {
//				if(rs != null)
//					try {
//						rs.close();
//					}catch(SQLException s1) {
//						
//					}
//				if(pstmt != null)
//					try {
//						pstmt.close();
//					}catch(SQLException s1) {
//						
//					}
//				if(con != null)
//					try {
//						con.close();
//					}catch(SQLException s1) {}
//				
//				
//			
//			
//			
//			}
//			return x;
//		}
//		
//		// board table �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�룞�삕 (List�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕)
//		public List <StarVO> getArticles(int start, int end){// �뜝�룞�삕�뜝�룞�삕 1
//			
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			List <StarVO> articleList = null;
//			
//			
//			try {
//			con = ConnUtil.getConnection();
//			// �뜝�룞�삕�뜝�룞�삕 2
//			// pstmt = con.prepareStatement("select * from board order by num desc");
//			pstmt = con.prepareStatement("select * from (select rownum rnum, num, writer, email, subject, pass, "
//					+ "regdate, readcount, ref, step, depth, content, ip from "
//					+ "(select * from board order by ref desc, step asc)) "
//					+ "where rnum >= ? and rnum <=?");
//			     
//			// �뜝�룞�삕�뜝�룞�삕 3
//			    pstmt.setInt(1, start);
//			    pstmt.setInt(2, end);		
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				articleList = new ArrayList<StarVO>(end-start+1);// �뜝�룞�삕�뜝�룞�삕 4
//				do {
//					StarVO article = new StarVO();
//					
//					article.setNum(rs.getInt("num"));
//					article.setWriter(rs.getString("writer"));
//					article.setEmail(rs.getString("email"));
//					article.setSubject(rs.getString("subject"));
//					article.setPass(rs.getString("pass"));
//					article.setRegdate(rs.getTimestamp("regdate"));
//					article.setReadcount(rs.getInt("readcount"));
//					article.setRef(rs.getInt("ref"));
//					article.setStep(rs.getInt("step"));
//					article.setDepth(rs.getInt("depth"));
//					article.setContent(rs.getString("content"));
//					article.setIp(rs.getString("ip"));
//					
//					articleList.add(article);
//				}while(rs.next());
//			}
//			}catch(Exception ex) {
//				System.out.println("Exception"+ex);
//			}finally {
//				if(rs != null)try {rs.close();}catch(SQLException s1) {}
//				if(pstmt != null)try {pstmt.close();}catch(SQLException s2) {}
//				if(con != null)try {con.close();}catch(SQLException s3) {}
//					
//			}
//			return articleList;
//		    
//		}
//		/*
//		 *  �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕 �뜝�뙇�벝�삕�뜝�룞�삕 �뜝�뙏�뼲�삕�뜝�룞�삕
//		 *  
//		 *  �뜝�럩由у뜝�룞�삕 �뜝�룞�삕 num�뜝�룞�삕 �뜝�떊怨ㅼ삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙏�눦�삕 �뜝�떦�냲�삕�뜝�룞�삕 �뜝�뙗�슱�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떢�뼲�삕�뜝�룞�삕
//		 *  �뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�떦�냲�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�룞�삕
//		 *  
//		 * */
//		
//		public StarVO getArticle(int num) {
//			
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			StarVO article = null;
//			
//			try {
//				
//				con = ConnUtil.getConnection();
//				
//				pstmt = con.prepareStatement("update board set readcount = readcount+1 where num=?");
//				
//				pstmt.setInt(1, num);
//				pstmt.executeUpdate();
//				
//				pstmt = con.prepareStatement("select * from board where num=?");
//				
//				pstmt.setInt(1, num);
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					article = new BoardVO();
//					article.setNum(rs.getInt("num"));
//					article.setWriter(rs.getString("writer"));
//					article.setEmail(rs.getString("email"));
//					article.setSubject(rs.getString("subject"));
//					article.setPass(rs.getString("pass"));
//					article.setRegdate(rs.getTimestamp("regdate"));
//					article.setReadcount(rs.getInt("readcount"));
//					article.setRef(rs.getInt("ref"));
//					article.setStep(rs.getInt("step"));
//					article.setDepth(rs.getInt("depth"));
//					article.setContent(rs.getString("content"));
//					article.setIp("ip");
//					
//				}
//				
//			}catch(Exception ex) {
//				System.out.println("Exception " + ex);
//			}finally {
//				if(rs != null)
//					try {
//						rs.close();
//					}catch(SQLException s1) {}
//				if(pstmt != null)
//					try {
//						pstmt.close();
//					}catch(SQLException s1) {}
//				if(con != null)
//					try {
//						con.close();
//					}catch(SQLException s1) {}
//				
//				
//			}
//			return article;
//		}
//		
//		/*
//		 * �뜝�룞�삕 �뜝�룫�꽭釉앹삕�뜝�룞�삕 �솕�뜝�띂�뿉�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�듉�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占� updateForm.jsp�뜝�룞�삕 �뜝�떛�벝�삕�뜝�떦�벝�삕�뜝�룞�삕 �뜝�룞�삕�겕�뜝�룞�삕 �뜝�떖�뼲�삕�뜝�룞�삕�뜝�떎琉꾩삕
//		 * �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �솕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�뙏�뼲�삕�뜝�룞�삕
//		 * 
//		 * �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�떆�슱�삕�뜝�룞�삕 �뜝�룞�삕 �뜝�룞�삕�뜝占� �뜝�룞�삕�뜝�룞�삕�뜝占� �뜝�뙐紐뚯삕�뜝�룞�삕 �뜝�룞�삕�쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�궗 �뜝�떗�슂媛� �뜝�룞�삕�뜝�룞�삕
//		 * 
//		 * �뜝�룞�삕�쉶�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�궎�뜝�룞�삕 �뜝�떥釉앹삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 num�뜝�룞�삕 �뜝�뙏�뙋�삕�뜝�떦�뙋�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�룞�삕
//		 * */
//		
//		public StarVO updategetArticle(int num) {
//			
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			StarVO article = null;
//			
//			try {
//				
//				con = ConnUtil.getConnection();
//				
//				pstmt = con.prepareStatement("select * from board where num=?");
//				
//				pstmt.setInt(1, num);
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					article = new BoardVO();
//					article.setNum(rs.getInt("num"));
//					article.setWriter(rs.getString("writer"));
//					article.setEmail(rs.getString("email"));
//					article.setSubject(rs.getString("subject"));
//					article.setPass(rs.getString("pass"));
//					article.setRegdate(rs.getTimestamp("regdate"));
//					article.setReadcount(rs.getInt("readcount"));
//					article.setRef(rs.getInt("ref"));
//					article.setStep(rs.getInt("step"));
//					article.setDepth(rs.getInt("depth"));
//					article.setContent(rs.getString("content"));
//					article.setIp("ip");
//					
//				}
//				
//			}catch(Exception ex) {
//				System.out.println("Exception " + ex);
//			}finally {
//				if(rs != null)
//					try {
//						rs.close();
//					}catch(SQLException s1) {}
//				if(pstmt != null)
//					try {
//						pstmt.close();
//					}catch(SQLException s1) {}
//				if(con != null)
//					try {
//						con.close();
//					}catch(SQLException s1) {}
//				
//				
//			}
//			return article;
//		}
//		
//		/* �뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 泥섇뜝�룞�삕�뜝�룞�삕 �뜝�떎�뼲�삕�뜝�룞�삕�뜝占�
//		 * 
//		 *  �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕泥섇뜝�룞�삕 �뜝�룞�삕 �뜝�뙣�냼�벝�삕 �뜝�룞�삕�뜝�룞�삕
//		 *  �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕 -1, �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 1, �뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕:0
//		 */
//		public int updateArticle(StarVO article) {
//			
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			String dbpasswd = "";
//			String sql="";
//			int result = -1;
//			
//			try {
//				
//				con = ConnUtil.getConnection();
//				pstmt = con.prepareStatement("select pass from board where num=?");
//				
//				pstmt.setInt(1, article.getNum());
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					dbpasswd = rs.getString("pass");
//					if(dbpasswd.equals(article.getPass())) {
//						// �뜝�룞�삕艅섇뜝�떕節륁삕�뜝占� �뜝�룞�삕移섇뜝�떦紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
//						sql="update board set writer=?, email=?, subject=?, content=? where num=?";
//						
//						pstmt=con.prepareStatement(sql);
//						
//						pstmt.setString(1, article.getWriter());
//						pstmt.setString(2, article.getEmail());
//						pstmt.setString(3, article.getSubject());
//						pstmt.setString(4, article.getContent());
//						pstmt.setInt(5, article.getNum());
//						pstmt.executeUpdate();
//						result =1; // �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
//						
//						
//					}else {
//						result = 0;
//					}
//				}
//				
//			}catch(Exception ex) {
//				System.out.println("Exception " + ex);
//			}finally {
//				if(rs != null)
//					try {
//						rs.close();
//					}catch(SQLException s1) {}
//				if(pstmt != null)
//					try {
//						pstmt.close();
//					}catch(SQLException s1) {}
//				if(con != null)
//					try {
//						con.close();
//					}catch(SQLException s1) {}
//				
//				
//			}
//			return result;
//			
//		}
//    /*�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕 泥섇뜝�룞�삕
//     * 
//     * �뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕艅섇뜝�떕節륁삕�뜝占� �뜝�룞�삕�뜝�떦�슱�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙣�냼�뱶瑜� �뜝�룞�삕�뜝�룞�삕�뜝�떬�뙋�삕
//     * 
//     * 
//     * 
//     * 
//     * */
//		
//		public int deleteArticle(int num, String pass) {
//			
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			String dbpasswd = "";
//			String sql="";
//			int result = -1;
//			
//			try {
//				
//				con = ConnUtil.getConnection();
//				pstmt = con.prepareStatement("select pass from board where num=?");
//				
//				pstmt.setInt(1, num);
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					dbpasswd = rs.getString("pass");
//					if(dbpasswd.equals(pass)) {
//						// �뜝�룞�삕艅섇뜝�떕節륁삕�뜝占� �뜝�룞�삕移섇뜝�떦紐뚯삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
//						sql="delete from board where num=?";
//						
//						pstmt=con.prepareStatement(sql);
//						
//						pstmt.setInt(1, num);
//						pstmt.executeUpdate();
//						result =1; // �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
//						
//						
//					}else {
//						result = 0;// �뜝�룞�삕艅섇뜝�떕占� ���뜝�룞�삕
//					}
//				}
//				
//			}catch(Exception ex) {
//				System.out.println("Exception " + ex);
//			}finally {
//				if(rs != null)
//					try {
//						rs.close();
//					}catch(SQLException s1) {}
//				if(pstmt != null)
//					try {
//						pstmt.close();
//					}catch(SQLException s1) {}
//				if(con != null)
//					try {
//						con.close();
//					}catch(SQLException s1) {}
//				
//				
//			}
//			return result;
//		}
		


}
