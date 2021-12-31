
package zoo_Event;

import java.sql.Timestamp;

public class Zoo_EventVO {
	private int E_number;
	private String E_name;
	private String E_content;
	private String E_image;
	private int E_readcount;
	private Timestamp E_regdate;
	
	public int getE_number() {
		return E_number;
	}
	public void setE_number(int e_number) {
		E_number = e_number;
	}
	public String getE_name() {
		return E_name;
	}
	public void setE_name(String e_name) {
		E_name = e_name;
	}
	public String getE_content() {
		return E_content;
	}
	public void setE_content(String e_content) {
		E_content = e_content;
	}
	public String getE_image() {
		return E_image;
	}
	public void setE_image(String e_image) {
		E_image = e_image;
	}
	public int getE_readcount() {
		return E_readcount;
	}
	public void setE_readcount(int e_readcount) {
		E_readcount = e_readcount;
	}
	public Timestamp getE_regdate() {
		return E_regdate;
	}
	public void setE_regdate(Timestamp e_regdate) {
		E_regdate = e_regdate;
	}
	
	
	
}
