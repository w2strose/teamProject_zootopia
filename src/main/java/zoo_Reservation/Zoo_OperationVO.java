package zoo_Reservation;

import java.sql.Date;

public class Zoo_OperationVO {

	private int h_number,o_number;
	private String o_type,o_ok, o_charge,O_date;
	
	public String getO_charge() {
		return o_charge;
	}
	public void setO_charge(String o_charge) {
		this.o_charge = o_charge;
	}
	
	public int getH_number() {
		return h_number;
	}
	public void setH_number(int h_number) {
		this.h_number = h_number;
	}
	public int getO_number() {
		return o_number;
	}
	public void setO_number(int o_number) {
		this.o_number = o_number;
	}
	public String getO_type() {
		return o_type;
	}
	public void setO_type(String o_type) {
		this.o_type = o_type;
	}
	public String getO_ok() {
		return o_ok;
	}
	public void setO_ok(String o_ok) {
		this.o_ok = o_ok;
	}
	public String getO_date() {
		return O_date;
	}
	public void setO_date(String o_date) {
		O_date = o_date;
	}
	
	
	
}
