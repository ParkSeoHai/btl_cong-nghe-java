package services;

import java.sql.Connection;
import java.sql.PreparedStatement;

import interfaces.IUser;

public class UserService implements IUser {
	private Connection conn = null;
	@Override
	public boolean login(String username, String password) {
		try {
			conn = models.DbConnect.getConnect();
			String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			var rs = ps.executeQuery();
			if (rs.next()) {
				models.DbConnect.closeConnect(conn);
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean register(models.User user) {
		try {
			conn = models.DbConnect.getConnect();
			String sql = "INSERT INTO users "
					+ "(name, email, password, image, role, birthday, gender, phoneNumber, address, createDate)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getImage());
			ps.setInt(5, user.getRole());
			ps.setString(6, user.getBirthday());
			ps.setInt(7, user.getGender());
			ps.setString(8, user.getPhoneNumber());
			ps.setString(9, user.getAddress());
			ps.setString(10, user.getCreateDate());
			int row = ps.executeUpdate();
			models.DbConnect.closeConnect(conn);
			if (row > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public boolean checkEmail(String email) {
        try {
        	conn = models.DbConnect.getConnect();
        	String sql = "SELECT * FROM users WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, email);
        	var rs = ps.executeQuery();
			if (rs.next()) {
				models.DbConnect.closeConnect(conn);
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}