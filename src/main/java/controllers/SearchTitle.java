package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.BaiViet;
import services.BaiVietService;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class SearchTitleBV
 */

@WebServlet("SearchTitleAction")
public class SearchTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTitle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("title");
		String title = "%" +name+ "%";
		int limit = 15;
		
		BaiVietService bvservide = new BaiVietService();
		ArrayList<BaiViet> baiViets = bvservide.GetBaiVietsWithName(limit, title);
		
		request.setAttribute("baiviets", baiViets);
		
		response.sendRedirect("views/search-view.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
