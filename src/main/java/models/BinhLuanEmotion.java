package models;

public class BinhLuanEmotion {
	private int Id_BinhLuan;
	private int Id_Emotion;
	
	public BinhLuanEmotion() {}
	
	public BinhLuanEmotion(int id_BinhLuan, int id_Emotion) {
		Id_BinhLuan = id_BinhLuan;
		Id_Emotion = id_Emotion;
	}
	
	// Getters, Setters attributes
	public int getId_BinhLuan() {
		return Id_BinhLuan;
	}

	public void setId_BinhLuan(int id_BinhLuan) {
		Id_BinhLuan = id_BinhLuan;
	}
	
	public int getId_Emotion() {
		return Id_Emotion;
	}

	public void setId_Emotion(int id_Emotion) {
		Id_Emotion = id_Emotion;
	}
	
	@Override
	public String toString() {
		return "BinhLuanEmotion [Id_BinhLuan=" + Id_BinhLuan + ", Id_Emotion=" + Id_Emotion + "]";
	}
}
