package models;

public class User {
	private int Id;
	private String Name;
	private String Email;
	private String Password;
	private int Role;
	private String Image;
	private String Birthday;
	private int Gender;
	private String PhoneNumber;
	private String Address;
	private String CreateDate;
	
	public User() {}
	
	public User(int id, String name, String email, String password, int role,
			String image, String birthday, int gender, String phoneNumber,
			String address, String createDate) {
		Id = id;
		Name = name;
		Email = email;
		Password = password;
		Role = role;
		Image = image;
		Birthday = birthday;
		Gender = gender;
		PhoneNumber = phoneNumber;
		Address = address;
		CreateDate = createDate;
	}
	
	// Getters, Setters attributes
	public int getId() {
		return Id;
	}
	
	public void setId(int id) {
		Id = id;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
	}
	
	public String getEmail() {
		return Email;
	}
	
	public void setEmail(String email) {
		Email = email;
	}
	
	public String getPassword() {
		return Password;
	}
	
	public void setPassword(String password) {
		Password = password;
	}
	
	public int getRole() {
		return Role;
	}
	
	public void setRole(int role) {
		Role = role;
	}
	
	public String getImage() {
		return Image;
	}
	
	public void setImage(String image) {
		Image = image;
	}
	
	public String getBirthday() {
		return Birthday;
	}
	
	public void setBirthday(String birthday) {
		Birthday = birthday;
	}
	
	public int getGender() {
        return Gender;
	}
	
	public void setGender(int gender) {
		Gender = gender;
	}
	
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	
	public String getAddress() {
		return Address;
	}
	
	public void setAddress(String address) {
		Address = address;
	}
	
	public String getCreateDate() {
		return CreateDate;
	}
	
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	
	@Override
	public String toString() {
        return "User [Id=" + Id + ", Name=" + Name + ", Email=" + Email + ", Password=" + Password + ", Role=" + Role
                + ", Image=" + Image + ", Birthday = " + Birthday + ", Gender=" + Gender + ", PhoneNumber=" + PhoneNumber
                + ", Address=" + Address + ", CreateDate=" + CreateDate + "]";
	}
}
