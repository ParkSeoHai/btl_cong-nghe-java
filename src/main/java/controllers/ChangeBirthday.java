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
 * Servlet implementation class ChangeBirthday
 */
@WebServlet("/ChangeBirthdayAction")
public class ChangeBirthday extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBirthday() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String day = request.getParameter("day").trim();
		String month = request.getParameter("month").trim();
		String year = request.getParameter("year").trim();
		String birthday = year+"-"+month+"-"+day;
		HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        
        UserService userService = new UserService();
        User user = userService.updateBirthday(email, birthday);
        
        response.sendRedirect("views/Infomation-user.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
