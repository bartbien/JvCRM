package com.phoenixjcam.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController
{
	@RequestMapping(value = {"/login", "/"}, method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout)
	{
		ModelAndView model = new ModelAndView();
		
		model.setViewName("template");
		model.addObject("workspace", "login");
		
		if (error != null)
		{
			model.addObject("error", "Invalid username or password!");
		}

		if (logout != null)
		{
			model.addObject("msg", "Logged out successfully.");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView signUpPage()
	{
		ModelAndView model = new ModelAndView();
		
		model.setViewName("template");
		model.addObject("workspace", "register");

		return model;
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public ModelAndView register(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password)
	{
		ModelAndView model = new ModelAndView();
		
		model.addObject("msg", "For right now, contact admin to create new account - To login use Username: phoenix  Password: 123456");
		model.setViewName("login");

		return model;
	}
}