package com.phoenixjcam.dashboard.humanResource.popupMenu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/dashboard")
public class PopupMenuController
{
	@RequestMapping(value = "/popupmenu", method = RequestMethod.GET)
	public ModelAndView jqTable()
	{

		ModelAndView model = new ModelAndView("template");

		model.addObject("workspace", "workspace/dashboard");
		model.addObject("mainColumn", "../widgets/popupMenu");
		
		return model;
	}
}
