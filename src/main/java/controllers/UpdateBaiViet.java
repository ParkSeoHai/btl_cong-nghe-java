package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.BaiViet;
import services.BaiVietService;

import java.io.BufferedReader;
import java.io.IOException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class UpdateBaiViet
 */
@WebServlet("/UpdateBaiVietAction")
public class UpdateBaiViet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBaiViet() {
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
		BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(reader, JsonObject.class);

        String id = jsonObject.get("id").getAsString();
        String title = jsonObject.get("title").getAsString();
        String desc = jsonObject.get("description").getAsString();
        String author = jsonObject.get("author").getAsString();
        String category = jsonObject.get("category").getAsString();
        String image = jsonObject.get("image").getAsString();
        String content = jsonObject.get("content").getAsString();
        
        BaiVietService bvService = new BaiVietService();
        
        BaiViet bv = bvService.GetBaiVietById(Integer.parseInt(id));
		if (bv == null) {
			System.out.println("Bai viet khong ton tai");
			response.setContentType("text/plain");
			response.getWriter().write("false");
			return;
		}
		bv.setTitle(title);
		bv.setDescription(desc);
		bv.setAuthor(author);
		bv.setIdTheLoaiTin(Integer.parseInt(category));
		if (!image.equals("")) {
			bv.setImage(image);
		}
		bv.setContent(content);

        // Add the Baiviet object to the database
        boolean result = bvService.updateBaiViet(bv);

        // Send a response back to the client
        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(result));
	}
}
