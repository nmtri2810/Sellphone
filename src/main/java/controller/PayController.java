package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Account;
import model.ItemsInCart;
import model.Orders;


public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PayController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession();
			Account acc = (Account) session.getAttribute("acc");
			Orders order = (Orders) session.getAttribute("order");
			
			if(acc == null) {
				request.setAttribute("mess", "Please log in your account or sign up to purchase!");
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			} else {
				if(order == null || Float.parseFloat((String) session.getAttribute("total")) == 0.00) {
					request.setAttribute("mess", "Please select a product!");
					request.getRequestDispatcher("cart.jsp").forward(request, response);
				} else {
					String discount = request.getParameter("discount");
					//tam thoi khong co discount code
					if(discount != "") {
						request.setAttribute("mess", "Invalid discount code!");
						request.getRequestDispatcher("cart.jsp").forward(request, response);
					} else {
						List<ItemsInCart> listItems = order.getItems();
						
						DAO dao = new DAO();
						
						dao.addOrder(discount, acc.getEmail());
						for(ItemsInCart item : listItems) {
							dao.addItemInCart(item.getProduct().getId(), dao.getOrderId(), item.getQuantity(), item.getPrice());
						}
						
						session.removeAttribute("order");
						request.getRequestDispatcher("success.jsp").forward(request, response);
					}
				}
			}
		
		} catch (Exception e) {
			response.getWriter().println(e);
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
