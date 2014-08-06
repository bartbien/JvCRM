package com.phoenixjcam.dashboard.employee.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenixjcam.dashboard.employee.model.EmployeeModel;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO
{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addEmployee(EmployeeModel employee)
	{
		getCurrentSession().save(employee);
	}

	@Override
	public void updateEmployee(EmployeeModel employee)
	{
		EmployeeModel employeeUpdate = getEmployee(employee.getEmplId());
		employeeUpdate.setFirstName(employee.getFirstName());
		employeeUpdate.setLastName(employee.getLastName());
		getCurrentSession().update(employeeUpdate);
	}

	@Override
	public EmployeeModel getEmployee(int id)
	{
		EmployeeModel employee = (EmployeeModel) getCurrentSession().get(EmployeeModel.class, id);
		
		return employee;
	}

	@Override
	public void deleteEmployee(int id)
	{
		EmployeeModel employee = getEmployee(id);
		if(employee != null)
			getCurrentSession().delete(employee);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeModel> getEmployees()
	{
		return getCurrentSession().createQuery("from EmployeeModel").list();
	}

}
