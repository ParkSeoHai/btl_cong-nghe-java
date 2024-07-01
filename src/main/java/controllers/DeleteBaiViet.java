package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.BaiVietService;

import java.io.IOException;

/**
 * Servlet implementation class DeleteBaiViet
 */
@WebServlet("/BaiViet/Delete")
public class DeleteBaiViet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBaiViet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id != null && !id.isEmpty()) {
			boolean result = new BaiVietService().deleteBaiViet(Integer.parseInt(id));
			if (result) {
				response.sendRedirect(request.getContextPath() + "/views/admin.jsp");
			} else {
				response.getWriter().append("Xoa bai viet that bai!");
			}
		} else {
			response.getWriter().append("Id bai viet khong hop le!");
		}
	}

}
