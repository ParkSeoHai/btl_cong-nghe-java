package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginController
 */

@WebServlet("/LoginAction")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String email = request.getParameter("email_login").trim();
        String password = request.getParameter("password_login").trim();
        
        try {
            var service = new services.UserService();
            if (service.login(email, password)) {
                // Set session
                request.getSession().setAttribute("email", email);
                response.sendRedirect("views/home.jsp");
            } else {
                request.setAttribute("errorLogin", "Email hoặc mật khẩu không đúng");
                request.getRequestDispatcher("views/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
