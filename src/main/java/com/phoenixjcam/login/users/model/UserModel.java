package com.phoenixjcam.login.users.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * db User model (one user to many roles) <br>
 * <br>
 * Model Object or Value Object - This object is simple POJO containing get/set methods to store data retrieved using
 * DAO class.
 * 
 * @author Bart88
 *
 */
@Entity
@Table(name = "users", catalog = "jv_crm")
public class UserModel
{
	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	private String username;

	@Column(name = "password", nullable = false, length = 60)
	private String password;

	@Column(name = "enabled", nullable = false)
	private boolean enabled;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRoleModel> userRole = new HashSet<UserRoleModel>(0);

	public UserModel()
	{
	}

	public UserModel(String username, String password, boolean enabled)
	{
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public UserModel(String username, String password, boolean enabled, Set<UserRoleModel> userRole)
	{
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRole = userRole;
	}

	public String getUsername()
	{
		return this.username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return this.password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public boolean isEnabled()
	{
		return this.enabled;
	}

	public void setEnabled(boolean enabled)
	{
		this.enabled = enabled;
	}

	public Set<UserRoleModel> getUserRole()
	{
		return this.userRole;
	}

	public void setUserRole(Set<UserRoleModel> userRole)
	{
		this.userRole = userRole;
	}
}
