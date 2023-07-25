<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List,com.quiz.QuizWebApplication.models.Submissions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>submissions</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style type="text/css">
    

.sub-container {
    background-color: #f0f0f0;
    border: 2px solid #ccc;
    padding: 5px;
    border-radius: 5px;
    width: 400px;
    margin: 0 auto;
    /* Add padding after the score container */
    margin-bottom: 20px;
  }
    
    .content-container {
    display: flex;
    flex-wrap: wrap; /* Allow boxes to wrap to a new line if needed */
    justify-content: space-between; /* Distribute boxes evenly along the container */
  }

  /* Adjust the width of each box to span the full container width */
  .content-container .box {
    flex-basis: 100%; /* Each box spans the full container width */
    margin-bottom: 20px;
    padding: 15px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Add shadow effect */
  }
.content-container .box h2 {
    color: #007bff; /* Optional: Change the color of the heading */
  }

  .content-container .box p {
    color: #333; /* Optional: Change the color of the paragraph text */
  }
</style>
</head>
<body>
	<jsp:include page="IndexHeader.jsp"></jsp:include>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

	</br>
	</br>
	<div class="content-container">
    <% 
    List<Submissions> lasub = (List<Submissions>) request.getSession().getAttribute("allmysubmissions");

    if (lasub != null && !lasub.isEmpty()) {
        for (Submissions s : lasub) {
            Submissions sub = s;
            List<String> subques = s.getAllquestion();
            List<String> subans = s.getUans();
            List<String> rans = s.getAns();
    %>
            <div class="sub-container">
                <h3>Submission Date&Time:</h3> <%= s.getSubDate() %> <h3>SubmissionID:</h3> <%= s.getSubId() %>
            </div>
            <% 
            while (!subques.isEmpty()) {
                String question = subques.remove(0);
                String userAnswer = subans.remove(0);
                String rightAnswer = rans.remove(0);
            %>
                <div class="box">
                    <h2>Question: <%= question %></h2>
                    <p><h4>Rightans: </h4> <%= rightAnswer %> <h4>Option You opted: </h4> <%= userAnswer %></p>
                </div>
            <% 
            }
        }
    }
    %>
</div>
	<%-- <jsp:include page="IndexFooter.jsp"></jsp:include> --%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
</body>
</html>