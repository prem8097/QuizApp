<%-- 
    Document   : adminexam
    Created on : 17-Jun-2023, 4:25:31 pm
    Author     : premsai devavarapu
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Create Quiz</title>
  <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="css/inputques.css"/>
  <link rel="stylesheet" href="css/nav.css"/>
</head>
<body>
    <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="admin.jsp">
                            <i class="fas fa-chevron-circle-left" id="hov"></i>
                            <img src="img/quizhost-high-resolution-logo-color-on-transparent-background.png" alt="Logo">
                </a>
                <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon" ></span>  
              </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end" >
                    <ul class="navbar-nav " >
                        
                        
                        <li class="nav-item" id="user">
                            <a href="#" class="nav-link">
                                 <i class="fas fa-user-alt"></i>
                            <%
                                
                                String enmailCookieValue = null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("adminemail")) {
                enmailCookieValue = cookie.getValue();
                break;
            }
        }
        
    }
               Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query = "SELECT name FROM admin_details where email = ?";
                stmt = con.prepareStatement(query);
                stmt.setString(1, enmailCookieValue);
                rs = stmt.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs.next()) {
                String user=rs.getString("name");
                out.println(user);
                                }
                                }  catch(Exception e)
                                {
                                   e.printStackTrace();
                                }finally {
                // Close database resources
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
                            %>
                            </a> 
                        </li>
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                            About
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="#" class="nav-link" data-toggle="modal" data-target="#alert"  >
                  
                            <i class="fas fa-sign-out-alt"></i>Logout
                          </a>
                        </li> 
                    </ul>
                </div>
              </div>
    </nav>    
                            <div class="modal fade" id="alert" role="dialog">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Hey!!!</h5>
                    <button id="modalcls" type="button" class="btn-close" aria-label="Close" data-dismiss="modal"><i class="fa fa-close"></i></button>
                  </div>
                  <div class="modal-body">
                     Do you really want to log out?              
                </div>
                <div class="modal-footer justify-content-center">
                    <a href="logout">
                    <button class="btn-primary lgout" name="Yes" value="Yes">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>         
          </div>
      </div>
  <div class="container">
    <h1>Create Quiz</h1>
    <form id="quizForm">
      <div class="form-group">
        <label for="quizName">Quiz Name:</label>
        <input type="text" class="form-control" id="quizName" required>
      </div>
      <div class="form-group">
        <label for="numQuestions">Number of Questions:</label>
        <input type="number" class="form-control" id="numQuestions" required>
      </div>
      <div id="questionsContainer"></div>
      <div id="date-time" style="display: none;">
          <div class="form-group"  >
  <label for="quizDate">Quiz Date:</label>
  <input type="date" class="form-control" id="quizDate" >
</div>
<div class="form-group" >
  <label for="quizTime">Quiz Time:</label>
  <input type="time" class="form-control" id="quizTime" >
</div>
          <div class="form-group" >
  <label for="quizEndDate">End Date:</label>
  <input type="date" class="form-control" id="quizEndDate" >
</div>
          <div class="form-group" >
  <label for="quizEndTime">End Time:</label>
  <input type="time" class="form-control" id="quizEndTime" >
</div>
          <div class="form-group">
    <label for="quizDuration">Quiz Duration (in minutes):</label>
    <input type="number" class="form-control" id="quizDuration">
  </div>
      </div>
   
      <div class="form-group" id="quizDescriptionContainer" style="display: none;">
          <label for="quizDescription">Enter the Emails of the participants:<br><b>(Enter each Email in new line)</b></label>
      <textarea class="form-control" id="quizDescription" name="quizDescription" rows="8" pattern="^$|^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" ></textarea>

</div>



      <button type="submit" class="btn btn-primary btn-md" id="btn1">Submit</button>
      <button id="generateHTMLBtn" class="btn btn-primary btn-md" style="display: none;" >Next</button>
    </form>
  </div>
  
  <script src="js/script.js"></script>
  
</body>
</html>

