package com.phoenixjcam.dashboard.employee.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.phoenixjcam.dashboard.employee.model.EmployeeModel;
import com.phoenixjcam.dashboard.employee.service.EmployeeService;
import com.phoenixjcam.login.users.model.UserModel;
import com.phoenixjcam.table.models.DataCover;
import com.phoenixjcam.table.models.Employee;

@Controller
// @RestController
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
			if (pageSize > 50)
				pageSize = 50;
		}

		int pagesCount = 10; // z bazy
		List<EmployeeModel> employees = employeeService.getEmployees(pageNumber, pageSize);

		model.addObject("workspace", "dashboard");

		// model.addObject("leftColumn", "expander");

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

		// model.addObject("workspace", "dashboard");
		// //model.addObject("leftColumn", "expander");
		// model.addObject("mainColumn", "table");
		//
		//
		// String message = "successfully";
		// model.addObject("message", message);

		List<EmployeeModel> employees = employeeService.getEmployees(1, 200);

		model.addObject("workspace", "workspace/dashboard");

		model.addObject("mainColumn", "../widgets/table");

		model.addObject("employees", employees);

		return model;
	}

	// @RequestMapping(value = "/getEmployers", method = RequestMethod.GET)
	// public @ResponseBody String getEmployers()
	// {
	// //return employeeService.getEmployees(1, 200);
	//
	// return "{"
	// + "\"data\": ["
	// + "  ["
	// + "    \"Name\","
	// + "    \"Position\","
	// + "    \"Office\","
	// + "    \"Age\","
	// + "    \"Start date\","
	// + "    \"Salary\","
	// + "    \"edit\","
	// + "    \"<a href=\\\"\\\">delete</a>\""
	// + "  ]"
	// + "]}";
	// }

	
	// json response
	@RequestMapping(value = "/getEmployers", method = RequestMethod.GET)
	public @ResponseBody DataCover<Employee> getEmployers(
		@RequestParam (value = "order[0][column]") Integer orderColumn,
		@RequestParam (value = "order[0][dir]") String orderDirection,
		@RequestParam (value = "start") Integer start, 
		@RequestParam (value = "length") Integer length, 
		@RequestParam (value = "draw") Integer draw,
		@RequestParam (value = "search[value]") String query)
	{
		/*if (draw == null || draw < 1)
			draw = 1;

		if (length == null || length < 10)
			length = 10;

		else
		{
			if (length > 100)
				length = 100;
		}*/

		long totalEmployeesCount = employeeService.getEmployeesCount();
		long filteredEmployeesCount = employeeService.getEmployeesCount(query);
		List<EmployeeModel> employees = employeeService.getEmployees( start, length, query, orderColumn, orderDirection );
		
		List<Employee> data = new ArrayList<Employee>();
		
		for ( EmployeeModel el : employees )
		{
			Employee row = new Employee();
			
			row.setId( el.getEmplId() );
			row.setLastName( el.getLastName() );
			row.setFirstName( el.getFirstName() );
			row.setPosition( "Position" );
			row.setOffice( "Office" );
			row.setAge( "Age" );
			row.setStartDate( "Start date" );
			row.setSalary( "Salary" );
			// row.setEdit("edit");
			// row.setDelete("delete");
			
			data.add( row );
		}

		DataCover<Employee> cover = new DataCover<Employee>();

		cover.setDraw(draw);
		cover.setRecordsTotal(totalEmployeesCount);
		cover.setRecordsFiltered(filteredEmployeesCount);
		cover.setData(data);

		return cover;
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
