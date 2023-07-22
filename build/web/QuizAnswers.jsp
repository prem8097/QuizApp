<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-JEQNLFM1XB"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-JEQNLFM1XB');
</script>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
  <link href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="css/QuizIT.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/exams.css">
  <title>Answers</title>
  <style>
    .correct-option {
      color: green;
    }
  </style>
  <script>
    function checkCorrectOption(questionIndex, correctOption) {
      const options = document.querySelectorAll(`input[name="q${questionIndex}"]`);
      options.forEach(function(option, index) {
        if (index + 1 === correctOption) {
          option.checked = true;
          option.disabled = true;
          option.parentElement.querySelector('.form-check-label').classList.add('correct-option');
        }
      });
    }
  </script>
</head>
<body>
  <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">
        <i class="fas fa-chevron-circle-left"></i>
      </a>
      <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div id="mynavbar" class="collapse navbar-collapse justify-content-end">
        <ul class="navbar-nav">
          
          <li class="nav-item" id="user">
            <a href="#" class="nav-link">
              <i class="fas fa-user-alt"></i>
              <% out.println(session.getAttribute("email")); %>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <%
   String quizCode = request.getParameter("quizCode");
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   
      String dynamichtml1 = "";
      
      //String code="QUIZIT74Gg";

   try {
      // Load the JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      // Create a connection to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

      // Create a statement
      stmt = conn.createStatement();

      // Execute the query to retrieve data from the table
      rs = stmt.executeQuery("SELECT dynamic_html1 FROM quizzes where quiz_code = '" + quizCode + "'");

      // Declare variables to store the data
      

      // Process the retrieved data
      while (rs.next()) {
         // Access the columns of each row
         
         
         dynamichtml1 = rs.getString("dynamic_html1");
         
         //code=rs.getString("quiz_code");

         // Perform further processing or display the data
         // ...
      }

      // Use the variables in the HTML content
      rs.close();
      stmt.close();
      conn.close();
   } catch (Exception e) {
      e.printStackTrace();
   }
%>
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div id="questionsContainer">
          <div id="quizContainer">
            <div class="questions">
              <form >
                <%= dynamichtml1 %>
                
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
</body>
</html>
