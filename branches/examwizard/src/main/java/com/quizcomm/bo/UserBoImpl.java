package com.quizcomm.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.quizcomm.dao.UserDao;
import com.quizcomm.dom.User;

public class UserBoImpl implements UserBo {
	
	
	@Autowired
	private UserDao userDao;
	
	
	public void addUser(User user) {
		userDao.addUser(user);
	}

	public User getUser(String userId) {
		return userDao.getUser(userId);
	}

	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User getUserByPK(Long id) {
		return userDao.getUserByPK(id);
	}

	public User getUserByUserId(String userId) {
		
		return userDao.getUser(userId);
	}
	
	public int getUserCount(){
		return userDao.getUserCount();
	}
	public List<User> listUsers(int fromIndex, int count, String orderBy){
		return userDao.listUsers(fromIndex, count, orderBy);
	}
	
	public void updateUser(User user){
		 userDao.updateUser(user);	
	}
}
