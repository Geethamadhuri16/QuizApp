<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginPage</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style type="text/css">
.div1 {
  margin: auto;
  width: 50%;
  border: 3px solid orange;
  padding: 10px;
}
.containera{
  display: flex;
  justify-content: space-between;
}

</style>
</head>
<body>

<jsp:include page="IndexHeader.jsp"></jsp:include>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
   
</br>
</br>
    <div class="div1">
    
    <h1>Login!</h1>
	<form action="/validation">
		</br>
		<input type="text" id="mail" name="E-mail" value="Email" size="50"> 
		</br>
		</br>
		
		<input type="password" id="pass" name="password" value="Password" size="50">
		</br>
		</br>
        <button type="submit" class="btn btn-outline-primary">SIGN-IN </button>
        
        </br>
		</br>
	</form>
    </div>
    </br>
    <div class="div1">
  <div class="containera">
    <a href="/views/Signup.jsp" class="align-left">sign up</a>
    <a href="/views/Alogin.jsp" class="align-right">adminLogin</a>
  </div>
</div>

	</br>
    </br>
    <%-- <jsp:include page="IndexFooter.jsp"></jsp:include> --%>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">

</body>
</html>
