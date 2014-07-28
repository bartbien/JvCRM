package com.phoenixjcam.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController
{
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView adminPage()
	{
		ModelAndView model = new ModelAndView();
		
		model.addObject("title", "dashboard");
		model.addObject("message", "admin and users page");
		model.setViewName("admin");

		return model;
	}
}