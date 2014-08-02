package com.phoenixjcam.dashboard.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenixjcam.dashboard.users.dao.UserInfoDAO;
import com.phoenixjcam.dashboard.users.model.UserInfoModel;

@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService
{
	@Autowired
	private UserInfoDAO userInfoDAO;

	@Override
	public UserInfoModel getUserInfo(String username)
	{
		return userInfoDAO.getUserInfo(username);
	}
}
