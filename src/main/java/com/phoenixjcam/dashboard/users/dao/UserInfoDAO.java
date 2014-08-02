package com.phoenixjcam.dashboard.users.dao;

import com.phoenixjcam.dashboard.users.model.UserInfoModel;

public interface UserInfoDAO
{
	public UserInfoModel getUserInfo(String username);
}
