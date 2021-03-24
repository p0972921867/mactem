package com.team2.bean;

public class FoodBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String foodno;
	private String name;
	private String category;
	private String expiredate;
	private String preservation;
	private String cal;
	
	public String getFoodno() { return foodno; }
	public String getName() { return name; }
	public String getCategory() { return category; }
	public String getExpiredate() { return expiredate; }
	public String getPreservation() { return preservation; }
	public String getCal() { return cal; }
	
	public void setFoodno(String foodno) { this.foodno = foodno; }
	public void setName(String name) { this.name = name; }
	public void setCategory(String category) { this.category = category; }
	public void setExpiredate(String expiredate) { this.expiredate = expiredate; }
	public void setPreservation(String preservation) { this.preservation = preservation; }
	public void setCal(String cal) { this.cal = cal; }

}
