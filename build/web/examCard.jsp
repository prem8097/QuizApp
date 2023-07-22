<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
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
        <title>Exam</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
         <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>   
        <!--<script type="text/javascript" src="js/CN.js"></script>-->
        <link rel="stylesheet" href="css/questions.css">
        <link rel="stylesheet" href="css/exams.css">
        <link rel="stylesheet" href="css/nav.css">
        <script src="js/userexam.js"></script>
        <style>
            .navbar-brand img {
  height: 28px; /* Adjust the height as needed */
  width: auto; /* Maintain the aspect ratio */
  margin: 5px; /* Optional: Add margin around the logo */
}
.lgout
    {
        background-color:#06BBCC;
        border:none;
        height:38px;
        width:60px;
        border-radius:8px;
    }
    #hostimg
    {
        background-image:url("../img/quizhost-high-resolution-color-logo.png");
    }
        </style>
    </head>
    <body>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top p-2">
            <div class="container-fluid">
                
                            
                            <a class="navbar-brand" href="#">  
                                <i class="fas fa-chevron-circle-left" id="hov"></i>
                    <img src="img/quizhost-high-resolution-logo-color-on-transparent-background.png" alt="Logo">
                
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon"></span>          
              </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end">
                    <ul class="navbar-nav ">
                        
                        <li class="nav-item" id="user">
                            
                                <a href="#" class="nav-link">
                                 <i class="fas fa-user-alt"></i>
                            <%
                             String enmailCookieValue = null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                enmailCookieValue = cookie.getValue();
                break;
            }
        }
        
    }
               Connection con1 = null;
            PreparedStatement stmt1 = null;
            ResultSet rs1 = null;
            
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con1 = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query1 = "SELECT name FROM user_details where email = ?";
                stmt1 = con1.prepareStatement(query1);
                stmt1.setString(1, enmailCookieValue);
                rs1 = stmt1.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs1.next()) {
                String user=rs1.getString("name");
                out.println(user);
                                }
                                }  catch(Exception e)
                                {
                                   e.printStackTrace();
                                }finally {
                // Close database resources
                if (rs1 != null) {
                    try {
                        rs1.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (stmt1 != null) {
                    try {
                        stmt1.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (con1 != null) {
                    try {
                        con1.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
                            %>

                            </a> 
                           </li>
                        
                            
                                                  
                        </li>
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                            About
                          </a>
                        </li>
                        <li class="nav-item">
                          <a href="#" class="nav-link" data-toggle="modal" data-target="#alert">
                  
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
                    <a >
                    <button class="btn-primary lgout" name="Yes" value="Yes" onclick="lgout()">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>         
          </div>
      </div>
    
<%
   String quizCode = request.getParameter("name");
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
      int column1=0;
      String column2 = "";
      String column3="";
      int column4 = 0;
      String column5="";
      String column6="";
      String column7="";
      String column8="";
      String column9="";
      
      //String code="QUIZIT74Gg";

   try {
      // Load the JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      // Create a connection to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

      // Create a statement
      stmt = conn.createStatement();

      // Execute the query to retrieve data from the table
      rs = stmt.executeQuery("SELECT * FROM quizzes where quiz_code = '" + quizCode + "'");

      // Declare variables to store the data
      

      // Process the retrieved data
      while (rs.next()) {
         // Access the columns of each row
         column1 = rs.getInt("id");
         column2 = rs.getString("quiz_name");
         column3 = rs.getString("dynamic_html");
         column4 = rs.getInt("no_ques");
         column5=rs.getString("quiz_code");
         column6=rs.getString("dynamic_html1");
         column7=rs.getString("participants");
         column8=rs.getString("date");
         column9=rs.getString("time");
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
<% 
    // Set the column3 value in a session attribute
    session.setAttribute("code", quizCode);
  %>
<a href="#" class="cont" data-toggle="modal" data-target="#infomodal">
    <div class="cn">
        <div class="examimg" id="hostimg"></div>
        <div class="exam-content">
            <h5><%= column2 %></h5>
            <div class="exam-desc">
                Quiz : <%= column2 %><br>
                Number of Questions: <%= column4 %><br>
                Date : <%= column8 %><br>
                Time :<%= column9 %><br>
                
            </div>
        </div>
    </div>
</a>
                
                
  <div class="modal fade" id="infomodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h3 class="modal-title" style="color:green;">Instructions</h3>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <p><strong>Instructions for Quiz:</strong></p>
        <ol>
          <li>This quiz consists of 10 questions, and each question carries 1 mark.</li>
          <li>A timer will be displayed at the top of the screen, indicating the remaining time to complete the quiz. The quiz will be automatically submitted once the time is up, so please manage your time wisely.</li>
          <li>Malpractice of any kind is strictly prohibited. Make sure to attempt the quiz with honesty and integrity.</li>
          <li>For the best experience, please attempt the exam in full-screen mode. If you enter the normal screen mode during the exam, a pop-up warning will appear, and the timer won't stop.</li>
          <li>Ensure a stable internet connection before starting the quiz to avoid any disruptions.</li>
          <li>Read each question carefully and provide your answers thoughtfully.</li>
          <li>Double-check your responses before submitting the quiz to ensure all questions are answered.</li>
          <li>Do not refresh the page during the exam, as it may lead to loss of progress.</li>
          <li>If you face any technical issues during the quiz, please notify the exam invigilator immediately.</li>
        </ol>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer d-flex justify-content-center">
        <!-- Centered button -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="startExamBtn">Start Exam</button>
      </div>
    </div>
  </div>
</div>
        
                
                
                
                
                
                
           <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
        
        $(document).ready(function() {
            $("#startExamBtn").click(function() {
                var currentDateTime = new Date();
                var dbDateTime = new Date("<%= column8 %> <%= column9 %>");
                if (dbDateTime <= currentDateTime) {
                    window.location.href = "userexam.jsp";
                } else {
                    window.alert("The exam is not available yet.");
                }
            });
        });
        function lgout()
    {
        sessionStorage.removeItem('modalShown');
        window.location.href="logout";
    }
    </script>             
 </body>
</html>
                            
                            