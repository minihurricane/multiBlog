package pers.wsf.multiBlog.service;

import java.util.List;

import pers.wsf.multiBlog.pojo.User;

public interface UserService {

	int loginUser(String userName, String password);
	
	User getOneUserByName(String username);
	
	Integer getUserIdByName(String username);
	
	int registerUser(User user);

	void deleteUser(int id);


	List<User> listUser();

	User getOneUser(int id);
}
