package models;

public class BaiViet {
	private int Id;
	private String Title;
	private String Description;
	private String Content;
	private String Image;
	private String Author;
	private int Hide;
	private String CreateDate;
	private int View;
	private int IdTheLoaiTin;
	
	public BaiViet() {}
	
	public BaiViet(int id, String title, String description, String content, String image, String author, int hide,
			String createDate, int view, int idTheLoaiTin) {
		Id = id;
		Title = title;
		Description = description;
		Content = content;
		Image = image;
		Author = author;
		Hide = hide;
		CreateDate = createDate;
		View = view;
		IdTheLoaiTin = idTheLoaiTin;
	}
	
	// Getters, Setters attributes
	public int getId() {
		return Id;
	}
	
	public void setId(int id) {
		Id = id;
	}
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		Title = title;
	}
	
	public String getDescription() {
		return Description;
	}
	
	public void setDescription(String description) {
		Description = description;
	}
	
	public String getContent() {
		return Content;
	}
	
	public void setContent(String content) {
		Content = content;
	}
	
	public String getImage() {
		return Image;
	}
	
	public void setImage(String image) {
		Image = image;
	}
	
	public String getAuthor() {
		return Author;
	}
	
	public void setAuthor(String author) {
		Author = author;
	}
	
	public int getHide() {
		return Hide;
	}
	
	public void setHide(int hide) {
		Hide = hide;
	}
	
	public String getCreateDate() {
		return CreateDate;
	}
	
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	
	public int getView() {
		return View;
	}
	
	public void setView(int view) {
		View = view;
	}
	
	public int getIdTheLoaiTin() {
		return IdTheLoaiTin;
	}
	
	public void setIdTheLoaiTin(int idTheLoaiTin) {
		IdTheLoaiTin = idTheLoaiTin;
	}
	
	@Override
	public String toString() {
		return "BaiViet [Id=" + Id + ", Title=" + Title + ", Description=" + Description + ", Content=" + Content
				+ ", Image=" + Image + ", Author=" + Author + ", Hide=" + Hide + ", CreateDate=" + CreateDate
				+ ", View=" + View + ", IdTheLoaiTin=" + IdTheLoaiTin + "]";
	}
}
