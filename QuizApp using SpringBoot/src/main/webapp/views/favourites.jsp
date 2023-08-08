<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.quiz.QuizWebApplication.models.Questions, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Favourites</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style type="text/css">
  .content-container {
	display: flex;
	flex-wrap: wrap; /* Allow boxes to wrap to a new line if needed */
	justify-content: space-between;
	/* Distribute boxes evenly along the container */
}
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
.remove-button {
        margin-left: auto;
    }
  </style>
</head>
<body>
  <script type="text/javascript">
    function handleClickremove(questionid) {
      var questionId = questionid;
      // Prepare the data to be sent in the request body
      var data = {
        questionid: questionId
      };
      // Make a fetch API call to send the data as JSON to the server-side
      fetch('/deletefromfav', {
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
        alert("RemovedFromFavourites");
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
  <br/>
  <br/>

  <div class="content-container">
              <h4 class="card-title mb-4">Your Favourites</h4>
              <!-- Cart items loop -->
              <% List<Questions> theusersfav = (List<Questions>) request.getAttribute("userFavQuestions");
              if (theusersfav != null && !theusersfav.isEmpty()) {
                for (Questions q : theusersfav) { %>
                  
                           <div class="box">
                            <h2><%= q.getQuestion() %></h2>
                            <p>option1: <%= q.getOption1() %></p>
                            <p>option2: <%= q.getOption2() %></p>
                            <p>option3: <%= q.getOption3() %></p>
                            <p>option4: <%= q.getOption4() %></p>
                                                    <a class="btn btn-light border text-danger icon-hover-danger remove-button" onclick="handleClickremove('<%= q.getId() %>')">Remove</a>
                            
                          </div>
                        
                    
                    
                     
                  
                <% }
              } %>
            </div>
         
        <!-- cart -->
        <!-- summary -->
        <br/>
      
  </section>
  <!-- cart + summary -->

 <%--  <jsp:include page="IndexFooter.jsp"></jsp:include> --%>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous">
</body>
</html>
