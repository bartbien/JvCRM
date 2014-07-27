package com.phoenixjcam.users.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenixjcam.users.model.User;

/**
 * Data Access Object concrete class -This class implements above interface. <br>
 * This class is responsible to get data from a datasource <br>
 * which can be database / xml or any other storage mechanism.
 * 
 * @author Bart88
 *
 */
@Repository
public class UserDaoImpl implements UserDao
{
	@Autowired
	private SessionFactory sessionFactory;

	public User findByUserName(String username)
	{
		User users = new User();
		users = (User) sessionFactory.getCurrentSession().createQuery("from User where username=?").setParameter(0, username).uniqueResult();
		
		if(!users.equals(null))
		{
			return users;
		}
		else
		{
			return null;
		}
	}
	
	// + impl Dao
}