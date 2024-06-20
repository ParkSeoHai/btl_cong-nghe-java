package models;

public class BinhLuan {
	private int Id;
	private String Content;
	private String Time;
	private int Id_BaiViet;
	private int Id_User;
	
	public BinhLuan() {}
	
	public BinhLuan(int id, String content, String time, int id_BaiViet, int id_User) {
		Id = id;
		Content = content;
		Time = time;
		Id_BaiViet = id_BaiViet;
		Id_User = id_User;
	}
	
	// Getters, Setters attributes
	public int getId() {
		return Id;
	}
	
	public void setId(int id) {
		Id = id;
	}
	
	public String getContent() {
		return Content;
	}
	
	public void setContent(String content) {
		Content = content;
	}
	
	public String getTime() {
		return Time;
	}
	
	public void setTime(String time) {
		Time = time;
	}
	
	public int getId_BaiViet() {
		return Id_BaiViet;
	}
	
	public void setId_BaiViet(int id_BaiViet) {
		Id_BaiViet = id_BaiViet;
	}
	
	public int getId_User() {
		return Id_User;
	}
	
	public void setId_User(int id_User) {
		Id_User = id_User;
	}
	
	@Override
	public String toString() {
		return "BinhLuan [Id=" + Id + ", Content=" + Content + ", Time=" + Time + ", Id_BaiViet=" + Id_BaiViet
				+ ", Id_User=" + Id_User + "]";
	}
}
