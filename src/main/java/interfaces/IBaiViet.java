package interfaces;

import java.util.ArrayList;

import models.BaiViet;

public interface IBaiViet {
	public ArrayList<BaiViet> GetBaiViets();
	public ArrayList<BaiViet> GetBaiVietsWithLimit(int limit, String order);
	public ArrayList<BaiViet> GetBaiVietsByTheLoai(int idTheLoai, int limit, String order);
	public ArrayList<BaiViet> GetBaiVietsByTheLoaiTin(int idTheLoaiTin, int limit, String order);
	public BaiViet GetBaiVietById(int id);
}
