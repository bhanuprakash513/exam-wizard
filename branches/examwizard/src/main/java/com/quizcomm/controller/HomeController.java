package com.quizcomm.controller;

import java.security.Principal;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.quizcomm.bo.QuizBo;
import com.quizcomm.dom.Quiz;
import com.quizcomm.util.TriggerEmail;

@Controller
public class HomeController {
	
	
	private static final int PAGE_SIZE = 10;

	@Autowired
	private QuizBo quizBo;
	
	@RequestMapping(value = "/", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView homeView(
			@RequestParam(value = "term", required = false) String term,
			@RequestParam(value = "page", required = false) String page,ModelMap modelMap) {
		
		Collection<GrantedAuthority> list = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		Set<String> roles = AuthorityUtils.authorityListToSet(list);
		
		ModelAndView model = null;
		if(roles.contains("ROLE_ADMIN"))
		{
			model = new ModelAndView("redirect:admin/listUsers");
			System.out.println("Admin");
		}
		else
		{
			
			System.out.println("Not Admin");
			model = new ModelAndView("home");
			int start = 0;
			int pageNumber = 0;
			boolean next = false;
			boolean prev = false;

			if (page == null || !StringUtils.hasLength(page)) {
				page = "1";
			}

			if (term == null || !StringUtils.hasLength(term)) {
				term = "";
			}

			try {

				if (page != null) {
					pageNumber = Integer.parseInt(page);

					if (pageNumber < 0) {
						pageNumber = 0;
					}

				}
			} catch (Exception ex) {

			}

			int totalCount = quizBo.getSearchCount(term);

			int pageCount = (int) Math.ceil((double) totalCount / PAGE_SIZE);

			if (pageCount > 1) {
				if (pageNumber < pageCount) {
					next = true;
				}
				if (pageNumber > 1) {
					prev = true;
				}
			}

			if (pageNumber > 1) {
				start = (pageNumber - 1) * PAGE_SIZE;
			}

			List<Quiz> quizList = quizBo.search(term, start, PAGE_SIZE);

			model.addObject("term", term);
			modelMap.addAttribute("term", term);
			model.addObject("next", next);
			modelMap.addAttribute("next", next);
			model.addObject("prev", prev);
			modelMap.addAttribute("prev", prev);
			model.addObject("pages", prev);
			modelMap.addAttribute("pages", prev);
			model.addObject("quizList", quizList);
			modelMap.addAttribute("quizList", quizList);
			model.addObject("pageCount", pageCount);
			modelMap.addAttribute("pageCount", pageCount);
			model.addObject("prevPage", pageNumber - 1);
			modelMap.addAttribute("prevPage", pageNumber - 1);
			model.addObject("nextPage", pageNumber + 1);
			modelMap.addAttribute("nextPage", pageNumber + 1);
		}
			
		return model;
	}
	
	@RequestMapping("/faq")
	public String renderFaq(){
		
		return "faq";
	}
	
	
	@RequestMapping("/contactus")
	public String renderContactUs(){
		
		return "contactus";
	}
	
	
	@RequestMapping("/triggerEmail")
	public String triggerEmail(
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "message", required = false) String message,
			HttpSession session,ModelMap model){
		TriggerEmail.sendEmail(name, message, email);
		model.addAttribute("mailsent", "true");
		return "contactus";
	}
	
	
	

	

}
