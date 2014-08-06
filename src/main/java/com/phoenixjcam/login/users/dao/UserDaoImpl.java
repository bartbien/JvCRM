package com.phoenixjcam.login.users.dao;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenixjcam.login.users.model.UserModel;
import com.phoenixjcam.login.users.model.UserRoleModel;

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

	public UserModel findByUserName(String username)
	{
		UserModel users = new UserModel();
		users = (UserModel) sessionFactory.getCurrentSession().createQuery("from UserModel where username=?").setParameter(0, username).uniqueResult();
		
		if(!users.equals(null))
		{
			return users;
		}
		else
		{
			return null;
		}
	}
}

