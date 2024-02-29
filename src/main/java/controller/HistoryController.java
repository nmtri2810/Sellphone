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
import model.Orders;


public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("acc");
		
		DAO dao = new DAO();
		List<Orders> list = dao.getOrdersByEmail(acc.getEmail());
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
