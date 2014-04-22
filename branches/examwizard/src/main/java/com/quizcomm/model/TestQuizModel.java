package com.quizcomm.model;

import java.util.List;

import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.UserAnswer;

public class TestQuizModel {
	
	private Quiz quiz;
	private int totalCorrect;
	private int totalQuestions;
	private List<UserAnswer> userAnswers;
	
	public Quiz getQuiz() {
		return quiz;
	}
	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}
	public int getTotalCorrect() {
		return totalCorrect;
	}
	public void setTotalCorrect(int totalCorrect) {
		this.totalCorrect = totalCorrect;
	}
	public List<UserAnswer> getUserAnswers() {
		return userAnswers;
	}
	public void setUserAnswers(List<UserAnswer> userAnswers) {
		this.userAnswers = userAnswers;
	}
	public int getTotalQuestions() {
		return totalQuestions;
	}
	public void setTotalQuestions(int totalQuestions) {
		this.totalQuestions = totalQuestions;
	}
	

}
