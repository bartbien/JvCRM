package com.phoenixjcam.dashboard.employee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
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
	public ModelAndView listEmployee(Integer pageNumber, Integer pageSize)
	{
		ModelAndView model = new ModelAndView("template");

		if (pageNumber == null || pageNumber < 1)
			pageNumber = 1;

		if (pageSize == null || pageSize < 10)
			pageSize = 10;
		
		else
		{
			if(pageSize > 50)
				pageSize = 50;
		}

		int pagesCount = 10; // z bazy
		List<EmployeeModel> employees = employeeService.getEmployees(pageNumber, pageSize);

		model.addObject("workspace", "dashboard");
		
		//model.addObject("leftColumn", "expander");
		
		model.addObject("mainColumn", "workplace/employee/list");
		
		model.addObject("pageNumber", pageNumber);
		model.addObject("pagesCount", pagesCount);
		model.addObject("pageSize", pageSize);
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
	
	@RequestMapping(value = "/jqTable", method = RequestMethod.GET)
	public ModelAndView jqTable()
	{
		
		ModelAndView model = new ModelAndView("template");

//		model.addObject("workspace", "dashboard");
//		//model.addObject("leftColumn", "expander");
//		model.addObject("mainColumn", "table");
//	
//
//		String message = "successfully";
//		model.addObject("message", message);

		List<EmployeeModel> employees = employeeService.getEmployees(1, 200);

		model.addObject("workspace", "dashboard");
	
		model.addObject("mainColumn", "table");
		

		model.addObject("employees", employees);
		
		return model;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEmployee(@PathVariable Integer id)
	{
		// ModelAndView modelAndView = new ModelAndView("home");
		// employeeService.deleteEmployee(id);
		// String message = "Employee was successfully deleted.";
		// modelAndView.addObject("message", message);
		// return modelAndView;

		return null;
	}
}
