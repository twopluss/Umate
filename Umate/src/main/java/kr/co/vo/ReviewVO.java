package kr.co.vo;

import java.sql.Date;

public class ReviewVO {
	private int bnos;
	private String total;
	private String content;
	private String rwriter;
	private Date regdate;
	private String me;
	public int getBnos() {
		return bnos;
	}
	public void setBnos(int bnos) {
		this.bnos = bnos;
	}
	public String getTotal() {
		return total;
	}
	public String getMe() {
		return me;
	}
	public void setMe(String me) {
		this.me = me;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
