package interfaces;

import java.util.ArrayList;

import models.TheLoai;
import models.TheLoaiTin;

public interface ITheLoai {
	public ArrayList<TheLoai> getTheloais();
	public ArrayList<TheLoaiTin> getTheLoaiTinsByIdTheLoai(int id);
}
