package models;

public class TheLoai {
	private int Id;
	private String Name;
	private int IndexShow;
	private int Hide;
	private String TextUrl;
	
	public TheLoai() {}
	
	public TheLoai(int id, String name, int indexShow, int hide, String textUrl) {
		Id = id;
		Name = name;
		IndexShow = indexShow;
		Hide = hide;
		TextUrl = textUrl;
	}
	
	// Getters, Setters attributes
	public int getId() {
		return Id;
	}
	
	public void setId(int id) {
		Id = id;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
	}
	
	public int getIndexShow() {
		return IndexShow;
	}
	
	public void setIndexShow(int indexShow) {
		IndexShow = indexShow;
	}
	
	public int getHide() {
		return Hide;
	}
	
	public void setHide(int hide) {
		Hide = hide;
	}
	
	public String getTextUrl() {
		return TextUrl;
	}
	
	public void setTextUrl(String textUrl) {
		TextUrl = textUrl;
	}
	
	@Override
	public String toString() {
		return "TheLoai [Id=" + Id + ", Name=" + Name + ", IndexShow=" + IndexShow + ", Hide=" + Hide + ", TextUrl="
				+ TextUrl + "]";
	}
}
