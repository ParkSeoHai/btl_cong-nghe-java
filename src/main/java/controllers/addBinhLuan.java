package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.BinhLuan;
import services.BinhLuanService;

import java.io.BufferedReader;
import java.io.IOException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class addBinhLuan
 */
@WebServlet("/addBinhLuanAction")
public class addBinhLuan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addBinhLuan() {
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

        String content = jsonObject.get("content").getAsString();
        String time = jsonObject.get("time").getAsString();
        String id_baiViet = jsonObject.get("id_baiViet").getAsString();
        String id_user = jsonObject.get("id_user").getAsString();
        String id_binhLuan = jsonObject.get("id_binhLuan").getAsString();
        
        // Create a new BinhLuan object
        BinhLuan bl = new BinhLuan();
        bl.setContent(content);
        bl.setTime(time);
        bl.setId_BaiViet(Integer.parseInt(id_baiViet));
        bl.setId_User(Integer.parseInt(id_user));
        bl.setId_BinhLuan(Integer.parseInt(id_binhLuan));

        // Add the BinhLuan object to the database
        BinhLuanService blService = new BinhLuanService();
        boolean result = blService.AddBinhLuan(bl);

        // Send a response back to the client
        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(result));
	}

}
