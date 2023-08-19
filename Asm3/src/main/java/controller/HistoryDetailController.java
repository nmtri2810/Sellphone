package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.ItemsInCart;


public class HistoryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HistoryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		DAO dao = new DAO();
		List<ItemsInCart> listItems = dao.getItemsByOrderId(orderId);
		
		float total = 0;
		for(ItemsInCart item : listItems) {
			total += item.getPrice();
		}
		
		request.setAttribute("listItems", listItems);
		request.setAttribute("total", total);
		request.getRequestDispatcher("orderHistoryDetails.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
