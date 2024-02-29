package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Account;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		DAO dao = new DAO();
		Account acc = dao.login(email, password);
		if(acc == null) {
			request.setAttribute("mess", "Wrong email or password!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if(acc.getRole() == 1) { 
			HttpSession session = request.getSession();
			session.setAttribute("acc", acc);
			response.sendRedirect("/Asm3/admin/admin.jsp");
		} else if(acc.getRole() == 2) { 
//			request.getRequestDispatcher("list").forward(request, response);
			HttpSession session = request.getSession();
			session.setAttribute("acc", acc);
			response.sendRedirect("list");
		}
	}

}
