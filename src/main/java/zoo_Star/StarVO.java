package zoo_Star;

import java.util.Date;
import java.sql.Timestamp;

public class StarVO {

	private String id;
	private String r_number;
	private String s_number;
	private String S_TITLE;
	private double STAR;
	private String S_REGDATE;
	private String S_COMENT;
	
	
	
	
	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getR_number() {
		return r_number;
	}




	public void setR_number(String r_number) {
		this.r_number = r_number;
	}




	public String getS_number() {
		return s_number;
	}




	public void setS_number(String s_number) {
		this.s_number = s_number;
	}




	public String getS_TITLE() {
		return S_TITLE;
	}




	public void setS_TITLE(String s_TITLE) {
		S_TITLE = s_TITLE;
	}




	public double getSTAR() {
		return STAR;
	}




	public void setSTAR(double sTAR) {
		STAR = sTAR;
	}




	public String getS_REGDATE() {
		return S_REGDATE;
	}




	public void setS_REGDATE(String s_REGDATE) {
		S_REGDATE = s_REGDATE;
	}




	public String getS_COMENT() {
		return S_COMENT;
	}




	public void setS_COMENT(String s_COMENT) {
		S_COMENT = s_COMENT;
	}




	public StarVO(String id, String r_number, String s_number,String S_TITLE, double STAR, String S_REGDATE, String S_COMENT  ) {
		this.id =id;
		this.r_number = r_number;
		this.s_number = s_number;
		this.S_TITLE = S_TITLE;
		this.STAR = STAR;
		this.S_REGDATE = S_REGDATE;
		this.S_COMENT = S_COMENT;
	}
	
	
	
	
	
	
}
