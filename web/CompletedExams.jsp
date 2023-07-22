<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
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
    <title>Completed Exams</title>
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
    <link rel="stylesheet" href="css/questions.css">
    <link rel="stylesheet" href="css/exams.css">
   
    <style>
         .btnstart
        {
            background-color:#06BBCC;
            color:white;
            border:none;
        }
        .btnstart:hover
        {
            
  background-color: #059aa6;
}
        
        @media (Orientation:portrait)
        {
            .card-body
            {
                display:flex;
                flex-direction:column;
            }
            .btnstart
            {
                margin-top:7px;
            }
        }
        .lgout
    {
        background-color:#06BBCC;
        border:none;
        height:38px;
        width:60px;
        border-radius:8px;
    }
    .navbar-brand img {
  height: 28px; /* Adjust the height as needed */
  width: auto; /* Maintain the aspect ratio */
  margin: 5px; /* Optional: Add margin around the logo */
}
@media (Orientation:landscape)
    {
        .navbar .dropdown-menu.fade-down {
        top: 100%;
        transform: rotateX(-75deg);
        transform-origin: 0% 0%;
    }
    .navbar .nav-item:hover .dropdown-menu {
        top: 100%;
        transform: rotateX(0deg);
        visibility: visible;
        transition: .5s;
        opacity: 1;
    }
    .navbar .nav-item .dropdown-menu {
        display: block;
        margin-top: 0;
        opacity: 0;
        visibility: visible;
        transition: .5s;
    }
    }
    

        .dropdown-menu .dropdown-item:hover {
            background-color: rgb(21, 126, 126);
            color: #fff;
        }
.navbar .dropdown-toggle::after {
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    vertical-align: middle;
    margin-left: 8px;
}

.navbar-light .navbar-nav .nav-link {
    margin-right: 30px;
    
    
    font-size: 15px;
    text-transform: uppercase;
    outline: none;
}

.navbar-light .navbar-nav .nav-link:hover,
.navbar-light .navbar-nav .nav-link.active {
    color:#06BBCC ;
}
  .navbar-nav .dropdown:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu .dropdown-item:hover {
            background-color: rgb(21, 126, 126);
            color: #fff;
        }

        .dropdown-menu {
            transition: all 0.3s ease-in-out;
            opacity: 0;
            visibility: hidden;
        }

        .nav-item.dropdown:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
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
    Cookie[] cookies1 = request.getCookies();

    if (cookies1 != null) {
        for (Cookie cookie : cookies1) {
            if (cookie.getName().equals("email")) {
                enmailCookieValue = cookie.getValue();
                break;
            }
        }
        
    }
               Connection con1 = null;
            PreparedStatement stmt2 = null;
            ResultSet rs2 = null;
            
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con1 = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query1 = "SELECT name FROM user_details where email = ?";
                stmt2 = con1.prepareStatement(query1);
                stmt2.setString(1, enmailCookieValue);
                rs2 = stmt2.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs2.next()) {
                String user=rs2.getString("name");
                out.println(user);
                                }
                                }  catch(Exception e)
                                {
                                   e.printStackTrace();
                                }finally {
                // Close database resources
                if (rs2 != null) {
                    try {
                        rs2.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (stmt2 != null) {
                    try {
                        stmt2.close();
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
                      <!--<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="examsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Exams
    </a>
    <div class="dropdown-menu animated fadeIn" aria-labelledby="examsDropdown" style="transition: all 0.3s ease-in-out;">
        <a class="dropdown-item" href="ScheduledExams.jsp">Scheduled Exams</a>
        <a class="dropdown-item" href="CompletedExams.jsp">Completed Exams</a>
    </div>
</li>-->
<li class="nav-item">
                          <a href="index.html" class="nav-link">
                            Home
                          </a>
                        </li>
 <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">My Exams</a>
                    <div class="dropdown-menu fade-down m-0">
                        <a href="ScheduledExams.jsp" class="dropdown-item">Scheduled Exams</a>
                        <a href="CompletedExams.jsp" class="dropdown-item">Completed Exams</a>
                        <a href="exams.jsp" class="dropdown-item">Practice</a>
                    </div>
                </div>



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
                    <a>
                    <button class="btn-primary lgout" name="Yes" value="Yes" onclick="lgout()">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>         
          </div>
      </div>
    <div class="container">
        <h1>Completed Exams</h1>
        <div class="row">
            <%  
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            boolean status1=false;
            PreparedStatement stmt1 = null;
            ResultSet rs1 = null;
            String email = null;
            int count=0;
Date endDateTime = null;
Date currentTime=null;
String endTime = null;
            String endDate=null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                email = cookie.getValue();
                break;
            }
        }
    }
            
            
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query = "SELECT quiz_name, quiz_code, date FROM user_quizzes WHERE status = 1 AND email = ? ORDER BY date DESC";
                stmt = con.prepareStatement(query);
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs.next()) {
                    String quizName = rs.getString("quiz_name");
                    String quizCode = rs.getString("quiz_code");
                    String date=rs.getString("date");
                     String endTimeQuery = "SELECT end_time,end_date FROM quizzes WHERE quiz_code = ?";
            stmt1 = con.prepareStatement(endTimeQuery);
            stmt1.setString(1, quizCode);
            rs1 = stmt1.executeQuery();
            count++;
            
            if (rs1.next()) {
                endTime = rs1.getString("end_time");
                endDate =rs1.getString("end_date");
            }
             try {
             
            String dateTimeString = endDate + " " + endTime;
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            endDateTime = sdf.parse(dateTimeString);

            // Get the current time
            currentTime = new Date();

            // Compare the current time and retrieved end time
            if (currentTime.after(endDateTime)) {
                // Show the "View Result" and "View Answers" buttons
                status1=true;
                
            } else {
                // Hide the "View Result" and "View Answers" buttons
                status1=false;
            }} catch (ParseException pe) {
            pe.printStackTrace();
            // Handle the parse exception, e.g., show an error message to the user
            //out.println("Error occurred while parsing the date and time.");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions, e.g., show an error message to the user
            //out.println("An unexpected error occurred.");
        }
            %>
            <div class="col-md-4 mt-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= quizName %></h5>
                        <p class="card-text">Quiz Code: <%= quizCode %></p>
                        <p class="card-text">Date : <%= date %> </p>
                       
                            
                            <button class="btn btn-primary btnstart" onclick="redirectToResult('<%= quizCode %>','<%= endDate %>','<%= endTime %>')">View Result</button>
                            <button class="btn btn-primary btnstart " onclick="redirectToAnswers('<%= quizCode %>','<%= endDate %>','<%= endTime %>')">View Answers</button>
                        
                        
                        
                    </div>
                </div>
            </div>
            <%
                }

            



            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
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
if(count==0)
{
            %><div class="noexam"><h5>No exams found</h5><%}
            %>
        </div>
    </div>
        <script>
    function redirectToResult(quizCode,endDate,endTime) {
        
        const endDateTimeStr = endDate + ' ' + endTime;

  // Create a new Date object for the endDateTime from the database
  const endDateTimeObject = new Date(endDateTimeStr);

  // Get the current datetime
  const currentDateTime = new Date();

  // Compare endDateTimeObject with the current datetime
  if (currentDateTime >= endDateTimeObject) {
    // Redirect to result.jsp
    window.location.href = 'user_result.jsp?quizCode=' + quizCode;
  }
else
{
window.alert("Quiz is still ongoing. Results will be available after the quiz ends.");
}

  }

    function redirectToAnswers(quizCode,endDate,endTime) {
        const endDateTimeStr = endDate + ' ' + endTime;

  // Create a new Date object for the endDateTime from the database
  const endDateTimeObject = new Date(endDateTimeStr);

  // Get the current datetime
  const currentDateTime = new Date();

  // Compare endDateTimeObject with the current datetime
  if (currentDateTime >= endDateTimeObject) {
    // Redirect to result.jsp
    window.location.href = 'QuizAnswers.jsp?quizCode=' + quizCode;
  }
else {
            alert("Quiz is still ongoing. Answers will be available after the quiz ends."+status1);
        }
    }
    function lgout()
    {
        sessionStorage.removeItem('modalShown');
        window.location.href="logout";
    }
</script>
</body>
</html>
