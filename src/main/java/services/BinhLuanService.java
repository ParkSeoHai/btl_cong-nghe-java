package services;

import java.sql.Connection;
import java.util.ArrayList;

import interfaces.IBinhLuan;
import models.BinhLuan;
import models.DbConnect;

public class BinhLuanService implements IBinhLuan {
	private Connection conn = null;
	
	public BinhLuanService() {
		this.conn = DbConnect.getConnect();
	}
	
	public ArrayList<BinhLuan> GetBinhLuanRepliesByIdBinhLuan(int idBinhLuan) {
		try {
			EmotionService emotionService = new EmotionService();
			
			ArrayList<BinhLuan> list = new ArrayList<BinhLuan>();
			String sql = "SELECT * FROM binhluans WHERE Id_BinhLuan = " + idBinhLuan;
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				BinhLuan bl = new BinhLuan();
				bl.setId(rs.getInt("Id"));
				bl.setContent(rs.getString("Content"));
				bl.setTime(rs.getString("Time"));
				bl.setId_BaiViet(rs.getInt("Id_BaiViet"));
				bl.setId_User(rs.getInt("Id_User"));
				bl.setId_BinhLuan(rs.getInt("Id_BinhLuan"));
				
				// Get list emotion of binhluan
				bl.setBl_Emotions(emotionService.GetEmotionsByIdBinhLuan(bl.getId()));
				list.add(bl);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public ArrayList<BinhLuan> GetBinhLuansByIdBaiViet(int idBaiViet, String type) {
		try {
			EmotionService emotionService = new EmotionService();
			
			ArrayList<BinhLuan> list = new ArrayList<BinhLuan>();
			String sql = "";
			if (type == "all") {
				sql = "SELECT * FROM binhluans WHERE Id_BaiViet = " + idBaiViet;
			} else {
				sql = "SELECT * FROM binhluans WHERE Id_BaiViet = " + idBaiViet + " AND Id_BinhLuan = 0";
			}
			
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			
			while (rs.next()) {
				BinhLuan bl = new BinhLuan();
				bl.setId(rs.getInt("Id"));
				bl.setContent(rs.getString("Content"));
				bl.setTime(rs.getString("Time"));
				bl.setId_BaiViet(idBaiViet);
				bl.setId_User(rs.getInt("Id_User"));
				bl.setId_BinhLuan(rs.getInt("Id_BinhLuan"));
				
				// Get list emotion of binhluan
				bl.setBl_Emotions(emotionService.GetEmotionsByIdBinhLuan(bl.getId()));
				
				// Get list binhluan reply
				bl.setBinhLuansReplies(GetBinhLuanRepliesByIdBinhLuan(bl.getId()));
				list.add(bl);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean AddBinhLuan(BinhLuan bl) {
		try {
			String sql = "INSERT INTO binhluans(Content, Time, Id_BaiViet, Id_User, Id_BinhLuan) VALUES(?, ?, ?, ?, ?)";
			java.sql.PreparedStatement statement = conn.prepareStatement(sql);

			statement.setString(1, bl.getContent());
			statement.setString(2, bl.getTime());
			statement.setInt(3, bl.getId_BaiViet());
			statement.setInt(4, bl.getId_User());
			statement.setInt(5, bl.getId_BinhLuan());

			int rows = statement.executeUpdate();
			if (rows > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
