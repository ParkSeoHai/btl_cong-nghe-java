package interfaces;

import java.util.ArrayList;

import models.TheLoai;
import models.TheLoaiTin;

public interface ITheLoai {
	public ArrayList<TheLoai> getTheloais();
	public TheLoai getTheLoaiByTextUrl(String textUrl);
	public ArrayList<TheLoaiTin> getTheLoaiTinsByIdTheLoai(int id);
	public TheLoaiTin getTheLoaiTinByTextUrl(String textUrl);
	public TheLoaiTin getTheLoaiTinById(int id);
	public TheLoai getTheLoaiById(int id);
}
