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
			conn = models.DbConnect.getConnect();
			String sql = "Select * from theloais Order by IndexShow ASC";
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
			conn = models.DbConnect.getConnect();
			String sql = "Select * from theloaitins where Id_TheLoai = ? Order by IndexShow ASC";
			var ps = conn.prepareStatement(sql);
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

}