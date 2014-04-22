package com.quizcomm.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.Principal;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.quizcomm.bo.UserBo;
import com.quizcomm.dao.UserDao;
import com.quizcomm.dom.Question;
import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.User;

@Controller
@RequestMapping("/profile")
public class ProfileController {	
	@Autowired
	private UserBo userBo;	
		
	@RequestMapping(value = "/getProfile", method = RequestMethod.GET)
	public ModelAndView getProfile(Principal principal) {		
		User user = userBo.getUser(principal.getName());
		ModelAndView modelAndView=new ModelAndView("profile");	
		modelAndView.addObject("user",user); 
		return modelAndView;
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public void test(Principal principal,HttpServletRequest request) {
		ServletContext ctx= request.getSession().getServletContext();
		//String path = ctx.getRealPath("src/main/webapp/resources/profile/");
		String path = "src/main/webapp/resources/profile/";
		try {
			File  f = new File(path+"/zz2.txt");
			FileUtils.writeStringToFile(f, "hello world");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	@RequestMapping(value="/updateField",method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String updateProfile(@RequestParam("element_id") String elementid,@RequestParam("update_value") String updatevalue, Principal principal) throws JsonGenerationException, JsonMappingException, IOException{	
		String result= updatevalue;
		User user = userBo.getUser(principal.getName());
		try {
			BeanUtils.setProperty(user,elementid,updatevalue);
			userBo.updateUser(user);
		} catch (Exception e) {
			result="error";
		} 				
		return result;
	}
	
	@RequestMapping(value = "/uploadAvatar", method = RequestMethod.POST)
	public String uploadAvatar( 
	    @RequestParam("file") MultipartFile file, Principal principal,HttpServletRequest request) throws IOException{
		if (!file.isEmpty()) {
			User user = userBo.getUser(principal.getName());
			 BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			 ServletContext ctx= request.getSession().getServletContext();
			 String dir= ctx.getInitParameter("profileDir");
			 File destination = new File(dir+user.getUserId()+".png");
			 try{
				 ImageIO.write(src, "png", destination);
			 }catch(Exception ex)
			 {
				 
			 }
		 }
		return "redirect:/profile/getProfile";  
	}

}
