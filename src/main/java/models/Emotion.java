package models;

public class Emotion {
	private int Id;
	private String Name;
	private String Icon;
	
	public Emotion() {}
	
	public Emotion(int id, String name, String icon) {
		Id = id;
		Name = name;
		Icon = icon;
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
	
	public String getIcon() {
		return Icon;
	}
	
	public void setIcon(String icon) {
		Icon = icon;
	}
	
	@Override
	public String toString() {
		return "Emotion [Id=" + Id + ", Name=" + Name + ", Icon=" + Icon + "]";
	}
}
