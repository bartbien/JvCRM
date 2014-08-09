package com.phoenixjcam.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/home")
public class HomeController
{
	// for all logged in users
	@RequestMapping(value = {"/", "/dashboard"}, method = RequestMethod.GET)
	public ModelAndView dashboardPage()
	{
		ModelAndView model = new ModelAndView();
		model.addObject("pageTitle", "Home");
		
		//UserDaoImpl userData = new UserDaoImpl();
		// userData.getUserEmail(username)
		
		model.addObject("title", "dashboard");
		model.addObject("message", "admin and users page");
		
		 
		
		ExpanderNavigation[] texts = new ExpanderNavigation[]
		{
				new ExpanderNavigation(),
				new ExpanderNavigation(),
				new ExpanderNavigation()
		};

		model.addObject("texts", texts);
		
		ExpanderNavigation expanderNavi = new ExpanderNavigation();
		model.addObject("expanderNavi", expanderNavi);
		
		model.setViewName("dashboard");

		return model;
	}
	
	
	
//	@RequestMapping(method = RequestMethod.GET)
//	public ModelAndView handleRequest()
//	{
//		ModelAndView mode = new ModelAndView("home");
//		
//		
//		return mode;
//	}
}