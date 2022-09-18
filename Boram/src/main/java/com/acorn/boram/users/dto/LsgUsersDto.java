package com.acorn.boram.users.dto;

public class LsgUsersDto {
	private String id;
	private String pwd;
	private String name;
	private int countryCode;
	private String phone;
	private String email;
	private String profile;
	private String addr;
	private String regdate;
	private char manager;
	
	public LsgUsersDto() {}

	public LsgUsersDto(String id, String pwd, String name, int countryCode, String phone, String email, String profile,
			String addr, String regdate, char manager) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.countryCode = countryCode;
		this.phone = phone;
		this.email = email;
		this.profile = profile;
		this.addr = addr;
		this.regdate = regdate;
		this.manager = manager;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public char getManager() {
		return manager;
	}

	public void setManager(char manager) {
		this.manager = manager;
	}
	
}
