package models;

public class TraLoiBinhLuanEmotion {
	private int Id_TraloiBinhLuan;
	private int Id_Emotion;
	
	public TraLoiBinhLuanEmotion() {}
	
	public TraLoiBinhLuanEmotion(int id_TraloiBinhLuan, int id_Emotion) {
		Id_TraloiBinhLuan = id_TraloiBinhLuan;
		Id_Emotion = id_Emotion;
	}
	
	// Getters, Setters attributes
	public int getId_TraloiBinhLuan() {
		return Id_TraloiBinhLuan;
	}
	
	public void setId_TraloiBinhLuan(int id_TraloiBinhLuan) {
		Id_TraloiBinhLuan = id_TraloiBinhLuan;
	}
	
	public int getId_Emotion() {
		return Id_Emotion;
	}
	
	public void setId_Emotion(int id_Emotion) {
		Id_Emotion = id_Emotion;
	}
	
	@Override
	public String toString() {
		return "TraLoiBinhLuanEmotion [Id_TraloiBinhLuan=" + Id_TraloiBinhLuan + ", Id_Emotion=" + Id_Emotion + "]";
	}
}
