package com.phoenixjcam.dashboard.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenixjcam.dashboard.employee.dao.EmployeeDAO;
import com.phoenixjcam.dashboard.employee.model.EmployeeModel;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService
{

	@Autowired
	private EmployeeDAO employeeDAO;
	
	@Override
	public void addEmployee(EmployeeModel employee)
	{
		employeeDAO.addEmployee(employee);
	}

	@Override
	public void updateEmployee(EmployeeModel employee)
	{
		employeeDAO.updateEmployee(employee);
	}

	@Override
	public EmployeeModel getEmployee(int id)
	{
		return employeeDAO.getEmployee(id);
	}

	@Override
	public void deleteEmployee(int id)
	{
		employeeDAO.deleteEmployee(id);
	}

	@Override
	public List<EmployeeModel> getEmployees()
	{
		return employeeDAO.getEmployees();
	}

}
