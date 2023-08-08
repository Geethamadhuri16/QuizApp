<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QuizApp Index</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
 <style>
/* Custom class for the specific code block */
.custom-container {
  display: flex;
}

.custom-container .image-container {
  flex: 1;
}

.custom-container .content-container {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.custom-container .box {
 margin-bottom: 20px;
  padding: 15px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Add shadow effect */
}
.custom-container .box h2 {
    color: #007bff; /* Optional: Change the color of the heading */
  }

  .custom-container .box p {
    color: #333; /* Optional: Change the color of the paragraph text */
  }
   div#mydivi{
            width:500px;
            height:50px;
            color:black;
            background-color:blueviolet;
            padding:10px;
            font-weight: bolder;
            position: relative;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            animation-name: boxi;
            animation-duration: 4s;
            animation-delay: 1s;
            animation-iteration-count: infinite;
            animation-direction:alternate ;

        }
        @keyframes boxi{
            0%{background-color: cyan;left:0px;top:0px;}
            25%{background-color: yellow;left:200px;top:0px;}
            50%{background-color:green;left:200px;top:200px}
            70%{background-color: aquamarine;left:0px;top:200px;}
            100%{background-color: aqua;left:0px;top:0px;}
        }

 
</style>

 
</head>
<body>
<jsp:include page="IndexHeader.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  <script type="text/javascript">
 function java() {
    window.location.href = "/javauser";
  }
 function python() {
	    window.location.href = "/pythonuser";
	  }
 function js() {
	    window.location.href = "/jsuser";
	  }
 function redirectToAnotherJSP() {
	    window.location.href = "/views/login.jsp";
	  }
</script>
  <div class="custom-container">
  <div class="image-container">
    <img src="https://t3.ftcdn.net/jpg/03/45/97/36/360_F_345973621_sMifpCogXNoIDjmXlbLwx1QZA5ZmQVl8.jpg" height="450" width="750">
    <div id="mydivi" style="height: 80px;">Login! <br> </>Select Programming Language of your choice <br> Take Quiz!! </div>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       <br>
       
       
  </div>

  <div class="content-container">
    <div class="box">
      <h2>Java</h2>
      <p>Java is a widely-used programming language for coding web applications. It has been a popular choice among developers for over two decades, with millions of Java applications in use today. Java is a multi-platform, object-oriented, and network-centric language that can be used as a platform in itself. It is a fast, secure, reliable programming language for coding everything from mobile apps and enterprise software to big data applications and server-side technologies.</p>
      <%if(request.getSession().getAttribute("logged")!=null) {%>
      <button type="button" class="btn btn-outline-primary"onclick="java()">Take Java Quiz</button>
     <%} else{%>
      <button type="button" class="btn btn-outline-primary" onclick="redirectToAnotherJSP()"> Login To Take Java Quiz</button>
     <%} %>
    </div>

    <div class="box">
      <h2>Python</h2>
      <p>Python is a general-purpose language, meaning it can be used to create a variety of different programs and isn't specialized for any specific problems. This versatility, along with its beginner-friendliness, has made it one of the most-used programming languages today.</p>
     <%if(request.getSession().getAttribute("logged")!=null) {%>
      <button type="button" class="btn btn-outline-primary" onclick="python()">Take Python Quiz</button>
     <%} else{%>
      <button type="button" class="btn btn-outline-primary" onclick="redirectToAnotherJSP()"> Login To Take Python Quiz</button>
     <%} %>
    </div>
    

    <div class="box">
      <h2>Javascript</h2>
      <p>JavaScript is a multi-paradigm, dynamic language with types and operators, standard built-in objects, and methods. Its syntax is based on the Java and C languages — many structures from those languages apply to JavaScript as well. </p>
     <%if(request.getSession().getAttribute("logged")!=null) {%>
      <button type="button" class="btn btn-outline-primary" onclick="js()">Take Javascript Quiz</button>
     <%} else{%>
      <button type="button" class="btn btn-outline-primary" onclick="redirectToAnotherJSP()"> Login To Take Javascript Quiz</button>
     <%} %>
    </div>
    
     
  </div>
</div>


  
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  <%-- <jsp:include page="IndexFooter.jsp"></jsp:include> --%>
</body>
</html>