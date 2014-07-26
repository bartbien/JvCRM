package com.phoenixjcam.users.dao;

import com.phoenixjcam.users.model.User;

public interface UserDao
{

	User findByUserName(String username);

}