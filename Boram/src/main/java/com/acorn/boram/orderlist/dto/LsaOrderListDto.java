package com.acorn.boram.orderlist.dto;

//주문 정보를 담을 Dto
public class LsaOrderListDto {
	private int code;
	private String regdate;
	private String reservationDate;
	private String item;
	private long totalPrice;
	private String state;
	private String orderer;
	private int count;
	
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getOrderer() {
		return orderer;
	}
	public void setOrderer(String orderer) {
		this.orderer = orderer;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "LsaOrderListDto [code=" + code + ", regdate=" + regdate + ", reservationDate=" + reservationDate
				+ ", item=" + item + ", totalPrice=" + totalPrice + ", state=" + state + ", orderer=" + orderer
				+ ", count=" + count + "]";
	}
	
	
}