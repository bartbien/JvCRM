package com.phoenixjcam.users.dao;

import com.phoenixjcam.users.model.User;

/**
 * Data Access Object Interface - This interface defines the standard operations to be performed on a model object(s).
 * @author Bart88
 *
 */
public interface UserDao
{
	public User findByUserName(String username);
	// delete
	// update
	// getUser - single
	public User getUser();
	// getAllUsers
}