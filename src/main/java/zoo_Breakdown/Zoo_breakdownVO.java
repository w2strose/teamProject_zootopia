package zoo_Breakdown;

public class Zoo_breakdownVO {

	
	//select H.h_name,O.o_type, O.o_charge, R.r_date,R.r_member from zoo_hotel H, zoo_operation O, zoo_reservation R where H.id='gm_m';
	
	private int r_number;
	private String id;
	private String h_name;
	private String o_type;
	private String o_charge;
	private String r_date;
	private int r_member;
	private String s_coment;
	
	public Zoo_breakdownVO() {
		// TODO Auto-generated constructor stub
	}
	
	public Zoo_breakdownVO(String id, String h_name, String o_type, String o_charge, String r_date, int r_member, int r_number,String s_coment) {

		this.id = id;
		this.h_name = h_name;
		this.o_type = o_type;
		this.o_charge = o_charge;
		this.r_date = r_date;
		this.r_member = r_member;
		this.r_number = r_number;
		this.s_coment = s_coment;
	
	}
	public Zoo_breakdownVO(String id, String h_name, String o_type, String o_charge, String r_date, int r_member, int r_number) {
		
		this.id = id;
		this.h_name = h_name;
		this.o_type = o_type;
		this.o_charge = o_charge;
		this.r_date = r_date;
		this.r_member = r_member;
		this.r_number = r_number;		
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getS_coment() {
		return s_coment;
	}

	public void setS_coment(String s_coment) {
		this.s_coment = s_coment;
	}

	public String getO_type() {
		return o_type;
	}

	public void setO_type(String o_type) {
		this.o_type = o_type;
	}

	public String getO_charge() {
		return o_charge;
	}

	public void setO_charge(String o_charge) {
		this.o_charge = o_charge;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getR_member() {
		return r_member;
	}

	public void setR_member(int r_member) {
		this.r_member = r_member;
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
	
	
	
}
