<script src="${pageContext.request.contextPath}/resources/js/paypal-button.min.js"></script> 

<sec:authorize access="hasRole('ROLE_ADMIN')">
   	<div id="log_btn_div">Hi <sec:authentication property="principal.username" />!!!&nbsp;&nbsp;
       	<a href="${pageContext.request.contextPath}/<c:url value="j_spring_security_logout" />" class="log_btn">Logout</a>
    </div>       
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
   	<div id="log_btn_div">Hi <sec:authentication property="principal.username" />!!!&nbsp;&nbsp;
       	<a href="${pageContext.request.contextPath}/<c:url value="j_spring_security_logout" />" class="log_btn">Logout</a>
    </div>       
</sec:authorize>
<sec:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	<div id="log_btn_div">
		<a href="${pageContext.request.contextPath}/register" class="log_btn">Register Now</a>
		<a href="login" class="log_btn">Login</a>
	</div>      
</sec:authorize>
		
<sec:authorize access="!hasRole('ROLE_ADMIN')">	
	<div id="logo">
		<a href=${pageContext.request.contextPath}><img alt="MCQ" src="${pageContext.request.contextPath}/resources/images/quizcomm_logo.png"></a> 
	</div>
	<div id="menudiv" >
		<nav id="menu-wrap"><div id="menu-trigger">Menu</div>    
			<ul id="menu">
				<li><a href="${pageContext.request.contextPath}">Home</a></li>
					<sec:authorize access="hasRole('ROLE_USER')">
							<li><a href="#">My Quiz</a>
							<ul>
							<li><a href="${pageContext.request.contextPath}/quiz/myQuizzes">Quiz Created by you</a></li>
							<li><a href="${pageContext.request.contextPath}/quiz/quizzesTaken">Quiz Taken by you</a></li>
							</ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/profile/getProfile">Profile</a></li>
					</sec:authorize>

						<li><a href="${pageContext.request.contextPath}/quiz/createQuiz">Create Quiz</a></li>

						<li><a href="${pageContext.request.contextPath}/faq">FAQ</a></li>
						<li><a href="${pageContext.request.contextPath}/contactus">Contact Us</a></li>
						
			</ul>
		</nav>
</sec:authorize>