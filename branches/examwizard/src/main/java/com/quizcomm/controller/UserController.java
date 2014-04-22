package com.quizcomm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quizcomm.bo.UserBo;
import com.quizcomm.dom.User;
import com.quizcomm.util.TextUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBo userBo;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String defaultPage(ModelMap model) {

		return "redirect:/user/home";
	}
	
	@RequestMapping(value="/{userId}",method=RequestMethod.GET)
	public String getUser(@PathVariable String userId, ModelMap model) {
		
		model.addAttribute("user", userBo.getUser(userId));

		return "user";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView addContact(@ModelAttribute("user")
	User user,BindingResult result) {
		ModelAndView modelAndView=null;
		try {
			modelAndView=new ModelAndView("login_new");
			user.setStatus("1");
			user.setRole("ROLE_USER");
			user.setPassword(TextUtil.MD5(user.getPassword()));
			userBo.addUser(user);

			modelAndView.addObject("login_success","Registration Succesful. Please Login.");
			return modelAndView;
			
		} catch (Exception e) {
			modelAndView=new ModelAndView("registration");
			modelAndView.addObject("error","Error occured while register");
			return modelAndView;
		}
		
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String memberHome(HttpSession session,@ModelAttribute("user")
	User user, BindingResult result) {
		return "userHome";
	}
}
