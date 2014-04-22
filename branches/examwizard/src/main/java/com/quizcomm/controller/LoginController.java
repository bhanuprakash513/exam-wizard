package com.quizcomm.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	private static final String ROLE_USER = "ROLE_USER";
	private static final String ROLE_ADMIN	= "ROLE_ADMIN";
	
	@RequestMapping(value="/login")
	public String login(ModelMap model) {
		return "login_new";
	}
	
	@RequestMapping(value="/register")
	public String register(ModelMap model) {
		return "registration";
	}
	
	
	@RequestMapping(value="/loginfailed")
	public String loginFailed(HttpSession session,ModelMap model){
		model.addAttribute("error", "true");
		model.addAttribute("exception", session.getAttribute("SPRING_SECURITY_LAST_EXCEPTION"));
		return "login_new";
	}
	
	@RequestMapping(value="/loginsuccess")
	public String loginSucess(Principal principal){
		
		return "home";
	}
	
	
	@RequestMapping(value="/logout")
	public String logout(Principal principal){
		
		return "home";
	}
	
	

}
