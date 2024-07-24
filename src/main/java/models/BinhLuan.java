package models;

import java.util.ArrayList;

public class BinhLuan {
	private int Id;
	private String Content;
	private String Time;
	private int Id_BaiViet;
	private int Id_User;
	private int Id_BinhLuan;
	
	private ArrayList<BinhLuanEmotion> Bl_Emotions;
	private ArrayList<BinhLuan> binhLuansReplies;
	
	public BinhLuan() {}
	
	public BinhLuan(int id, String content, String time,
			int id_BaiViet, int id_User) {
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

	public int getId_BinhLuan() {
		return Id_BinhLuan;
	}

	public void setId_BinhLuan(int id_BinhLuan) {
		Id_BinhLuan = id_BinhLuan;
	}
	
	public ArrayList<BinhLuanEmotion> getBl_Emotions() {
		return Bl_Emotions;
	}
	
	public void setBl_Emotions(ArrayList<BinhLuanEmotion> bl_Emotions) {
		Bl_Emotions = bl_Emotions;
	}
	
	public ArrayList<BinhLuan> getBinhLuansReplies() {
		return binhLuansReplies;
	}
	
	public void setBinhLuansReplies(ArrayList<BinhLuan> binhLuansReplies) {
		this.binhLuansReplies = binhLuansReplies;
	}
}
