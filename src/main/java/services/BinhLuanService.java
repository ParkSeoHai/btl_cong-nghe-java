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
	
	@Override
	public ArrayList<BinhLuan> GetBinhLuansByIdBaiViet(int idBaiViet) {
		try {
			ArrayList<BinhLuan> list = new ArrayList<BinhLuan>();
			String sql = "SELECT * FROM binhluans WHERE Id_BaiViet = " + idBaiViet;
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
				list.add(bl);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
