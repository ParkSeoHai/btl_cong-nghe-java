package interfaces;

import models.User;

public interface IUser {
	public boolean login(String username, String password);
	public boolean register(models.User user);
	public boolean checkEmail(String email);
	public User getUser(String email);
	public User updateUserName(String email, String newName);
	public User updateGender(String email, int newGender);
	public User updateBirthday(String email, String newBirthday);
	public User updateNumberphone(String email, String newNumberphone);
	public User updateAddress(String email, String newAddress);
	public User updateEmail(String email, String newEmail);
	public User updateAvatar(String email, String newAvatar);
	public User updatePassword(String email, String newPassword);
}



