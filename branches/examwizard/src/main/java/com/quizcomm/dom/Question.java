package com.quizcomm.dom;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="questions")
public class Question {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="questionid")
	private Long questionId;
	
	@Transient
	private Long quizIdentifier;
	
	@ManyToOne
	//@Cascade({CascadeType.ALL})
    @JoinColumn(name="quizid", nullable = false, updatable = true, insertable = true)
	@JsonBackReference
	private Quiz quiz;
	
	@Column(name="content")
	@JsonIgnore
	private String content;
	
	@Column(name="type")
	private String type;
	
	@Column(name="title")
	private String title;
	
	@Transient
	private List<Answer> answers;
	

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}


	public Long getQuizIdentifier() {
		return quizIdentifier;
	}

	public void setQuizIdentifier(Long quizIdentifier) {
		this.quizIdentifier = quizIdentifier;
	}

	@JsonIgnore
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Transient
	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	@JsonBackReference
	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}	
	
	
}
