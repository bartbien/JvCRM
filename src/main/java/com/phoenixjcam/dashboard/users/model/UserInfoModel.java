package com.phoenixjcam.dashboard.users.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users_info", catalog = "loginsystem_tmp")
public class UserInfoModel
{
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "user_info_id", unique = true, nullable = false)
	int userInfoId;
	
	@Column(name = "username", nullable = false, length = 45)
	String username;
	
	@Column(name = "email", length = 45)
	String email;
	
	public UserInfoModel()
	{

	}
	
	public UserInfoModel(String username, String email)
	{
		this.username = username;
		this.email = email;
	}

	public int getUserInfoId()
	{
		return userInfoId;
	}

	public void setUserInfoId(int userInfoId)
	{
		this.userInfoId = userInfoId;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

}
