package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Account;


public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SignUpController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String re_password = request.getParameter("repassword");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		if(!password.equals(re_password)) {
//			response.sendRedirect("login.jsp");
			request.setAttribute("mess", "Passwords do not match!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			DAO dao = new DAO();
			Account acc = dao.checkAccountExist(email);
			if(acc == null) {
				dao.signUp(email, password, address, phone);
				acc = dao.login(email, password);
				HttpSession session = request.getSession();
				session.setAttribute("acc", acc);
				response.sendRedirect("list");
			} else {
//				response.sendRedirect("login.jsp");
				request.setAttribute("mess", "Email already exists!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	}

}
