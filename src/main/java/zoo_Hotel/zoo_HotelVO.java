package zoo_Hotel;

public class zoo_HotelVO {

	private String id;
	private int h_number;
	private String h_name;
	private String h_phone1;
	private String h_phone2;
	private String h_phone3;
	private String h_postnum;
	private String h_address;
	private String h_coment;
	private String h_jibunaddress;
	private String h_roomnumber;
	
	public zoo_HotelVO() {
		// TODO Auto-generated constructor stub
	}
	
	public zoo_HotelVO(String id, int h_number, String h_name,
	String h_phone1, String h_phone2, String h_phone3,
	 String h_postnum, String h_address,String h_coment,
	 String h_jibunaddress, String h_roomnumber) 
	{
		this.id = id;
		this.h_number = h_number;
		this.h_name = h_name;
		this.h_phone1 = h_phone1;
		this.h_phone2 = h_phone2;
		this.h_phone3 = h_phone3;
		this.h_postnum = h_postnum;
		this.h_address = h_address;
		this.h_coment = h_coment;
		this.h_jibunaddress = h_jibunaddress;
		this.h_roomnumber = h_roomnumber;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getH_number() {
		return h_number;
	}
	public void setH_number(int h_number) {
		this.h_number = h_number;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getH_phone1() {
		return h_phone1;
	}
	public void setH_phone1(String h_phone1) {
		this.h_phone1 = h_phone1;
	}
	public String getH_phone2() {
		return h_phone2;
	}
	public void setH_phone2(String h_phone2) {
		this.h_phone2 = h_phone2;
	}
	public String getH_phone3() {
		return h_phone3;
	}
	public void setH_phone3(String h_phone3) {
		this.h_phone3 = h_phone3;
	}
	public String getH_postnum() {
		return h_postnum;
	}
	public void setH_postnum(String h_postnum) {
		this.h_postnum = h_postnum;
	}
	public String getH_address() {
		return h_address;
	}
	public void setH_address(String h_address) {
		this.h_address = h_address;
	}
	public String getH_coment() {
		return h_coment;
	}
	public void setH_coment(String h_coment) {
		this.h_coment = h_coment;
	}
	public String getH_jibunaddress() {
		return h_jibunaddress;
	}
	public void setH_jibunaddress(String h_jibunaddress) {
		this.h_jibunaddress = h_jibunaddress;
	}
	public String getH_roomnumber() {
		return h_roomnumber;
	}
	public void setH_roomnumber(String h_roomnumber) {
		this.h_roomnumber = h_roomnumber;
	}
	
	
}
