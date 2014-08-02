package com.phoenixjcam.login.users.dao;

import com.phoenixjcam.login.users.model.UserModel;

/**
 * Data Access Object Interface - This interface defines the standard operations to be performed on a model object(s).
 * @author Bart88
 *
 */
public interface UserDao
{
	public UserModel findByUserName(String username);
}