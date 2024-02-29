package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.ItemsInCart;
import model.Orders;
import model.Product;

public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		int id;
		//lay id san pham
		if(request.getParameter("id") != null) {
			id = Integer.parseInt(request.getParameter("id"));	
			
			DAO dao = new DAO();
			
			//lay san pham dua tren id
			Product product = dao.getProductByID(id);
			
			HttpSession session = request.getSession();
			//kiem tra da co session order chua, chua co thi tao order moi, them item vao order
			if(session.getAttribute("order") == null) {
				Orders order = new Orders();
				List<ItemsInCart> listItems = new ArrayList<>();
				ItemsInCart item = new ItemsInCart();
				
				item.setQuantity(1);
				item.setProduct(product);
				item.setPrice(product.getPrice());
				
				listItems.add(item);
				order.setItems(listItems);
				
				float total = 0;
				for(ItemsInCart i : listItems) {
					total += i.getPrice();
				}
				
				session.setAttribute("total", String.format("%.2f", total));
				session.setAttribute("order", order);
			} else {
				//order da co, kiem tra item da ton tai chua
				Orders order = (Orders) session.getAttribute("order");
				List<ItemsInCart> listItems = order.getItems();
				boolean checkExist = false;
				for(ItemsInCart item : listItems) {
					if(item.getProduct().getId() == product.getId()) {
						//kiem tra action cong tru xoa product
						String action = request.getParameter("action");
						if(action != null && action.equalsIgnoreCase("plus")) {
							item.setQuantity(item.getQuantity() + 1);
						} else if(action != null && action.equalsIgnoreCase("minus")) {
							item.setQuantity(item.getQuantity() - 1);
						} else if(action != null && action.equalsIgnoreCase("delete")) {
							listItems.remove(item);
							
							float total = 0;
							for(ItemsInCart i : listItems) {
								total += i.getPrice();
							}
							
							session.setAttribute("total", String.format("%.2f", total));
							response.sendRedirect("cart.jsp");
							return;
						}
						item.setPrice(product.getPrice() * item.getQuantity());
						checkExist = true;
					}
				}
				if(checkExist == false) {
					ItemsInCart item = new ItemsInCart();
					
					item.setQuantity(1);
					item.setProduct(product);
					item.setPrice(product.getPrice());
					
					listItems.add(item);
				}
				
				float total = 0;
				for(ItemsInCart i : listItems) {
					total += i.getPrice();
				}
				
				session.setAttribute("total", String.format("%.2f", total));
				session.setAttribute("order", order);
			}
			response.sendRedirect("cart.jsp");
		} else {
			response.sendRedirect("cart.jsp");
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
