package com.phoenixjcam.dashboard.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DashboardController
{
	/**
	 * WebSecurityConfigurer is taking care of what to do with login form from login.jsp .loginPage("/login") <br>
	 * .failureUrl("/login?error") <br>
	 * .usernameParameter("username") <br>
	 * .passwordParameter("password") <br>
	 * .defaultSuccessUrl("/dashboard") and so on <br>
	 *
	 * expander is always at the left side of dash board page
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboardPage(Integer pageNumber, Integer pageSize)
	{
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("template");
		modelAndView.addObject("workspace", "workspace/dashboard");
		modelAndView.addObject("mainColumn", "../widgets/miniCalendar");

		// display simply jquery calendar and main tasks from db

		return modelAndView;
	}

	// only for admin role
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminPage()
	{
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("template");
		
		modelAndView.addObject("workspace", "workspace/dashboard");
		modelAndView.addObject("mainColumn", "../workspace/admin");
		
		modelAndView.addObject("title", "Spring Security");
		modelAndView.addObject("message", "only admin has rights to show this page");
		
		return modelAndView;
	}

	// // for all logged users
	// @RequestMapping(value = "/email", method = RequestMethod.GET)
	// public ModelAndView getEmail(@RequestParam(value = "username", required = false) String username)
	// {
	// ModelAndView model = new ModelAndView();
	// //UserInfoModel userInfoModel = (UserInfoModel) userInfoService.getUserInfo(username);
	//
	// //String email = userInfoModel.getEmail();
	//
	// model.addObject("title", "dashboard");
	// //model.addObject("email", email);
	// model.setViewName("dashboard");
	//
	// return model;
	// }

	/**
	 * WebSecurityConfigurer decide when to display 403 Forbidden HTTP status code
	 * 
	 * @return
	 */
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied()
	{
		ModelAndView model = new ModelAndView();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (!(authentication instanceof AnonymousAuthenticationToken))
		{
			UserDetails userDetail = (UserDetails) authentication.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());
		}

		model.setViewName("statusCode/403");
		return model;
	}
}