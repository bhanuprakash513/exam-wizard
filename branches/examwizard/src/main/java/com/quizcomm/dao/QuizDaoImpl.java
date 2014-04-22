package com.quizcomm.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.quizcomm.dom.Quiz;
import com.quizcomm.dom.User;
import com.quizcomm.dom.UserAnswer;
import com.quizcomm.util.Constants;

@Repository
public class QuizDaoImpl implements QuizDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Quiz createQuiz(Quiz quiz) {

		if (quiz.getCreatedDate() == null) {
			quiz.setCreatedDate(Calendar.getInstance());
		}

		if (quiz.getModifiedData() == null) {
			quiz.setModifiedData(Calendar.getInstance());
		}
		getCurrentSession().saveOrUpdate(quiz);
		return quiz;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Transactional
	public void deleteQuestion(Long qid) {
		Query q = getCurrentSession().createQuery(
				"delete Question where id = :arg1");
		q.setParameter("arg1", qid);
		q.executeUpdate();

	}

	@Transactional
	public Quiz getQuizByPK(Long pk) {
		return (Quiz) getCurrentSession().get(Quiz.class, pk);
	}

	@Transactional
	public Quiz getIncompleteQuiz(String userId) {
		Query q = getCurrentSession()
				.createQuery(
						"select q from Quiz q,User u where q.owner.id = u.id and u.userId = :uid and q.status=:status")
				.setParameter("uid", userId)
				.setParameter("status", Constants.QUIZ_STATUS_INCOMPLETE);

		return (Quiz) q.uniqueResult();
	}

	@Transactional
	public boolean deleteQuiz(Quiz quiz) {
		Quiz currentQuiz = getQuizByPK(quiz.getId());
		if (Constants.QUIZ_STATUS_PROMOTED.equals(currentQuiz)) {
			return false;
		}
		getCurrentSession().delete(quiz);
		return true;

	}

	@Transactional
	public List<Quiz> getUserQuiz(String userId) {
		Query q = getCurrentSession()
				.createQuery(
						"select q from Quiz q,User u where q.owner.id = u.id and u.userId = :uid")
				.setParameter("uid", userId);

		return (List<Quiz>) q.list();
	}

	@Transactional
	public User getQuizOwner(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	public List<Quiz> search(String term, int start, int max) {
		// Criteria crit = getCurrentSession().createCriteria(Quiz.class);
		// crit.add(arg0)
		Query q = getCurrentSession()
				.createQuery(
						"select q from Quiz q where upper(q.title) like :term order by q.createdDate desc")
				.setParameter("term", "%" + term.toUpperCase() + "%")
				.setFirstResult(start).setMaxResults(max);
		return (List<Quiz>) q.list();
	}

	@Transactional
	public int getSearchCount(String term) {

		return ((Long) getCurrentSession()
				.createQuery(
						"select count(*) from Quiz q where upper(q.title) like :term")
				.setParameter("term", "%" + term.toUpperCase() + "%")
				.uniqueResult()).intValue();
	}

	@Transactional
	public void competeQuiz(UserAnswer userAnswer) {
		getCurrentSession().save(userAnswer);
	}

	@Transactional
	@SuppressWarnings("unchecked")
	public List<UserAnswer> getUserAnswers(Long quizId, Long userId) {
		Query q = getCurrentSession()
				.createQuery(
						"select a from UserAnswer a,Question q  where a.question.questionId = q.questionId and a.user.id =:userId and q.quiz.id =:quizId")
				.setParameter("userId", userId).setParameter("quizId", quizId);

		return q.list();
	}

	@Transactional
	public List<Quiz> getUserQuiz(Long userId, int start, int max) {
		Query q = getCurrentSession()
				.createQuery("Select q from Quiz q where q.owner.id=:uid order by q.createdDate desc")
				.setParameter("uid", userId).setFirstResult(start)
				.setMaxResults(max);
		return (List<Quiz>) q.list();
	}

	@Transactional
	public int getUserQuizCount(Long userId) {

		return ((Long) getCurrentSession()
				.createQuery(
						"Select count(*) from Quiz q where q.owner.id=:uid")
				.setParameter("uid", userId).uniqueResult()).intValue();
	}

	@Transactional
	public int getQuizTakenCount(Long userId) {

		return ((Long)getCurrentSession()
				.createQuery(
						"Select  count(distinct q) from Quiz q , Question qs,UserAnswer ua where q.id = qs.quiz.id and qs.questionId = ua.question.questionId and  ua.user.id =:uid")
				.setParameter("uid", userId).uniqueResult()).intValue();
	}

	@Transactional
	public List<Quiz> getTakenQuizzes(Long userId, int start, int max) {
		Query q = getCurrentSession()
				.createQuery(
						"Select  distinct q from Quiz q , Question qs,UserAnswer ua where q.id = qs.quiz.id and qs.questionId = ua.question.questionId and  ua.user.id =:uid order by q.createdDate desc")
				.setParameter("uid", userId).setFirstResult(start)
				.setMaxResults(max);
		return (List<Quiz>) q.list();
	}

}
