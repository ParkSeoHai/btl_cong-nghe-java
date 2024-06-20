package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

/**
 * Servlet implementation class Register
 */

@WebServlet("/RegisterAction")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
        String email = request.getParameter("email_register").trim();
        String password = request.getParameter("password_register").trim();
        String name = "user" + (int) (Math.random() * 1000000);
        String createDate = new Date(System.currentTimeMillis()).toString();
        String image = "https://th.bing.com/th?q=Facebook+Default+Page+Profile+Pic&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.3&pid=InlineBlock&mkt=en-WW&cc=VN&setlang=en&adlt=moderate&t=1&mw=247";
        var user = new models.User(0, name, email, password, 1, image, "", 0, "", "", createDate);
        
        // Check email is existed
        try {
            var service = new services.UserService();
            if (service.checkEmail(email)) {
            	request.setAttribute("errorRegister", "Email đã tồn tại");
                request.getRequestDispatcher("views/login.jsp").forward(request, response);
            } else {
                // Register
				if (service.register(user)) {
					request.getRequestDispatcher("views/login.jsp").forward(request, response);
				} else {
					request.setAttribute("errorRegister", "Đăng ký thất bại");
					request.getRequestDispatcher("views/login.jsp").forward(request, response);
				}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
