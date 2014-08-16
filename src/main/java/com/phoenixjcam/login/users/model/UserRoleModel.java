package com.phoenixjcam.login.users.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * db UserRole model (many roles to one user)
 * <br><br>
 * Model Object or Value Object - This object is simple POJO containing get/set methods to store data retrieved using DAO class.
 * 
 * @author Bart88
 *
 */
@Entity
@Table(name = "user_roles", catalog = "jv_crm", uniqueConstraints = @UniqueConstraint(columnNames = { "role", "username" }))
public class UserRoleModel
{
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "user_role_id", unique = true, nullable = false)
	private Integer userRoleId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username", nullable = false)
	private UserModel user;

	@Column(name = "role", nullable = false, length = 45)
	private String role;

	public UserRoleModel()
	{
	}

	public UserRoleModel(UserModel user, String role)
	{
		this.user = user;
		this.role = role;
	}

	public Integer getUserRoleId()
	{
		return this.userRoleId;
	}

	public void setUserRoleId(Integer userRoleId)
	{
		this.userRoleId = userRoleId;
	}

	public UserModel getUser()
	{
		return this.user;
	}

	public void setUser(UserModel user)
	{
		this.user = user;
	}

	public String getRole()
	{
		return this.role;
	}

	public void setRole(String role)
	{
		this.role = role;
	}
}