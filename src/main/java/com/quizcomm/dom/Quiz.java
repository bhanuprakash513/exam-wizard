package com.quizcomm.dom;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.annotate.JsonManagedReference;

@Entity
@Table(name="quiz")
public class Quiz implements Serializable {
	
	private static final long serialVersionUID = 374483557990285985L;

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="quizid")
	private Long id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="type")
	private String type;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="owner")
	@JsonIgnore
	private User owner;
	
	@Column(name="status")
	private String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="createddate")
	private Calendar createdDate;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="modifieddate")
	private Calendar modifiedData;
	
	
	@OneToMany(fetch = FetchType.EAGER , mappedBy = "quiz",cascade=CascadeType.ALL)
	//@Cascade({CascadeType.ALL})
	//@JoinColumn(name="QuizId", nullable=false)
	@JsonManagedReference
	List<Question> questions; 
	
	@Transient
	private String completeSuccess;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@JsonIgnore
	public User getOwner() {
		return owner;
	}

	
	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	
	public Calendar getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Calendar createdDate) {
		this.createdDate = createdDate;
	}

	public Calendar getModifiedData() {
		return modifiedData;
	}

	public void setModifiedData(Calendar modifiedData) {
		this.modifiedData = modifiedData;
	}

	@JsonManagedReference
	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public String getCompleteSuccess() {
		return completeSuccess;
	}

	public void setCompleteSuccess(String completeSuccess) {
		this.completeSuccess = completeSuccess;
	}
	
}
