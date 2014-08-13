package com.phoenixjcam.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * WebSecurityConfigurer is taking care of what to do with login form from login.jsp
 *  .loginPage("/login") <br>
 *	.failureUrl("/login?error") <br>
 *	.usernameParameter("username") <br>
 *	.passwordParameter("password") <br>
 *	.defaultSuccessUrl("/dashboard") and so on <br>
 *  
 * @author Bart88
 *
 */
@Controller
public class LoginController
{
	@RequestMapping(value = {"/login", "/"}, method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout)
	{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("template");
		modelAndView.addObject("workspace", "workspace/login");
		
		if (error != null)
		{
			modelAndView.addObject("error", "Invalid username or password!");
		}

		if (logout != null)
		{
			modelAndView.addObject("msg", "Logged out successfully.");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView signUpPage()
	{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("template");
		modelAndView.addObject("workspace", "workspace/register");

		return modelAndView;
	}
	
	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public ModelAndView register(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password)
	{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("msg", "For right now, contact admin to create new account - To login use Username: phoenix  Password: 123456");
		modelAndView.setViewName("login");

		return modelAndView;
	}
}