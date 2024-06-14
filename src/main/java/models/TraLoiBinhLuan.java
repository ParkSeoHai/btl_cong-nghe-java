package models;

public class TraLoiBinhLuan {
	private int Id;
	private String Content;
	private String Time;
	private int Id_BinhLuan;
	private int Id_User;
	
	public TraLoiBinhLuan() {}
	
	public TraLoiBinhLuan(int id, String content, String time, int id_BinhLuan, int id_User) {
		Id = id;
		Content = content;
		Time = time;
		Id_BinhLuan = id_BinhLuan;
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
	
	public int getId_BinhLuan() {
		return Id_BinhLuan;
	}
	
	public void setId_BinhLuan(int id_BinhLuan) {
		Id_BinhLuan = id_BinhLuan;
	}
	
	public int getId_User() {
		return Id_User;
	}
	
	public void setId_User(int id_User) {
		Id_User = id_User;
	}
	
	@Override
	public String toString() {
		return "TraLoiBinhLuan [Id=" + Id + ", Content=" + Content + ", Time=" + Time + ", Id_BinhLuan=" + Id_BinhLuan
				+ ", Id_User=" + Id_User + "]";
	}
}
