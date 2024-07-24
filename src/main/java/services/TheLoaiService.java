package services;

import java.sql.Connection;
import java.util.ArrayList;

import interfaces.ITheLoai;
import models.TheLoai;
import models.TheLoaiTin;

public class TheLoaiService implements ITheLoai {
	private Connection conn = null;

	@Override
	public ArrayList<TheLoai> getTheloais() {
		try {
			ArrayList<TheLoai> theLoais = new ArrayList<TheLoai>();
			String sql = "Select * from theloais where Hide = 0 Order by IndexShow ASC";
			this.conn = models.DbConnect.getConnect();
			var ps = conn.prepareStatement(sql);
			var rs = ps.executeQuery();
			while (rs.next()) {
				TheLoai theLoai = new TheLoai(rs.getInt("Id"), rs.getString("Name"), rs.getInt("IndexShow"),
						rs.getInt("Hide"), rs.getString("TextUrl"));
				// Get TheLoaiTins by IdTheLoai
				ArrayList<TheLoaiTin> theLoaiTins = getTheLoaiTinsByIdTheLoai(theLoai.getId());
				theLoai.setTheLoaiTins(theLoaiTins);
				theLoais.add(theLoai);
			}
			models.DbConnect.closeConnect(conn);
			return theLoais;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<TheLoaiTin> getTheLoaiTinsByIdTheLoai(int id) {
		try {
			ArrayList<TheLoaiTin> theLoaiTins = new ArrayList<TheLoaiTin>();
			String sql = "Select * from theloaitins where Id_TheLoai = ? and Hide = 0 Order by IndexShow ASC";
			this.conn = models.DbConnect.getConnect();
			var ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			var rs = ps.executeQuery();
			while (rs.next()) {
				TheLoaiTin theLoaiTin = new TheLoaiTin(rs.getInt("Id"), rs.getString("Name"), rs.getInt("IndexShow"), 
						rs.getInt("Hide"), rs.getString("TextUrl"), rs.getInt("HideGroup"), rs.getInt("Id_TheLoai"));
				theLoaiTins.add(theLoaiTin);
			}
			models.DbConnect.closeConnect(conn);
			return theLoaiTins;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public TheLoai getTheLoaiByTextUrl(String textUrl) {
		try {
			String sql = "Select * from theloais where TextUrl = ?";
			this.conn = models.DbConnect.getConnect();
			var ps = this.conn.prepareStatement(sql);
			ps.setString(1, textUrl);
			var rs = ps.executeQuery();
			if (rs.next()) {
				TheLoai theLoai = new TheLoai(rs.getInt("Id"), rs.getString("Name"), rs.getInt("IndexShow"),
						rs.getInt("Hide"), rs.getString("TextUrl"));
				theLoai.setTheLoaiTins(getTheLoaiTinsByIdTheLoai(theLoai.getId()));
				models.DbConnect.closeConnect(conn);
				return theLoai;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public TheLoaiTin getTheLoaiTinByTextUrl(String textUrl) {
		try {
			String sql = "Select * from theloaitins where TextUrl = ?";
			this.conn = models.DbConnect.getConnect();
			var ps = this.conn.prepareStatement(sql);
			ps.setString(1, textUrl);
			var rs = ps.executeQuery();
			if (rs.next()) {
				TheLoaiTin theLoaiTin = new TheLoaiTin(rs.getInt("Id"), rs.getString("Name"), rs.getInt("IndexShow"),
						rs.getInt("Hide"), rs.getString("TextUrl"), rs.getInt("HideGroup"), rs.getInt("Id_TheLoai"));
				models.DbConnect.closeConnect(conn);
				return theLoaiTin;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public TheLoaiTin getTheLoaiTinById(int id) {
		try {
			String sql = "Select * from theloaitins where Id = ?";
			this.conn = models.DbConnect.getConnect();
			var ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			var rs = ps.executeQuery();
			if (rs.next()) {
				TheLoaiTin theLoaiTin = new TheLoaiTin(rs.getInt("Id"), rs.getString("Name"), rs.getInt("IndexShow"),
						rs.getInt("Hide"), rs.getString("TextUrl"), rs.getInt("HideGroup"), rs.getInt("Id_TheLoai"));
				models.DbConnect.closeConnect(conn);
				return theLoaiTin;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public TheLoai getTheLoaiById(int id) {
		try {
			String sql = "Select * from theloais where Id = ?";
			this.conn = models.DbConnect.getConnect();
			var ps = this.conn.prepareStatement(sql);
			ps.setInt(1, id);
			var rs = ps.executeQuery();
			if (rs.next()) {
				TheLoai theLoai = new TheLoai(rs.getInt("Id"), rs.getString("Name"), rs.getInt("IndexShow"),
						rs.getInt("Hide"), rs.getString("TextUrl"));
				theLoai.setTheLoaiTins(getTheLoaiTinsByIdTheLoai(theLoai.getId()));
				models.DbConnect.closeConnect(conn);
				return theLoai;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}

