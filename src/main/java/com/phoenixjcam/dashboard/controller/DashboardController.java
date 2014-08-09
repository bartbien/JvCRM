package com.phoenixjcam.dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.phoenixjcam.dashboard.users.model.UserInfoModel;
import com.phoenixjcam.dashboard.users.service.UserInfoService;

@Controller
public class DashboardController
{
	@Autowired
	UserInfoService userInfoService;

	// only for admin role
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminPage()
	{
		ModelAndView model = new ModelAndView();

		model.addObject("title", "Spring Security");
		model.addObject("message", "only admin has rights to show this page");
		model.setViewName("admin");

		return model;
	}

	// for all logged in users
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboardPage(Integer pageNumber, Integer pageSize)
	{
		ModelAndView model = new ModelAndView();

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
		
		model.setViewName("template");

		model.addObject("workspace", "dashboard");
		model.addObject("maintenance", "customers/contacts");
		model.addObject("title", "dashboard");
		model.addObject("message", "admin and users page");
		model.addObject("partial", "dashboard");
		model.addObject("pageNumber", pageNumber);
		model.addObject("pagesCount", pagesCount);
		model.addObject("pageSize", pageSize);
		
//		model.addObject("pageTitle", "customers/contacts.jsp");

//		ExpanderNavigation[] texts = new ExpanderNavigation[]
//		{ new ExpanderNavigation(), new ExpanderNavigation(), new ExpanderNavigation() };
//
//		model.addObject("texts", texts);
//
//		ExpanderNavigation expanderNavi = new ExpanderNavigation();
//		model.addObject("expanderNavi", expanderNavi);

		
		return model;
	}

	// for all logged users
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public ModelAndView getEmail(@RequestParam(value = "username", required = false) String username)
	{
		ModelAndView model = new ModelAndView();
		UserInfoModel userInfoModel = (UserInfoModel) userInfoService.getUserInfo(username);

		String email = userInfoModel.getEmail();

		model.addObject("title", "dashboard");
		model.addObject("email", email);
		model.setViewName("dashboard");

		return model;
	}

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

		model.setViewName("403");
		return model;
	}
}