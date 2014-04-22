package com.quizcomm.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.quizcomm.bo.UserBo;
import com.quizcomm.dom.User;

@Controller
@RequestMapping("/")
public class MyQuizController {
	@Autowired
	private UserBo userBo;
		
	@RequestMapping(value = "/myquiz", method = RequestMethod.GET)
	public ModelAndView myQuiz(Principal principal) {		
		User user = userBo.getUser(principal.getName());
		ModelAndView modelAndView=new ModelAndView("myquiz");	
		modelAndView.addObject("user",user);
		return modelAndView;
	}
	

	
}
