package com.quizcomm.dao;

import java.util.List;

import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.User;
import com.quizcomm.dom.UserAnswer;

public interface QuizDao {
	public Quiz createQuiz(Quiz quiz);
	public void deleteQuestion(Long qid);
	public Quiz getQuizByPK(Long pk);
	public Quiz getIncompleteQuiz(String userId);
	public boolean deleteQuiz(Quiz quiz);
	public List<Quiz> getUserQuiz(String userId);
	public User getQuizOwner(String userId);
	public List<Quiz> search(String term,int start,int max);
	public int getSearchCount(String term);
	public void competeQuiz(UserAnswer userAnswer);
	//public Quiz getQuizForTest(Long quizId,String userName);
	public List<UserAnswer> getUserAnswers(Long quizId,Long userId);
	
	public List<Quiz> getUserQuiz(Long userId,int start,int max);
	public int getUserQuizCount(Long userId);
	
	public int getQuizTakenCount(Long userId);
	public List<Quiz>  getTakenQuizzes(Long userName,int start,int max);
	
}

