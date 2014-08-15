package com.phoenixjcam.dashboard.employee.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
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
		int pageNumber = 1;
		int pageSize = 10;
		List<EmployeeModel> result = getCurrentSession().createCriteria(EmployeeModel.class)
		.setFirstResult((pageNumber - 1) * pageSize)
		.setMaxResults(pageSize)
		.list();
		return result;
		//return getCurrentSession().createQuery("from EmployeeModel").list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeModel> getEmployees(int offset, int length)
	{
		List<EmployeeModel> result = getCurrentSession().createCriteria(EmployeeModel.class)
			.setFirstResult(offset)
			.setMaxResults(length)
			.list();
		
		return result;
		
		//return getCurrentSession().createQuery("from EmployeeModel").list();
	}
	
	private boolean isInteger(String text)
	{
		if(text.length() == 0)
			return false;
		
		for(int i = 0; i < text.length(); ++i)
		{
			if(Character.isDigit( text.charAt( i ) ) == false)
				return false;
		}
		
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmployeeModel> getEmployees(int offset, int length, String query)
	{
		Criteria criteria = getCurrentSession().createCriteria(EmployeeModel.class)
				.setFirstResult(offset)
				.setMaxResults(length);
			
		Criterion disjuction = Restrictions.or( Restrictions.like( "firstName", query, MatchMode.ANYWHERE ), 
			Restrictions.like( "lastName", query, MatchMode.ANYWHERE ));
		
		if(this.isInteger( query ))
			disjuction = Restrictions.or(disjuction, Restrictions.like( "emplId", Integer.parseInt( query ) ) );


		List<EmployeeModel> result = criteria.add( disjuction )
				.list();
		
		return result;
			
	}

	@Override
	public long getEmployeesCount()
	{
		long count = (long)this.getCurrentSession().createCriteria(EmployeeModel.class)
			.setProjection(Projections.count("emplId"))
			.uniqueResult();

		return count;
	}

}
