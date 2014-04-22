package com.quizcomm.bo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;

import com.quizcomm.dao.QuizDao;
import com.quizcomm.dao.UserDao;
import com.quizcomm.dom.Answer;
import com.quizcomm.dom.Question;
import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.User;
import com.quizcomm.dom.UserAnswer;
import com.quizcomm.model.TestQuizModel;

public class QuizBoImpl implements QuizBo {

	@Autowired
	private QuizDao quizDao;

	@Autowired
	private UserDao userDao;

	public Quiz createQuiz(Quiz quiz) {
		return quizDao.createQuiz(quiz);
	}

	public void processQuiz(final Quiz quiz) throws JsonGenerationException,
			JsonMappingException, IOException {

		if (quiz != null && quiz.getQuestions() != null) {
			for (int i = 0; i < quiz.getQuestions().size(); i++) {
				Question question = quiz.getQuestions().get(i);
				String contentJson = getJsonString(question);
				quiz.getQuestions().get(i).setQuiz(quiz);
				quiz.getQuestions().get(i).setContent(contentJson);
			}
		}

	}

	private String getJsonString(Object object) throws JsonGenerationException,
			JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(object);
	}

	public void deleteQuestion(Long qid) {
		quizDao.deleteQuestion(qid);
	}

	public Quiz getQuizByPK(Long pk) {
		return quizDao.getQuizByPK(pk);
	}

	public Quiz getIncompleteQuiz(String userId) {

		return quizDao.getIncompleteQuiz(userId);
	}

	public void populateObjectsFromJson(Quiz quiz) throws JsonParseException,
			JsonMappingException, IOException {
		if (quiz.getQuestions() != null) {
			Iterator<Question> qsItr = quiz.getQuestions().iterator();
			List<Question> populatedQuestions = new ArrayList<Question>();
			while (qsItr.hasNext()) {
				Question q = qsItr.next();
				Question pQ = getQuestion(q.getContent());
				pQ.setQuestionId(q.getQuestionId());
				populatedQuestions.add(pQ);
			}
			quiz.setQuestions(populatedQuestions);
		}
	}

	public Quiz getQuizforTest(String userName, Long qid) {
		Quiz quiz = quizDao.getQuizByPK(qid);
		// if(userName.equals(quiz.getOwner().getUserId())) return null;
		return quiz;
	}

	private List<Answer> getAnswerObjects(String json)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(json, new TypeReference<List<Answer>>() {
		});
	}

	private Question getQuestion(String json) throws JsonParseException,
			JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		return mapper.readValue(json, Question.class);
	}

	public boolean deleteQuiz(Quiz quiz) {
		return quizDao.deleteQuiz(quiz);
	}

	public List<Quiz> getUserQuizzes(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public User getQuizOwner(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Quiz> search(String term, int start, int max) {
		return quizDao.search(term, start, max);
	}

	public int getSearchCount(String term) {
		return quizDao.getSearchCount(term);
	}

	public void competeQuiz(Quiz resultQuiz, String userName)
			throws JsonParseException, JsonMappingException, IOException {
		
		
		
		User user = userDao.getUser(userName);
		
		
		List<UserAnswer> userOldAnswers = quizDao.getUserAnswers(resultQuiz.getId(),user.getId());
		
		if(userOldAnswers!=null && userOldAnswers.size()>0){
			return;
		}
		
		UserAnswer uAnswer = new UserAnswer();
		Quiz quiz = quizDao.getQuizByPK(resultQuiz.getId());
		populateObjectsFromJson(quiz);
		uAnswer.setUser(user);

		List<Question> userQuestion = resultQuiz.getQuestions();
		List<UserAnswer> userAnswers = new ArrayList<UserAnswer>();
		List<Question> correctAnswers = quiz.getQuestions();

		if (correctAnswers != null) {
			Iterator<Question> correctItr = correctAnswers.iterator();
			while (correctItr.hasNext()) {
				UserAnswer userAnswerToDB = new UserAnswer();
				Question correctAns = correctItr.next();
				Question userAns = getUserAnswer(correctAns.getQuestionId(),
						userQuestion);
				setUserAnswer(correctAns, userAns);

				if (userAns != null) {
					userAnswerToDB.setQuestion(correctAns);
					userAnswerToDB.setContent(getJsonString(correctAns));
					userAnswerToDB.setUser(user);
					if (isCorrect(correctAns)) {
						userAnswerToDB.setCorrect(true);
						userAnswerToDB.setMarks(1);
					} else {
						userAnswerToDB.setCorrect(false);
						userAnswerToDB.setMarks(0);
					}
					userAnswerToDB.setTime(Calendar.getInstance());
					quizDao.competeQuiz(userAnswerToDB);

				}
			}
		}
	}

	private Question getUserAnswer(Long questionId, List<Question> userAnswers) {

		if (userAnswers != null) {
			for (Question q : userAnswers) {
				if (questionId.equals(q.getQuestionId())) {
					return q;
				}
			}
		}

		return null;
	}

	private void setUserAnswer(Question correctAns, Question usrAns) {

		if (correctAns != null) {
			Iterator<Answer> ansItr = correctAns.getAnswers().iterator();
			while (ansItr.hasNext()) {
				Answer ans = ansItr.next();
				if (usrAns != null && usrAns.getAnswers() != null) {
					for (Answer uAns : usrAns.getAnswers()) {
						if (ans.getId() == uAns.getId()) {
							ans.setUserAnswer(uAns.getUserAnswer());
						}
					}
				}

			}

		}
	}

	private boolean isCorrect(Question question) {

		if (question != null && question.getAnswers() != null) {
			for (Answer ans : question.getAnswers()) {
				if (ans.getCorrect() != ans.getUserAnswer())
					return false;
			}
		}

		return true;
	}

	public QuizDao getQuizDao() {
		return quizDao;
	}

	public void setQuizDao(QuizDao quizDao) {
		this.quizDao = quizDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public TestQuizModel getResults(Long quizId, String userName) throws JsonParseException, JsonMappingException, IOException {
		TestQuizModel model = new TestQuizModel();
		User user = userDao.getUser(userName);
		List<UserAnswer> userAnswers = quizDao.getUserAnswers(quizId, user.getId());
		Quiz quiz = quizDao.getQuizByPK(quizId);
		
		model.setQuiz(quiz);
		
		if(userAnswers!=null){
			Iterator<UserAnswer> itr = userAnswers.iterator();
			int totalCorrect = 0;
			while(itr.hasNext()){
				UserAnswer ua = itr.next();
				
				ua.setQuestion(getQuestion(ua.getContent()));
				if(ua.getQuestion()!=null){
					//ua.getQuestion().setQuestionId(questionId);
				}
				if(ua.isCorrect())totalCorrect++;
			}
			model.setUserAnswers(userAnswers);
			model.setTotalQuestions(userAnswers.size());
			model.setTotalCorrect(totalCorrect);
		}
		
		return model;
	}
	
	public List<Quiz> getUserQuizzes(Long userId,int start,int max){
		//User user = userDao.getUser(userName);
		return quizDao.getUserQuiz(userId, start, max);
	}
	
	public int getUserQuizCount(Long userId){
		//User user = userDao.getUser(userId);
		return quizDao.getUserQuizCount(userId);
	}

	public int getQuizTakenCount(Long userId) {
		// TODO Auto-generated method stub
		return quizDao.getQuizTakenCount(userId);
	}

	public List<Quiz> getTakenQuizzes(Long userName, int start, int max) {
		// TODO Auto-generated method stub
		return quizDao.getTakenQuizzes(userName, start, max);
	}
	
	
	
	
}
