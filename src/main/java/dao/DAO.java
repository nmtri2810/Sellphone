package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Account;
import model.ItemsInCart;
import model.Orders;
import model.Product;

public class DAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//lay tat ca san pham
	public List<Product> getAllProduct() {
		List<Product> allProducts = new ArrayList<>();
		String query = "select * from products";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String src = rs.getString(5);
				String type = rs.getString(6);
				String brand = rs.getString(7);
				
				Product product = new Product(id, name, description, price, src, type, brand);
				allProducts.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//them conn.close();
		
		return allProducts;
	}
	
	//lay san pham bang ID
	public Product getProductByID(int ID) {
		Product product = new Product();
		String query = "select * from products\n"
				+ "where product_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, ID);
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String src = rs.getString(5);
				String type = rs.getString(6);
				String brand = rs.getString(7);
				
				product = new Product(id, name, description, price, src, type, brand);
				return product;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	//lay danh sach san pham bang ten duoc search
	public List<Product> getProductByName(String txtSearch) {
		List<Product> allProducts = new ArrayList<>();
		String query = "select * from products\n"
				+ "where product_name like ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String src = rs.getString(5);
				String type = rs.getString(6);
				String brand = rs.getString(7);
				
				Product product = new Product(id, name, description, price, src, type, brand);
				allProducts.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return allProducts;
	}
	
	//kiem tra tai khoan de dang nhap
	public Account login(String email, String password) {
		Account acc = new Account();
		String query = "select * from account\n"
				+ "where user_mail = ?\n"
				+ "and password = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next()) {
				String uEmail = rs.getString(1);
				String uPassword = rs.getString(2);
				String name = rs.getString(3);
				String address = rs.getString(4);
				String phone = rs.getString(5);
				int role = rs.getInt(6);
				
				acc = new Account(uEmail, uPassword, name, address, phone, role);
				return acc;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	//kiem tra tai khoan da ton tai chua bang email
	public Account checkAccountExist(String email) {
		Account acc = new Account();
		String query = "select * from account\n"
				+ "where user_mail = ?\n";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()) {
				String uEmail = rs.getString(1);
				String uPassword = rs.getString(2);
				String name = rs.getString(3);
				String address = rs.getString(4);
				String phone = rs.getString(5);
				int role = rs.getInt(6);
				
				acc = new Account(uEmail, uPassword, name, address, phone, role);
				return acc;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	//dang ki, them tai khoan vao DB
	public void signUp(String email, String password, String address, String phoneNum) {
		String query = "insert into account\n"
				+ "values (N?, N?, N?, N?, N?, 2)";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, address);
			ps.setString(5, phoneNum);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//tim so trang can co de phan trang
	public int getNumberPage() {
		String query = "select count(*) from products";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				int totalProduct = rs.getInt(1);
				int endPage = totalProduct / 10;
				if(totalProduct % 10 != 0) {
					endPage++;
				}
				//endPage = 4
				return endPage;
			}
 		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	//lay san pham cua tung trang
	public List<Product> pagingProduct(int index) {
		List<Product> list = new ArrayList<>();
		String query = "SELECT * FROM products\n"
				+ "LIMIT 10 OFFSET ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, (index-1)*10 );
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String src = rs.getString(5);
				String type = rs.getString(6);
				String brand = rs.getString(7);
				
				Product product = new Product(id, name, description, price, src, type, brand);
				list.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	//tim so trang can co de phan trang khi tim san pham
	public int getNumberPageByName(String txtSearch) {
		String query = "select count(*) from products\n"
				+ "where product_name like ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				int totalProduct = rs.getInt(1);
				int endPage = totalProduct / 10;
				if(totalProduct % 10 != 0) {
					endPage++;
				}
				return endPage;
			}
 		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	//lay san pham cua tung trang khi tim san pham
	public List<Product> pagingProductByName(int index, String txtSearch) {
		List<Product> list = new ArrayList<>();
		String query = "select * from products\n"
				+ "where product_name like ?\n"
				+ "limit 10 offset ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + txtSearch + "%");
			ps.setInt(2, (index-1)*10 );
			rs = ps.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String src = rs.getString(5);
				String type = rs.getString(6);
				String brand = rs.getString(7);
				
				Product product = new Product(id, name, description, price, src, type, brand);
				list.add(product);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
		
	//them order vao DB
	public void addOrder(String discount, String email) {
		String query = "insert into orders(order_discount_code, order_status, user_mail)\n"
				+ "values (?, null, N?)";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, discount);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
		
	//them items in cart vao DB
	public void addItemInCart(int productID, int orderID, int quantity, float price) {
		String query = "insert into items_in_cart(product_id, order_id, item_quantity, item_price)\n"
				+ "values (?, ?, ?, ?)";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, productID);
			ps.setInt(2, orderID);
			ps.setInt(3, quantity);
			ps.setFloat(4, price);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//lay order id
	public int getOrderId() {
		String query = " SELECT MAX( order_id ) FROM orders";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				int orderId = rs.getInt(1);
				return orderId;
			}
 		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return 0;
	}
	
	//lay danh sach orders cua 1 account
	public List<Orders> getOrdersByEmail(String email) {
		List<Orders> list = new ArrayList<>();
		String query = "select * from orders\n"
				+ "where user_mail = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()) {
				int orderId = rs.getInt(1);
				Date orderDate = rs.getDate(2);
				String discount = rs.getString(3);
				int status = rs.getInt(4);
				String userEmail = rs.getString(5);
				
				Orders order = new Orders(orderId, orderDate, discount, status, userEmail);
				list.add(order);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	//lay danh sach ItemsInCart cua 1 order
	public List<ItemsInCart> getItemsByOrderId(int id) {
		List<ItemsInCart> list = new ArrayList<>();
		String query = "select items_in_cart.*, products.product_name, products.product_img_source from items_in_cart\n"
				+ "inner join products on items_in_cart.product_id = products.product_id\n"
				+ "where items_in_cart.order_id = ?";
		
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				int productId = rs.getInt(1);
				int orderId = rs.getInt(2);
				int quantity = rs.getInt(3);
				float price = rs.getFloat(4);
				String name = rs.getString(5);
				String src = rs.getString(6);
				
				Product product = new Product();
				product.setName(name);
				product.setSrc(src);
				
				ItemsInCart item = new ItemsInCart(productId, orderId, quantity, price, product);
				list.add(item);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}
	
	
//	public static void main(String args[]) {
//		DAO dao = new DAO();
//		List<ItemsInCart> list = dao.getItemsByOrderId2(4);
//		for(ItemsInCart i : list) {
//			System.out.println(i.getProduct().getName());
//		}
//	}
	
}









