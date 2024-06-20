package interfaces;

import java.util.ArrayList;

import models.BinhLuan;

public interface IBinhLuan {
	public ArrayList<BinhLuan> GetBinhLuansByIdBaiViet(int idBaiViet);
}
