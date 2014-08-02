package com.phoenixjcam.dashboard.users.dao;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenixjcam.dashboard.users.model.UserInfoModel;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public UserInfoModel getUserInfo(String username)
	{
		//Query q;
		UserInfoModel userInfo = (UserInfoModel) sessionFactory.getCurrentSession().createQuery("from UserInfoModel WHERE username=?").setParameter(0, username).uniqueResult();
		
		//UserInfoModel userInfo = (UserInfoModel) sessionFactory.getCurrentSession().createQuery
		
		return userInfo;
	}
}
