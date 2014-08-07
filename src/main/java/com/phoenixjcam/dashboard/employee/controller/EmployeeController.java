package com.phoenixjcam.dashboard.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.phoenixjcam.dashboard.employee.model.EmployeeModel;
import com.phoenixjcam.dashboard.employee.service.EmployeeService;

@Controller
@RequestMapping(value = "employee")
public class EmployeeController
{
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView addEmployee(@ModelAttribute EmployeeModel employee)
	{
		return null;
	}

	@RequestMapping(value = "/list")
	public ModelAndView listEmployee()
	{
		ModelAndView model = new ModelAndView("workplace/employee/list");

		List<EmployeeModel> employees = employeeService.getEmployees();
		model.addObject("employees", employees);

		return model;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView editEmployee(@PathVariable Integer id)
	{
		ModelAndView model = new ModelAndView("workplace/employee/edit");
		EmployeeModel employee = employeeService.getEmployee(id);
		model.addObject("employee", employee);
		return model;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView editEmployee(@ModelAttribute EmployeeModel employee, @PathVariable Integer id)
	{
		ModelAndView modelAndView = new ModelAndView("workplace/employee/list");

		employeeService.updateEmployee(employee);

		String message = "Employee was successfully updated.";
		modelAndView.addObject("message", message);

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@PathVariable Integer id)
	{
//		ModelAndView modelAndView = new ModelAndView("home");
//		employeeService.deleteEmployee(id);
//		String message = "Employee was successfully deleted.";
//		modelAndView.addObject("message", message);
//		return modelAndView;
		
		return null;
	}
}
