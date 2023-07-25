<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IndexHeader</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<style type="text/css">
.welcome-text {
  float: right;
}
.icon-hover:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
}

.icon-hover:hover i {
  color: #3b71ca !important;
}

.btn.btn-outline-primary {
    border-color: #6c757d; /* Set the border color for the outline button */
    color: #6c757d; /* Set the text color for the outline button */
  }

  /* On hover, change the background and border color to grey */
  .btn.btn-outline-primary:hover {
    background-color: #6c757d; /* Set the background color on hover to grey */
    border-color: #6c757d; /* Set the border color on hover to grey */
    color: #fff; /* Set the text color on hover to white (optional) */
  }

  .nav-tabs {
    background-color:#444; 
    padding: 10px; /* Add some padding to the nav bar */
    border-radius: 5px; /* Add rounded corners to the nav bar */
  }

  /* Style for the active link */
  .nav-link.active {
    background-color: #f8f9fa; /* Set the background color of the active link */
    color: #fff; /* Set the text color of the active link */
    border-color: #007bff; /* Set the border color of the active link */
  }

  /* Style for the non-active links */
  .nav-link:not(.active) {
    color: white; /* Set the text color of non-active links */
  }

  /* On hover, change the background color and text color of non-active links */
  .nav-link:not(.active):hover {
    background-color: #e9ecef; /* Set the background color on hover */
    color: #0056b3; /* Set the text color on hover */
  }
  .navbar .btn-group {
      margin-right: 3px;
    }
</style>
</head>
<body>
<script type="text/javascript">
 function redirectToAnotherJSP() {
    window.location.href = "/views/login.jsp";
  }
 function redirectToSubmissions() {
	    window.location.href = "/mysubmissions";
	  }
 function redirectTofavourites() {
	    window.location.href = "/favourites";
	  }
</script>
<header>
<!-- Jumbotron -->
<div class="p-3 text-center bg-white border-bottom">
  <div class="container">
    <div class="row gy-3 align-items-center">
      <!-- Left elements -->
      <div class="col-lg-2 col-sm-4 col-4">
        <a href="" class="float-start" >
          <img src="https://png.pngtree.com/png-vector/20220530/ourmid/pngtree-quiz-banner-in-pop-art-style-png-image_4763335.png" height="90" width="80" />
        </a>
      </div>
      <!-- Left elements -->

      <!-- Center elements -->
      <div class="order-lg-last col-lg-5 col-sm-8 col-8">
        <div class="d-flex float-end">
         <%if(request.getSession().getAttribute("logged")==null){ %>
         
          <button type="button" class="btn btn-outline-primary" onclick="redirectToAnotherJSP()">login  <img  src="https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg" height="20" width="20" > </button>
          <%}else{ %>
          <button type="button" class="btn btn-outline-primary" onclick="redirectToSubmissions()">MySubmissions  <img  src="https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg" height="20" width="20" > </button>
          <button type="button" class="btn btn-outline-primary" onclick="redirectTofavourites()">Favourites <img  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9zd4OdpEhRBWMEIq2CuQds-TGEl2vDY8Y9g&usqp=CAU" height="20" width="20" > </button>
          <%} %>
          
        </div>
        <div></div>
        <%if(request.getSession().getAttribute("username")!=null){ %>
        <h3 class="welcome-text">Welcome <%=request.getSession().getAttribute("username") %>!</h3>
        <%} %>
      </div>
      <!-- Center elements -->

      <!-- Right elements -->
      <div class="col-lg-5 col-md-12 col-12">
        <div class="input-group float-center">
          <div class="form-outline">
           
            <input type="search" id="form1" class="form-control"  value="search" size="40"/>
            
          </div>
          <button type="button" style="background-color:#6c757d ; color: white; box-shadow: none;">
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
    <path d="M6.5 11A4.5 4.5 0 1 1 6.5 2a4.5 4.5 0 0 1 0 9zm7.854 3.646a.5.5 0 0 1-.708 0l-3.27-3.27A5.5 5.5 0 1 0 6.5 14a5.5 5.5 0 0 0 4.676-8.178l3.27 3.27a.5.5 0 0 1 0 .708z"/>
  </svg>
</button>

        </div>
      </div>
      <!-- Right elements -->
    </div>
  </div>
</div>
<!-- Jumbotron -->

<%if(request.getSession().getAttribute("logged")!=null){%>
 <nav class="navbar " style="background-color: #444;">
    <!-- <div class="container-fluid"> -->
      <div class="btn-group mb-0 me-3">
        <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          Java Quiz
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/easyandjava">Java easy</a></li>
          <li><a class="dropdown-item" href="/mediumandjava">Java medium</a></li>
          <li><a class="dropdown-item" href="/hardandjava">Java hard</a></li>
        </ul>
      </div>

      <div class="btn-group mb-0 me-3">
        <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          Python Quiz
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/easyandpython">Python easy</a></li>
          <li><a class="dropdown-item" href="/mediumandpython">Python medium</a></li>
          <li><a class="dropdown-item" href="/hardandpython">Python hard</a></li>
        </ul>
      </div>

      <div class="btn-group mb-0 me-3">
        <button type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          JavaScript Quiz
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="/easyandjs">JavaScript easy</a></li>
          <li><a class="dropdown-item" href="/mediumandjs">JavaScript medium</a></li>
          <li><a class="dropdown-item" href="/hardandjs">JavaScript hard</a></li>
        </ul>
      </div>

      <div class="btn-group mb-0 me-3">
        <a class="btn btn-warning" href="/views/index.jsp">Home</a>
      </div>
    <!-- </div> -->
  </nav>
<%}else if(request.getSession().getAttribute("admin")!=null) {%>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="/views/add.jsp">Add Question</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/views/DeleteQuestion.jsp">Delete Question</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/views/UpdateQuestion.jsp">Update Question</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/byjavaLanguage" >Java Questions</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/bypythonLanguage" >python Questions</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/byjsLanguage" >JavaScript Questions</a>
  </li>
</ul>

<%} else{%>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" href="/views/Signup.jsp">Signup</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="/views/alogin.jsp">AdminLogin</a>
  </li>
  
</ul>
<%} %>

</header>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">

</body>
</html>
