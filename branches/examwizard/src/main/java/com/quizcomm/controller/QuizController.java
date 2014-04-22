package com.quizcomm.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.quizcomm.bo.QuizBo;
import com.quizcomm.bo.UserBo;
import com.quizcomm.dao.UserDao;
import com.quizcomm.dom.Question;
import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.User;
import com.quizcomm.model.TestQuizModel;
import com.quizcomm.util.Constants;

@Controller
@RequestMapping(value = "/quiz")
public class QuizController {

	private static final int PAGE_SIZE = 10;

	@Autowired
	private QuizBo quizBo;

	@Autowired
	private UserBo userBo;

	@RequestMapping(value = "/createQuiz", method = RequestMethod.GET)
	public String loadCreateQuizPage() {
		return "createQuiz";
	}

	@RequestMapping(value = "/createQuizJson", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	Quiz createQuizJson(@RequestBody Quiz quiz, Principal principal)
			throws JsonGenerationException, JsonMappingException, IOException {
		if (quiz != null) {
			quiz.setOwner(userBo.getUser(principal.getName())); // set the real
																// owner
		}
		quiz.setStatus("INCOMPLETE");
		quizBo.processQuiz(quiz);
		Quiz createdQuiz = quizBo.createQuiz(quiz);
		return createdQuiz;
	}

	@RequestMapping(value = "/createQuizNew", method = RequestMethod.GET)
	public String loadCreateQuizNew() {
		return "createQuizNew";
	}

	@RequestMapping(value = "/deleteQuestion", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	Quiz deleteQuestionJson(@RequestBody Question question, Principal principal)
			throws JsonGenerationException, JsonMappingException, IOException {
		quizBo.deleteQuestion(question.getQuestionId());
		Quiz quiz = quizBo.getQuizByPK(question.getQuizIdentifier());
		quiz.getQuestions();
		quizBo.populateObjectsFromJson(quiz);
		return quiz;
	}

	@RequestMapping(value = "/deleteQuiz", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	String deleteQuizJson(@RequestBody Quiz quiz, Principal principal)
			throws JsonGenerationException, JsonMappingException, IOException {

		return "redirect:/quiz/createQuiz";
	}

	@RequestMapping(value = "/quizCreateCompleteJson", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	String quizCreateCompleteJson(@RequestBody Quiz quiz, Principal principal)
			throws JsonGenerationException, JsonMappingException, IOException {
		// set current quiz status to complete
		quiz.setStatus("COMPLETE");
		quizBo.processQuiz(quiz);
		quizBo.createQuiz(quiz);
		return "redirect:/myQuizList";
	}

	@RequestMapping(value = "/getUnsavedQuiz", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	Quiz getUnsavedQuiz(Principal principal) throws JsonGenerationException,
			JsonMappingException, IOException {
		Quiz quiz = quizBo.getIncompleteQuiz(principal.getName());
		if (quiz == null)
			return null;
		quiz.getQuestions();
		quizBo.populateObjectsFromJson(quiz);
		return quiz;
	}

	@RequestMapping(value = "/completeQuizJson", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	Quiz completeQuiz(@RequestBody Quiz quiz, Principal principal)
			throws JsonGenerationException, JsonMappingException, IOException {
		if (quiz != null) {
			quiz.setOwner(userBo.getUser(principal.getName())); // set the real
																// owner
		}
		quiz.setStatus(Constants.QUIZ_STATUS_COMPLETE);
		quizBo.processQuiz(quiz);
		Quiz createdQuiz = quizBo.createQuiz(quiz);
		return createdQuiz;
	}
	
	   //sdfs
	@RequestMapping(value = "/myQuizzes", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseStatus(HttpStatus.OK)
	public 
	ModelAndView myQuizList(Principal principal,@RequestParam(value = "page", required = false) String page){
		ModelAndView model = new ModelAndView("myQuizzes");
		User user = userBo.getUserByUserId(principal.getName());
		int start = 0;
		int pageNumber = 0;
		boolean next = false;
		boolean prev = false;

		if (page == null || !StringUtils.hasLength(page)) {
			page = "1";
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

		int totalCount = quizBo.getUserQuizCount(user.getId());

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

		List<Quiz> quizList = quizBo.getUserQuizzes(user.getId(), start, PAGE_SIZE);

		
		model.addObject("next", next);
		model.addObject("prev", prev);
		model.addObject("pages", prev);
		model.addObject("quizList", quizList);
		model.addObject("pageCount", pageCount);
		model.addObject("prevPage", pageNumber - 1);
		model.addObject("nextPage", pageNumber + 1);
		return model;
	}


	@RequestMapping(value = "/cancelQuizJson", method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody
	String cancelQuiz(@RequestBody Quiz quiz, Principal principal)
			throws JsonGenerationException, JsonMappingException, IOException {

		if (quiz == null)
			return Constants.QUIZ_CANCEL_FAILURE;

		User owner = userBo.getUser(principal.getName());

		Quiz currentQuiz = quizBo.getQuizByPK(quiz.getId());

		if (Constants.QUIZ_STATUS_PROMOTED.equals(currentQuiz.getStatus())) {
			return Constants.QUIZ_CANCEL_PROMOTED;
		}

		if (owner.getId() == currentQuiz.getOwner().getId()
				&& quizBo.deleteQuiz(currentQuiz)) {
			return Constants.QUIZ_CANCEL_SUCCESS;
		}

		return Constants.QUIZ_CANCEL_FAILURE;
	}

	@RequestMapping(value = "/getUserQuizzesJson", method = RequestMethod.POST)
	public @ResponseBody
	Quiz getUserQuizzes(Principal principal) throws JsonGenerationException,
			JsonMappingException, IOException {
		Quiz quiz = quizBo.getIncompleteQuiz(principal.getName());
		quizBo.populateObjectsFromJson(quiz);
		return quiz;
	}
	
	@RequestMapping(value = "/initTestQuiz/{quizId}",  method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView initQuizForTest(Principal principal, @PathVariable int quizId)
			throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView model = new ModelAndView("takeQuiz");
		model.addObject("quizId", quizId );
		return model;
	}

	@RequestMapping(value = "/getTestQuiz/{quizId}", method = RequestMethod.POST)
	public Quiz getQuizForTest(Principal principal, @PathVariable int quizId)
			throws JsonGenerationException, JsonMappingException, IOException {
		Quiz quiz = quizBo.getQuizforTest(principal.getName(), (long) quizId);
		quizBo.populateObjectsFromJson(quiz);
		return quiz;
	}
	
	@RequestMapping(value = "/quizView/{quizId}",  method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView initQuizView(Principal principal, @PathVariable int quizId)
			throws JsonGenerationException, JsonMappingException, IOException {
		ModelAndView model = new ModelAndView("viewQuiz");
		model.addObject("quizId", quizId );
		return model;
	}
	
	

	
	@RequestMapping(value = "/loadQuizView/{quizId}",  method = { RequestMethod.GET,
			RequestMethod.POST })
	public Quiz loadQuizView(Principal principal, @PathVariable int quizId)
			throws JsonGenerationException, JsonMappingException, IOException {
		Quiz quiz = quizBo.getQuizforTest(principal.getName(), (long) quizId);
		quizBo.populateObjectsFromJson(quiz);
		return quiz;
	}
	

	@RequestMapping(value = "/search", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView search(
			@RequestParam(value = "term", required = false) String term,
			@RequestParam(value = "page", required = false) String page) {

		ModelAndView model = new ModelAndView("search");
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
		model.addObject("next", next);
		model.addObject("prev", prev);
		model.addObject("pages", prev);
		model.addObject("quizList", quizList);
		model.addObject("pageCount", pageCount);
		model.addObject("prevPage", pageNumber - 1);
		model.addObject("nextPage", pageNumber + 1);

		return model;
	}

	@RequestMapping(value = "/searchTest", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView searchLoad() throws JsonGenerationException,
			JsonMappingException, IOException {

		String page = "0";
		String term = "";

		ModelAndView model = new ModelAndView("search");
		int start = 0;
		int pageNumber = 0;
		boolean next = false;
		boolean prev = false;

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

		List<Quiz> quizList = quizBo.search(term, start, PAGE_SIZE);

		model.addObject("term", term);
		model.addObject("next", next);
		model.addObject("prev", prev);
		model.addObject("pages", prev);
		model.addObject("quizList", quizList);
		model.addObject("pageCount", pageCount);
		model.addObject("prevPage", pageNumber - 1);
		model.addObject("nextPage", pageNumber + 1);

		return model;
	}
	
	@RequestMapping(value = "/completeTest", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody String completeTest(@RequestBody Quiz quiz, Principal principal) throws JsonGenerationException,
			JsonMappingException, IOException {
		quizBo.competeQuiz(quiz, principal.getName());
		return quiz.getId().toString();
	}
	
	@RequestMapping(value = "/viewResult/{quizId}", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView viewResult(@PathVariable String quizId, Principal principal) throws JsonGenerationException,
			JsonMappingException, IOException {
		
		ModelAndView model = new ModelAndView("viewResult");
		
		try{
			int qid = Integer.parseInt(quizId);
			TestQuizModel result = quizBo.getResults((long)qid, principal.getName());
			model.addObject("result", result);
		}catch(Exception ex){
			model.addObject("error", true);
		}

		return model;
	}
	
	@RequestMapping(value = "/viewTest/{quizId}", method = { RequestMethod.GET,
			RequestMethod.POST })
	@ResponseStatus(HttpStatus.OK)
	public ModelAndView viewTest(@PathVariable String quizId, Principal principal) throws JsonGenerationException,
			JsonMappingException, IOException {
		
		ModelAndView model = new ModelAndView("viewTest");
		
		
		try{
			boolean isOwner = false;
			int qid = Integer.parseInt(quizId);
			Quiz quiz = quizBo.getQuizByPK((long)qid);
			
			if(principal.getName().equals(quiz.getOwner().getUserId())){
				isOwner = true;
			}
			
			model.addObject("quiz", quiz);
			model.addObject("isOwner",isOwner);
		}catch(Exception ex){
			model.addObject("error", true);
		}

		return model;
	}
	
	@RequestMapping(value = "/quizzesTaken", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseStatus(HttpStatus.OK)
	public 
	ModelAndView quizzesTaken(Principal principal,@RequestParam(value = "page", required = false) String page){
		ModelAndView model = new ModelAndView("quizzesTaken");
		User user = userBo.getUserByUserId(principal.getName());
		int start = 0;
		int pageNumber = 0;
		boolean next = false;
		boolean prev = false;

		if (page == null || !StringUtils.hasLength(page)) {
			page = "1";
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

		int totalCount = quizBo.getQuizTakenCount(user.getId());

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

		List<Quiz> quizList = quizBo.getTakenQuizzes(user.getId(), start, PAGE_SIZE);

		
		model.addObject("next", next);
		model.addObject("prev", prev);
		model.addObject("pages", prev);
		model.addObject("quizList", quizList);
		model.addObject("pageCount", pageCount);
		model.addObject("prevPage", pageNumber - 1);
		model.addObject("nextPage", pageNumber + 1);
		return model;
	}

		

}
