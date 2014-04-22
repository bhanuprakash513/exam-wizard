package com.quizcomm.dom;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="answers")
public class UserAnswer implements Serializable{
	

	private static final long serialVersionUID = -3654356648807165430L;

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="answerid")
	private int answerId;
	
	@Column(name="content")
	private String content;
	
	@Column(name="time")
	private Calendar time;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="questionid")
	private Question question;
	
	@Column(name="correct")
	private boolean correct;
	
	@Column(name="marks")
	private Integer marks;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="userid")
	private User user;

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Calendar getTime() {
		return time;
	}

	public void setTime(Calendar time) {
		this.time = time;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public boolean isCorrect() {
		return correct;
	}

	public void setCorrect(boolean correct) {
		this.correct = correct;
	}

	public Integer getMarks() {
		return marks;
	}

	public void setMarks(Integer marks) {
		this.marks = marks;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

}
