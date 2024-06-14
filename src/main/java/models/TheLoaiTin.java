package models;

public class TheLoaiTin extends TheLoai {
	private int HideGroup;
	private int IdTheLoai;

	public TheLoaiTin() {
		super();
	}

	public TheLoaiTin(int id, String name, int indexShow, int hide, String textUrl, int hideGroup, int idTheLoai) {
		super(id, name, indexShow, hide, textUrl);
		this.HideGroup = hideGroup;
		this.IdTheLoai = idTheLoai;
	}

	// Getters, Setters attributes
	public int getHideGroup() {
		return HideGroup;
	}

	public void setHideGroup(int hideGroup) {
		HideGroup = hideGroup;
	}

	public int getIdTheLoai() {
		return IdTheLoai;
	}

	public void setIdTheLoai(int idTheLoai) {
		IdTheLoai = idTheLoai;
	}

	@Override
	public String toString() {
		return "TheLoaiTin [Id=" + getId() + ", Name=" + getName() + ", IndexShow=" + getIndexShow() + ", Hide="
				+ getHide() + ", TextUrl=" + getTextUrl() + ", HideGroup=" + HideGroup + ", IdTheLoai=" + IdTheLoai
				+ "]";
	}
}
