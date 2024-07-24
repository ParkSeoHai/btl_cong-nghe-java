package services;

import java.sql.Connection;
import java.sql.PreparedStatement;

import interfaces.IUser;
import models.User;

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
	
	public User getUserById(int id) {
        User user = new User();
        try {
            conn = models.DbConnect.getConnect();
            String sql = "SELECT * FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            var rs = ps.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setImage(rs.getString("image"));
                user.setRole(rs.getInt("role"));
                user.setBirthday(rs.getString("birthday"));
                user.setGender(rs.getInt("gender"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setCreateDate(rs.getString("createDate"));
            }
            models.DbConnect.closeConnect(conn);
        } catch (Exception e) {
        	e.printStackTrace();
      	}
        return user;
	}
	
	public User getUserByEmail(String email) {
		User user = new User();
        try {
            conn = models.DbConnect.getConnect();
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            var rs = ps.executeQuery();
            if (rs.next()) {
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setImage(rs.getString("image"));
                user.setRole(rs.getInt("role"));
                user.setBirthday(rs.getString("birthday"));
                user.setGender(rs.getInt("gender"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setCreateDate(rs.getString("createDate"));
            }
            models.DbConnect.closeConnect(conn);
        } catch (Exception e) {
        	e.printStackTrace();
      	}
        return user;
	}
	
	@Override
	public User getUser(String email) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "SELECT * FROM users WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, email);
        	var rs = ps.executeQuery();
			if (rs.next()) {
				User user = new User(rs.getInt("Id"), rs.getString("Name"), rs.getString("Email"), rs.getString("Password"), rs.getInt("Role"), rs.getString("Image"),
						rs.getString("Birthday"), rs.getInt("Gender"), rs.getString("PhoneNumber"), rs.getString("Address"), rs.getString("CreateDate"));
				models.DbConnect.closeConnect(conn);
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateUserName(String email, String newName) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET Name = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newName);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateGender(String email, int newGender) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET Gender = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setInt(1, newGender);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateBirthday(String email, String newBirthday) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET Birthday = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newBirthday);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateNumberphone(String email, String newNumberphone) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET PhoneNumber = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newNumberphone);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateAddress(String email, String newAddress) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET Address = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newAddress);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateEmail(String email, String newEmail) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET email = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newEmail);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updateAvatar(String email, String newAvatar) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET Image = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newAvatar);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public User updatePassword(String email, String newPassword) {
		try {
        	conn = models.DbConnect.getConnect();
        	String sql = "UPDATE users SET Password = ? WHERE email = ?";
        	PreparedStatement ps = conn.prepareStatement(sql);
        	ps.setString(1, newPassword);
        	ps.setString(2, email);
        	ps.executeUpdate();
        	models.DbConnect.closeConnect(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}