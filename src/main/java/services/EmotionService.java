package services;

import java.util.ArrayList;

import interfaces.IEmotion;
import models.BinhLuanEmotion;
import models.Emotion;

public class EmotionService implements IEmotion {

	@Override
	public ArrayList<Emotion> getAllEmotion() {
		ArrayList<Emotion> list = new ArrayList<Emotion>();
		try {
			var conn = models.DbConnect.getConnect();
			String sql = "SELECT * FROM emotions";
			var ps = conn.prepareStatement(sql);
			var rs = ps.executeQuery();
			while (rs.next()) {
				Emotion emotion = new Emotion();
				emotion.setId(rs.getInt("id"));
				emotion.setName(rs.getString("name"));
				emotion.setIcon(rs.getString("icon"));
				list.add(emotion);
			}
			models.DbConnect.closeConnect(conn);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Emotion getEmotionById(int id) {
		try {
			Emotion emotion = new Emotion();
			var conn = models.DbConnect.getConnect();
			String sql = "SELECT * FROM emotions WHERE id = " + id;
			var ps = conn.prepareStatement(sql);
			var rs = ps.executeQuery();
			if (rs.next()) {
				emotion.setId(rs.getInt("id"));
				emotion.setName(rs.getString("name"));
				emotion.setIcon(rs.getString("icon"));
				models.DbConnect.closeConnect(conn);
				return emotion;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<BinhLuanEmotion> GetEmotionsByIdBinhLuan(int idBinhluan) {
		try {
			ArrayList<BinhLuanEmotion> list = new ArrayList<BinhLuanEmotion>();
			var conn = models.DbConnect.getConnect();
			String sql = "SELECT * FROM binhluanemotion WHERE Id_BinhLuan = " + idBinhluan;
			var ps = conn.prepareStatement(sql);
			var rs = ps.executeQuery();
			while (rs.next()) {
				BinhLuanEmotion emotion = new BinhLuanEmotion();
				emotion.setId_Emotion(rs.getInt("Id_Emotion"));
				emotion.setId_BinhLuan(rs.getInt("Id_BinhLuan"));
                emotion.setCount(rs.getInt("count"));
                emotion.setEmotion(getEmotionById(emotion.getId_Emotion()));
				list.add(emotion);
			}
			models.DbConnect.closeConnect(conn);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Emotion getEmotionBy_IdBinhLuan_idEmotion(int idBinhLuan, int idEmotion) {
		try {
            var conn = models.DbConnect.getConnect();
            String sql = "SELECT * FROM binhluanemotion WHERE Id_BinhLuan = " + idBinhLuan + " AND Id_Emotion = " + idEmotion;
            var ps = conn.prepareStatement(sql);
            var rs = ps.executeQuery();
            if (rs.next()) {
                Emotion emotion = getEmotionById(rs.getInt("Id_Emotion"));
                models.DbConnect.closeConnect(conn);
                return emotion;
            }
		} catch (Exception e) {
         	e.printStackTrace();
      	}
		return null;
	}
	
	public boolean EmotionAction(int idBinhLuan, int idEmotion) {
		try {
			var conn = models.DbConnect.getConnect();
            // Kiểm tra xem đã có emotion chưa
			Emotion emotion = getEmotionBy_IdBinhLuan_idEmotion(idBinhLuan, idEmotion);
			String sql = "";
			if (emotion != null) {
				sql = "UPDATE binhluanemotion SET count = count + 1 WHERE Id_BinhLuan = ? AND Id_Emotion = ?";
			} else {
				sql = "INSERT INTO binhluanemotion (Id_BinhLuan, Id_Emotion, count) VALUES (?, ?, 1)";
			}
			var ps = conn.prepareStatement(sql);
			ps.setInt(1, idBinhLuan);
			ps.setInt(2, idEmotion);
			ps.executeUpdate();
			models.DbConnect.closeConnect(conn);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}


