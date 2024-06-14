package interfaces;

public interface IUser {
	public boolean login(String username, String password);
	public boolean register(models.User user);
	public boolean checkEmail(String email);
}
