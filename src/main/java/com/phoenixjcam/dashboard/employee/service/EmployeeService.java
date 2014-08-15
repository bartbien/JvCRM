package com.phoenixjcam.dashboard.employee.service;

import java.util.List;

import com.phoenixjcam.dashboard.employee.model.EmployeeModel;

public interface EmployeeService
{
	public void addEmployee(EmployeeModel employee);

	public void updateEmployee(EmployeeModel employee);

	public EmployeeModel getEmployee(int id);

	public void deleteEmployee(int id);

	/**
	 *  try to change pageNumber/ draw it's withdraw data from db in wrong way 
	 *  draw only counts how many times client change page it doesn't tell which 
	 *  - next or previous page customer hit 
	 */
	public List<EmployeeModel> getEmployees(int pageNumber, int pageSize);

	public long getEmployeesCount();
}
