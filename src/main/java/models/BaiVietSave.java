package models;

public class BaiVietSave {
	private int Id_User;
	private int Id_BaiViet;
	
	public BaiVietSave() {}
	
	public BaiVietSave(int id_User, int id_BaiViet) {
		Id_User = id_User;
		Id_BaiViet = id_BaiViet;
	}
	
	// Getters, Setters attributes	
	public int getId_User() {
		return Id_User;
	}
	
	public void setId_User(int id_User) {
		Id_User = id_User;
	}
	
	public int getId_BaiViet() {
		return Id_BaiViet;
	}
	
	public void setId_BaiViet(int id_BaiViet) {
		Id_BaiViet = id_BaiViet;
	}
	
	
	@Override
	public String toString() {
		return "BaiVietSave [Id_User=" + Id_User + ", Id_BaiViet=" + Id_BaiViet + "]";
	}
}
