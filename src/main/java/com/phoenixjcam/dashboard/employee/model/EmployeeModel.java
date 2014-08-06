package com.phoenixjcam.dashboard.employee.model;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "empl_personal_info_tmp", catalog = "loginsystem_tmp")
public class EmployeeModel
{
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "empl_id", unique = true, nullable = false)
	int emplId;

	@Column(name = "first_name", nullable = false, length = 45)
	String firstName;

	@Column(name = "last_name", nullable = false, length = 45)
	String lastName;

	public int getEmplId()
	{
		return emplId;
	}

	public void setEmplId(int emplId)
	{
		this.emplId = emplId;
	}

	public String getFirstName()
	{
		return firstName;
	}

	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}

	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}

}
