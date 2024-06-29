package models;

public class BinhLuanEmotion {
	private int Id_BinhLuan;
	private int Id_Emotion;
	private Emotion emotion;
	private int Count;
	
	public BinhLuanEmotion() {}
	
	public BinhLuanEmotion(int id_BinhLuan, int id_Emotion, int count) {
		Id_BinhLuan = id_BinhLuan;
		Id_Emotion = id_Emotion;
		Count = count;
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
	
	public int getCount() {
		return Count;
	}
	
	public void setCount(int count) {
		Count = count;
	}
	
	public Emotion getEmotion() {
		return emotion;
	}
	
	public void setEmotion(Emotion emotion) {
		this.emotion = emotion;
	}
	
	@Override
	public String toString() {
		return "BinhLuanEmotion [Id_BinhLuan=" + Id_BinhLuan + ", Id_Emotion=" + Id_Emotion + "]";
	}
}
