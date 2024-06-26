package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.User;
import services.UserService;

import java.io.IOException;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePasswordAction")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pass = request.getParameter("Password").trim();
		String pass2 = request.getParameter("ConfirmPass").trim();
		
		HttpSession httpsession = request.getSession();
		String email = (String) httpsession.getAttribute("email");
		UserService userService = new UserService();
		
		if(!pass.equals(pass2)) {
			request.setAttribute("PassInvalid", "Xác nhận mật khẩu không chính xác.");
	    	request.getRequestDispatcher("/views/Infomation-user.jsp").forward(request, response);
		}
		else {
			if(pass.length() < 6) {
				request.setAttribute("PassInvalid2", "Mật khẩu phải dài hơn 6 kí tự");
		    	request.getRequestDispatcher("/views/Infomation-user.jsp").forward(request, response);
			}else {
				User user = userService.updatePassword(email, pass);
		    	   response.sendRedirect("views/Infomation-user.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
