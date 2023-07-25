<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.quiz.QuizWebApplication.models.Questions,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chosen</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
.content-container {
	display: flex;
	flex-wrap: wrap; /* Allow boxes to wrap to a new line if needed */
	justify-content: space-between;
	/* Distribute boxes evenly along the container */
}

/* Adjust the width of each box to span the full container width */
 .box {
	flex-basis: 100%; /* Each box spans the full container width */
	display: flex;
    flex-direction: column;
	margin-bottom: 20px;
	padding: 15px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Add shadow effect */
}

.box h2 {
	color: #007bff; /* Optional: Change the color of the heading */
}

 .box p {
	color: #333; /* Optional: Change the color of the paragraph text */
}

.option {
	margin-bottom: 5px;
}

.option input[type="radio"] {
	margin-right: 5px;
}

.option label {
	cursor: pointer;
}

.submit-btn {
	margin-top: 15px;
}
.addbutton {
        margin-left: auto;
    }
</style>
</head>
<body>
	<script type="text/javascript">
	function handleClickAdd(questionid) {
		  var questionId = questionid;

		  // Prepare the data to be sent in the request body
		  var data = {
		    questionid: questionId
		  };

		  // Make a fetch API call to send the data as JSON to the server-side
		  fetch('/addtofavourites', {
		    method: 'POST',
		    headers: {
		      'Content-Type': 'application/json' // Update the Content-Type header
		    },
		    body: JSON.stringify(data) // Convert the data to JSON format
		  })
		  .then(response => {
		    if (!response.ok) {
		      throw new Error('Network response was not ok');
		    }
		    return response.text();
		  })
		  .then(responseText => {
		    console.log('Data sent successfully!');
		    alert("AddedToFavourites");
		    // Perform any further client-side actions here if needed
		  })
		  .catch(error => {
		    console.error('Error occurred:', error);
		    // Handle errors here, if any
		  });
		}

</script>
	<jsp:include page="IndexHeader.jsp"></jsp:include>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

	</br>
	</br>
	<div class="content-container">
		<form action="/submitQuiz">
			<!-- Update the action attribute to point to the controller URL -->
			<%List<Questions> questionList = (List<Questions>) request.getAttribute("questions");
     
      if (questionList != null && !questionList.isEmpty()) {
          for (Questions q : questionList) { %>
			<div class="box">
				
					<h2><%=q.getQuestion() %></h2>
					
				<div class="option">
					<input type="radio" name="<%=q.getId() %>"
						value="<%=q.getOption1()%>" id="option1">
					<!-- Use square brackets to pass the answers as an array -->
					<label for="option1"><%=q.getOption1() %></label>
				</div>
				<div class="option">
					<input type="radio" name="<%=q.getId() %>"
						value="<%=q.getOption2()%>" id="option2">
					<!-- Use square brackets to pass the answers as an array -->
					<label for="option2"><%=q.getOption2() %></label>
				</div>
				<div class="option">
					<input type="radio" name="<%=q.getId() %>"
						value="<%=q.getOption3()%>" id="option3">
					<!-- Use square brackets to pass the answers as an array -->
					<label for="option3"><%=q.getOption3() %></label>
				</div>
				<div class="option">
					<input type="radio" name="<%=q.getId() %>"
						value="<%=q.getOption4()%>" id="option4">
					<!-- Use square brackets to pass the answers as an array -->
					<label for="option4"><%=q.getOption4() %></label>
				</div>
				<a class="btn btn-light border icon-hover px-2 pt-2 addbutton"
					
					onclick="handleClickAdd('<%=q.getId() %>')"><i
					class="fas fa-heart fa-lg text-secondary px-1"></i></a>
			</div>
			<%}
        request.getSession().setAttribute("myquestions", questionList);
    }
    %>
			<button type="submit" class="btn btn-outline-primary">submit
			</button>
			<!-- Change button type to "submit" to trigger the form submission -->
		</form>
		<!-- Close the form element -->
	</div>
	</br>
	</br>
	<%-- <jsp:include page="IndexFooter.jsp"></jsp:include> --%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
  
</body>
</html>