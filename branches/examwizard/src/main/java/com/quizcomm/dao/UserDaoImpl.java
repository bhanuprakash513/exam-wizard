package com.quizcomm.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.StringUtils;
import com.quizcomm.dom.User;


@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public void addUser(User user) {
		getCurrentSession().save(user);
	}
	
	@Transactional
	public User getUser(String userId) {
		Query query = getCurrentSession().createQuery("select u from User u where u.userId=:uid").setParameter("uid", userId);
		return (User)query.uniqueResult();
	}
	
	@Transactional
	public User getUserByPK(Long id) {

		return (User)getCurrentSession().get(User.class,id);
	}
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public int getUserCount(){
		int count=-1;
		Query query = getCurrentSession().createQuery("select count(id) as count from User");
		Object result =query.uniqueResult();
		if(result!=null)
		count= ((Long)query.uniqueResult()).intValue();
		return count;
	}
	
	@Transactional
	@SuppressWarnings("unchecked")
	public List<User> listUsers(int fromIndex, int count, String orderBy){		
		if(StringUtils.isNullOrEmpty(orderBy))
			orderBy="id";
		Criteria c=	getCurrentSession().createCriteria(User.class)	
		.addOrder(Order.desc(orderBy))
		.setFirstResult(fromIndex)
		.setMaxResults(count);		
		return	c.list();		
	}
	@Transactional
	public void updateUser(User user){
			getCurrentSession().update(user);
	}
}
