package services;

import java.sql.Connection;
import java.util.ArrayList;

import interfaces.IBaiViet;
import models.BaiViet;
import models.DbConnect;

public class BaiVietService implements IBaiViet {
	private Connection conn = null;
	
	public BaiVietService() {
		this.conn = DbConnect.getConnect();
	}
	
	public boolean addBaiViet(BaiViet bv) {
		try {
			String sql = "INSERT INTO baiviets (Title, Description, Content, Image, Author, Hide, CreateDate, View, Id_TheLoaiTin) VALUES ('"
					+ bv.getTitle() + "', '" + bv.getDescription() + "', '" + bv.getContent() + "', '" + bv.getImage()
					+ "', '" + bv.getAuthor() + "', 0,'" + bv.getCreateDate() + "' , 0, " + bv.getIdTheLoaiTin() + ")";
			java.sql.Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateBaiViet(BaiViet bv) {
		try {
			String sql = "UPDATE baiviets SET Title = '" + bv.getTitle() + "', Description = '" + bv.getDescription()
					+ "', Content = '" + bv.getContent() + "', Image = '" + bv.getImage() + "', Author = '"
					+ bv.getAuthor() + "', Hide = " + bv.getHide() + ", CreateDate = '" + bv.getCreateDate()
					+ "', View = " + bv.getView() + ", Id_TheLoaiTin = " + bv.getIdTheLoaiTin() + " WHERE Id = "
					+ bv.getId();
			java.sql.Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteBaiViet(int id) {
		try {
			// Check bai viet co ton tai khong
			var bv = GetBaiVietById(id);
			if (bv == null) {
				return false;
			}
			
			String sql = "UPDATE baiviets SET Hide = 1 WHERE Id = " + id;
			java.sql.Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public ArrayList<BaiViet> GetBaiViets() {
		try {
			ArrayList<BaiViet> list = new ArrayList<BaiViet>();
			String sql = "SELECT * FROM baiviets where Hide = 0 ORDER BY Id DESC";
			var binhLuanService = new BinhLuanService();
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				BaiViet bv = new BaiViet();
				bv.setId(rs.getInt("Id"));
				bv.setTitle(rs.getString("Title"));
				bv.setDescription(rs.getString("Description"));
				bv.setContent(rs.getString("Content"));
				bv.setImage(rs.getString("Image"));
				bv.setAuthor(rs.getString("Author"));
				bv.setHide(rs.getInt("Hide"));
				bv.setCreateDate(rs.getString("CreateDate"));
				bv.setView(rs.getInt("View"));
				bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
				bv.setBinhLuans(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all"));
				list.add(bv);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public ArrayList<BaiViet> GetBaiVietsByTheLoaiTin(int idTheLoaiTin, int limit, String order) {
		try {
			ArrayList<BaiViet> list = new ArrayList<BaiViet>();
			
			String sql = "";
			
			if (limit == 0) {
				sql = "SELECT * FROM baiviets WHERE Hide = 0 and Id_TheLoaiTin = " + idTheLoaiTin + " ORDER BY Id " + order;
			} else {
				sql = "SELECT * FROM baiviets WHERE Hide = 0 and Id_TheLoaiTin = " + idTheLoaiTin + " ORDER BY Id " + order
						+ " LIMIT " + limit;
			}
			var binhLuanService = new BinhLuanService();
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				BaiViet bv = new BaiViet();
				bv.setId(rs.getInt("Id"));
				bv.setTitle(rs.getString("Title"));
				bv.setDescription(rs.getString("Description"));
				bv.setContent(rs.getString("Content"));
				bv.setImage(rs.getString("Image"));
				bv.setAuthor(rs.getString("Author"));
				bv.setHide(rs.getInt("Hide"));
				bv.setCreateDate(rs.getString("CreateDate"));
				bv.setView(rs.getInt("View"));
				bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
				bv.setBinhLuans(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all"));
				list.add(bv);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<BaiViet> GetBaiVietsByTheLoai(int idTheLoai, int limit, String order) {
		try {
			ArrayList<BaiViet> list = new ArrayList<BaiViet>();
			
			String sql = "";
			
			if (limit == 0) {
				sql = "SELECT * FROM baiviets WHERE Hide = 0 and Id_TheLoaiTin IN "
						+ "(SELECT Id FROM theloaitins WHERE Id_TheLoai = " + idTheLoai + ") " + "ORDER BY Id " + order;
			} else {
				sql = "SELECT * FROM baiviets WHERE Id_TheLoaiTin IN "
						+ "(SELECT Id FROM theloaitins WHERE Id_TheLoai = " + idTheLoai + ") "
						+ "ORDER BY Id " + order + " LIMIT " + limit;
            }
			
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			var binhLuanService = new BinhLuanService();
			while (rs.next()) {
				BaiViet bv = new BaiViet();
				bv.setId(rs.getInt("Id"));
				bv.setTitle(rs.getString("Title"));
				bv.setDescription(rs.getString("Description"));
				bv.setContent(rs.getString("Content"));
				bv.setImage(rs.getString("Image"));
				bv.setAuthor(rs.getString("Author"));
				bv.setHide(rs.getInt("Hide"));
				bv.setCreateDate(rs.getString("CreateDate"));
				bv.setView(rs.getInt("View"));
				bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
				bv.setBinhLuans(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all"));
				list.add(bv);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<BaiViet> GetBaiVietsWithLimit(int limit, String order) {
		try {
			String sql = "SELECT * FROM baiviets where Hide = 0 ORDER BY Id " + order + " LIMIT " + limit;
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			ArrayList<BaiViet> list = new ArrayList<BaiViet>();
			var binhLuanService = new BinhLuanService();
			while (rs.next()) {
				BaiViet bv = new BaiViet();
				bv.setId(rs.getInt("Id"));
				bv.setTitle(rs.getString("Title"));
				bv.setDescription(rs.getString("Description"));
				bv.setContent(rs.getString("Content"));
				bv.setImage(rs.getString("Image"));
				bv.setAuthor(rs.getString("Author"));
				bv.setHide(rs.getInt("Hide"));
				bv.setCreateDate(rs.getString("CreateDate"));
				bv.setView(rs.getInt("View"));
				bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
				bv.setBinhLuans(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all"));
				list.add(bv);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public BaiViet GetBaiVietById(int id) {
		try {
			String sql = "SELECT * FROM baiviets WHERE Id = " + id;
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			var binhLuanService = new BinhLuanService();
			if (rs.next()) {
				BaiViet bv = new BaiViet();
                bv.setId(rs.getInt("Id"));
                bv.setTitle(rs.getString("Title"));
                bv.setDescription(rs.getString("Description"));
                bv.setContent(rs.getString("Content"));
                bv.setImage(rs.getString("Image"));
                bv.setAuthor(rs.getString("Author"));
                bv.setHide(rs.getInt("Hide"));
                bv.setCreateDate(rs.getString("CreateDate"));
                bv.setView(rs.getInt("View"));
                bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
                bv.setBinhLuans(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "comment"));
				bv.setCommentCount(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all").size());
                return bv;
            }
		} catch (Exception e) {
			e.printStackTrace();
        }
		return null;
	}

	@Override
	public ArrayList<BaiViet> GetBaiVietsWithName(int limit,String Name){
		try {
			String sql = "SELECT * FROM baiviets Where Hide = 0 and Title Like " + Name + " LIMIT " + limit;
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			ArrayList<BaiViet> list = new ArrayList<BaiViet>();
			var binhLuanService = new BinhLuanService();
			while (rs.next()) {
				BaiViet bv = new BaiViet();
				bv.setId(rs.getInt("Id"));
				bv.setTitle(rs.getString("Title"));
				bv.setDescription(rs.getString("Description"));
				bv.setContent(rs.getString("Content"));
				bv.setImage(rs.getString("Image"));
				bv.setAuthor(rs.getString("Author"));
				bv.setHide(rs.getInt("Hide"));
				bv.setCreateDate(rs.getString("CreateDate"));
				bv.setView(rs.getInt("View"));
				bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
				bv.setBinhLuans(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "comment"));
				bv.setCommentCount(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all").size());
                list.add(bv);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean SaveBaiViet(int idBaiViet, int idUser) {
		try {
			// Check if the user has saved this article
			String sqlCheck = "SELECT * FROM baivietsaves WHERE Id_BaiViet = " + idBaiViet + " AND Id_User = " + idUser;
			java.sql.Statement statementCheck = conn.createStatement();
			java.sql.ResultSet rsCheck = statementCheck.executeQuery(sqlCheck);
			if (rsCheck.next()) {
				return true;
			}
			
			// Save article
			String sql = "INSERT INTO baivietsaves VALUES (" + idUser + ", " + idBaiViet + ")";
			java.sql.Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
            return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean RemoveSavedBaiViet(int idBaiViet, int idUser) {
		try {
			String sql = "DELETE FROM baivietsaves WHERE Id_BaiViet = " + idBaiViet + " AND Id_User = " + idUser;
			java.sql.Statement statement = conn.createStatement();
			statement.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<BaiViet> GetBaiVietSaved(int idUser) {
		ArrayList<BaiViet> list = new ArrayList<BaiViet>();
		try {
			String sql = "Select * from baiviets where Hide = 0 and Id in (Select Id_BaiViet from baivietsaves where Id_User = " + idUser + ")";
			java.sql.Statement statement = conn.createStatement();
			java.sql.ResultSet rs = statement.executeQuery(sql);
			var binhLuanService = new BinhLuanService();
			while (rs.next()) {
                BaiViet bv = new BaiViet();
                bv.setId(rs.getInt("Id"));
                bv.setTitle(rs.getString("Title"));
                bv.setDescription(rs.getString("Description"));
                bv.setContent(rs.getString("Content"));
                bv.setImage(rs.getString("Image"));
                bv.setAuthor(rs.getString("Author"));
                bv.setHide(rs.getInt("Hide"));
                bv.setCreateDate(rs.getString("CreateDate"));
                bv.setView(rs.getInt("View"));
                bv.setIdTheLoaiTin(rs.getInt("Id_TheLoaiTin"));
                bv.setCommentCount(binhLuanService.GetBinhLuansByIdBaiViet(rs.getInt("Id"), "all").size());
                list.add(bv);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
