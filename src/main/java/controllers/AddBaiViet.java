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
 * Servlet implementation class AddBaiViet
 */
@WebServlet("/AddBaiVietAction")
public class AddBaiViet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBaiViet() {
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

        String title = jsonObject.get("title").getAsString();
        String desc = jsonObject.get("description").getAsString();
        String author = jsonObject.get("author").getAsString();
        String category = jsonObject.get("category").getAsString();
        String image = jsonObject.get("image").getAsString();
        String content = jsonObject.get("content").getAsString();
        String createdDate = jsonObject.get("createDate").getAsString();
        
        // Create a new BaiViet object
        BaiViet bv = new BaiViet();
        bv.setTitle(title);
        bv.setDescription(desc);
        bv.setAuthor(author);
        bv.setIdTheLoaiTin(Integer.parseInt(category));
        bv.setImage(image);
        bv.setContent(content);
        bv.setCreateDate(createdDate);

        // Add the Baiviet object to the database
        BaiVietService bvService = new BaiVietService();
        boolean result = bvService.addBaiViet(bv);

        // Send a response back to the client
        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(result));
	}

}
