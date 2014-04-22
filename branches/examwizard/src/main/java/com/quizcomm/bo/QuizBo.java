package com.quizcomm.bo;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;

import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.User;
import com.quizcomm.dom.UserAnswer;
import com.quizcomm.model.TestQuizModel;

public interface QuizBo {
	
	public Quiz createQuiz(Quiz quiz);
	public void processQuiz(Quiz quiz) throws JsonGenerationException, JsonMappingException, IOException;
	public void deleteQuestion(Long qid);
	public Quiz getQuizByPK(Long pk);
	public Quiz getIncompleteQuiz(String userId);
	public void populateObjectsFromJson(Quiz quiz) throws JsonParseException, JsonMappingException, IOException;
	public Quiz getQuizforTest(String userName,Long qid);
	public boolean deleteQuiz(Quiz quiz);
	public List<Quiz> getUserQuizzes(String userId);
	public User getQuizOwner(String userId);
	public List<Quiz> search(String term,int start,int max);
	public int getSearchCount(String term);
	public void competeQuiz(Quiz quiz,String userName)throws JsonParseException, JsonMappingException, IOException;
	
	public TestQuizModel getResults(Long quizId,String userName)throws JsonParseException, JsonMappingException, IOException;
	public List<Quiz> getUserQuizzes(Long userName,int start,int max);
	public int getUserQuizCount(Long userId);
	public int getQuizTakenCount(Long userId);
	public List<Quiz>  getTakenQuizzes(Long userName,int start,int max);
	
}
