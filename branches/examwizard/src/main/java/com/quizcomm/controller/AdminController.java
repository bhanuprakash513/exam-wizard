package com.quizcomm.controller;

import java.util.ArrayList;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.quizcomm.bo.QuizBo;
import com.quizcomm.bo.UserBo;
import com.quizcomm.dom.User;
import com.quizcomm.util.TextUtil;
import com.quizcomm.util.TriggerEmail;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private final int RANDOM_PASS_LENGTH =5;
	
	@Autowired
	private UserBo userBo; 

	@RequestMapping(value = "/listUsers", method = RequestMethod.GET)
	public String loadListUsersPage() {
		return "listUsers";
	}
	
	
	@RequestMapping(value = "/getUsers", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public HashMap<String, Object> getUsers(@RequestParam("offset") int offset,
			@RequestParam("count") int count,
			@RequestParam("orderBy") String orderBy) {

		int total = userBo.getUserCount();
		List<User> users = userBo.listUsers(offset, count, orderBy);
		for (User user : users) {
			user.setQuizzes(null);
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", total);
		result.put("users", users);
		return result;
	}

	@RequestMapping(value = "/resetPass", method = RequestMethod.POST)	
	@ResponseStatus(HttpStatus.OK)
	public String resetPass(@RequestParam String userId) {			
		Boolean success=false;
		try{			
			User user = userBo.getUser(userId);			
			String newPass= RandomStringUtils.randomAlphanumeric(RANDOM_PASS_LENGTH);
			user.setPassword( TextUtil.MD5(newPass));
			userBo.updateUser(user);
			if(TextUtil.isValidEmailAddress(user.getEmail())){
				TriggerEmail.sendPassResetEmail(user.getFirstName(), user.getEmail(),newPass);
			}
			success=true;			
		}catch(Exception ex)
		{
			success=false;
		}
		return success.toString();
	}
	
	@RequestMapping(value = "/setUserState", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public String setUserState(@RequestParam String userId, @RequestParam String status) {
		Boolean success=false;
		try{
			User user = userBo.getUser(userId);
			user.setStatus(status);
			userBo.updateUser(user);
			success=true;
		}catch(Exception ex)
		{
			success=false;
		}
		return success.toString();
	}
}
