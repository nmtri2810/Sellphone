package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Product;


public class InformationProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public InformationProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			
			int id = Integer.parseInt(request.getParameter("id"));
			DAO dao = new DAO();
			Product product = dao.getProductByID(id);
			
			request.setAttribute("product", product);
			request.getRequestDispatcher("infoProduct.jsp").forward(request, response);
			
		} catch (Exception e) {
			response.getWriter().println(e);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
