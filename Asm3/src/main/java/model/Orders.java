package model;

import java.sql.Date;
import java.util.List;

public class Orders {
	private int orderId;
	private Date orderDate;
	private String discount;
	private int status;
	private String userEmail;

	private List<ItemsInCart> items;
	
	public Orders() {

	}
	
	public Orders(int orderId, Date orderDate, String discount, int status, String userEmail) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.discount = discount;
		this.status = status;
		this.userEmail = userEmail;
	}



	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public List<ItemsInCart> getItems() {
		return items;
	}

	public void setItems(List<ItemsInCart> items) {
		this.items = items;
	}

}
