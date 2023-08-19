package model;

public class ItemsInCart {
	private int productId;
	private int orderId;
	private int quantity;
	private float price;

	private Product product;

	public ItemsInCart() {

	}

	public ItemsInCart(int productId, int orderId, int quantity, float price) {
		super();
		this.productId = productId;
		this.orderId = orderId;
		this.quantity = quantity;
		this.price = price;
	}

	public ItemsInCart(int productId, int orderId, int quantity, float price, Product product) {
		super();
		this.productId = productId;
		this.orderId = orderId;
		this.quantity = quantity;
		this.price = price;
		this.product = product;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = Float.parseFloat(String.format("%.2f", price));
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
