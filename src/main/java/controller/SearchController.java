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


public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			
			String txtSearch = request.getParameter("txt");
			
			int indexSearch;
			if (request.getParameter("index") == null) {
				indexSearch = 1;
			} else {
				indexSearch = Integer.parseInt(request.getParameter("index"));
			}
			
			DAO dao = new DAO();
			
			int endPageSearch = dao.getNumberPageByName(txtSearch);
			if(endPageSearch == 1) {
				endPageSearch = 0;
			}
			List<Product> allProducts = dao.pagingProductByName(indexSearch, txtSearch);
			if(allProducts.size() == 0) {
				allProducts = null;
			}
			
			request.setAttribute("allProducts", allProducts);
			request.setAttribute("endPageSearch", endPageSearch);
			request.setAttribute("tagSearch", indexSearch);
			request.setAttribute("txtSearch", txtSearch);
		    request.setAttribute("redirected", true);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
		} catch (Exception e) {
			Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
