package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Product;


public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			
			//xu ly paging va hien thi product
			int index;
			if (request.getParameter("index") == null) {
				index = 1;
			} else {
				index = Integer.parseInt(request.getParameter("index"));
			}
			
			DAO dao = new DAO();
			
			int endPage = dao.getNumberPage();
			List<Product> allProducts = dao.pagingProduct(index);
			
			request.setAttribute("allProducts", allProducts);
			request.setAttribute("endPage", endPage);
			request.setAttribute("tag", index);
		    request.setAttribute("redirected", true);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		} catch (Exception e) {
			Logger.getLogger(ListController.class.getName()).log(Level.SEVERE, null, e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
