package com.phoenixjcam.dashboard.controller;

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

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public ModelAndView edditingEmployee(@ModelAttribute EmployeeModel employee, @PathVariable Integer id)
	{

//		ModelAndView modelAndView = new ModelAndView("home");
//
//		employeeService.updateEmployee(employee);
//
//		String message = "Employee was successfully edited.";
//		modelAndView.addObject("message", message);
//
//		return modelAndView;
		
		return null;
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
