package com.quizcomm.dao;

import java.util.List;

import com.quizcomm.dom.User;

public interface UserDao {
	
	public void addUser(User user);
	public User getUser(String userId);
	public User getUserByPK(Long id);
	public void updateUser(User user);
	public int getUserCount();
	public List<User> listUsers(int fromIndex, int count, String orderBy);	 	
}
