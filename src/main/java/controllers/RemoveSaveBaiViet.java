package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.BaiVietService;

import java.io.BufferedReader;
import java.io.IOException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class RemoveSaveBaiViet
 */
@WebServlet("/RemoveSaveBaiVietAction")
public class RemoveSaveBaiViet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveSaveBaiViet() {
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

        String id_baiViet = jsonObject.get("id_baiViet").getAsString();
        String id_user = jsonObject.get("id_user").getAsString();

        // Call the service
        BaiVietService bvService = new BaiVietService();
        boolean result = bvService.RemoveSavedBaiViet(Integer.parseInt(id_baiViet), Integer.parseInt(id_user));

        // Send a response back to the client
        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(result));
	}

}
