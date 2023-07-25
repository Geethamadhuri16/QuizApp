<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.quiz.QuizWebApplication.models.Questions,java.util.List" %> 
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JavaQuestions</title>
<style>
 
 .outer-container {
      padding: 20px; /* Add padding around the table */
    }
    
    .table-container {
      overflow-x: auto; /* Enable horizontal scrolling if table exceeds container width */
    }
 
 
    table {
      width: 100%;
      border-collapse: collapse;
     

    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    /* Apply different background colors to odd and even rows */
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    
    /* Add responsive styles for smaller screens */
    @media screen and (max-width: 600px) {
      table {
       font-size: 12px;
      }
      
      th, td {
        padding: 4px;
      }
    }
  </style>
</head>
<body>
<jsp:include page="IndexHeader.jsp"></jsp:include>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
   
</br>
</br>
<div class="outer-container">
<div class="table-container">
 <table>
                <tr>
                    <th>QuestionId</th>
                    <th>Question</th>
                    <th>Difficulty</th>
                    <th>Language</th>
                    <th>option1</th>
                    <th>option2</th>
                    <th>option3</th>
                    <th>option4</th>
                    <th>Rightans</th>
                </tr>
                <%List<Questions> questionList = (List<Questions>) request.getAttribute("questions");
                if (questionList != null && !questionList.isEmpty()) {
                    for (Questions q : questionList) { %>
                
                    <tr>
                    <td><%=q.getId() %></td>
                    <td><%=q.getLanguage() %></td>
                    <td><%=q.getDifficulty() %></td>
                    <td><%=q.getQuestion() %></td>
                    <td><%=q.getOption1() %></td>
                    <td><%=q.getOption2() %></td>
                    <td><%=q.getOption3() %></td>
                    <td><%=q.getOption4() %></td>
                    <td><%=q.getRightans() %></td>
                        
                    </tr>
                    <%}
                }
                    %>
               
            </table>
  </div>
  </div>
 </br>
 </br>
 
  
<%-- <jsp:include page="IndexFooter.jsp"></jsp:include> --%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">

</body>
</html>