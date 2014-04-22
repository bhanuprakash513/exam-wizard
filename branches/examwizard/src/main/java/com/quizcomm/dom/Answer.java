package com.quizcomm.dom;

public class Answer {
	
	private Boolean correct;
	private String title;
	private Long id;
	private Boolean userAnswer;
	
	public Boolean getCorrect() {
		return correct;
	}
	public void setCorrect(Boolean correct) {
		this.correct = correct;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Boolean getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(Boolean userAnswer) {
		this.userAnswer = userAnswer;
	}
}
