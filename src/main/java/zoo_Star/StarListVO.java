package zoo_Star;

public class StarListVO {

	
	//select H.h_name,O.o_type, O.o_charge, R.r_date,R.r_member from zoo_hotel H, zoo_operation O, zoo_reservation R where H.id='gm_m';
	
	private String id;
	private int r_number;
	private int s_number;
	private String s_title;
	private double s_star;
	private String s_regdate;
	private String s_coment;

	public StarListVO(String id,int r_number, int s_number,
					String s_title, double s_star,
					String s_regdate,String s_coment) 
	{
		this.id = id;
		this.r_number = r_number;
		this.s_number = s_number;
		this.s_title = s_title;
		this.s_star = s_star;
		this.s_regdate = s_regdate;
		this.s_coment = s_coment;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getR_number() {
		return r_number;
	}

	public void setR_number(int r_number) {
		this.r_number = r_number;
	}

	public int getS_number() {
		return s_number;
	}

	public void setS_number(int s_number) {
		this.s_number = s_number;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public double getS_star() {
		return s_star;
	}

	public void setS_star(double s_star) {
		this.s_star = s_star;
	}

	public String getS_regdate() {
		return s_regdate;
	}

	public void setS_regdate(String s_regdate) {
		this.s_regdate = s_regdate;
	}

	public String getS_coment() {
		return s_coment;
	}

	public void setS_coment(String s_coment) {
		this.s_coment = s_coment;
	}
	
	
	
	
}

	