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
 * Servlet implementation class ChangeEmail
 */
@WebServlet("/ChangeEmailAction")
public class ChangeEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("Email").trim();
		
		HttpSession session = request.getSession();
        String emailSS = (String) session.getAttribute("email");
        
        UserService userService = new UserService();
        
       if(userService.checkEmail(email)) {
    	   request.setAttribute("emailExistsMessage", "Email đã tồn tại.");
    	   request.getRequestDispatcher("/views/Infomation-user.jsp").forward(request, response);
       }else {
    	   User user = userService.updateEmail(emailSS, email);
    	   response.sendRedirect("views/login.jsp");
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
