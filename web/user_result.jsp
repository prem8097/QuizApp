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
    <title>Result</title>
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
    <link rel="stylesheet" href="css/nav.css">
    <script src="js/cnt.js"></script>
    <style>
        .btn-outline-custom {
    color: rgb(21, 126, 126);
    border-color: rgb(21, 126, 126);
    margin-top:25px;
  }

  .btn-outline-custom:hover {
    background-color: rgb(21, 126, 126);
    color: white;
  }
        .progress-bar
        {
            background-color:rgb(21, 126, 126);
        }
    </style>
</head>
<body>
    <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light">
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
                           <% String enmailCookieValue = null;
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
                    <li class="nav-item">
                        <a href="#" class="nav-link">About</a>
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
                    <a href="logout">
                        <button class="btn-primary lgout" name="Yes" value="Yes">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout"  data-dismiss="modal" name="No" value="No">No</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <h1>Result</h1>
        <div class="row">
            <%  
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            int count=0;
            String email = enmailCookieValue;
            String quizCode=request.getParameter("quizCode");
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query = "SELECT username, score FROM "+quizCode+"_Result where email = ?";
                stmt = con.prepareStatement(query);
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs.next()) {
                    String username = rs.getString("username");
                    double score = rs.getInt("score");
                    int marks=(int)score;
                    int numQuestions = 0;
                    
                    String numQuestionsQuery = "SELECT no_ques  FROM quizzes WHERE quiz_code = ?";
                    PreparedStatement numQuestionsStmt = con.prepareStatement(numQuestionsQuery);
                    numQuestionsStmt.setString(1, quizCode);
                    ResultSet numQuestionsRs = numQuestionsStmt.executeQuery();
                    if (numQuestionsRs.next()) {
                        numQuestions = numQuestionsRs.getInt("no_ques");
                    }
                    
                    score=(score/numQuestions)*100;
                    count++;
            %>
            <div class="col-md-4 mt-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= quizCode %></h5>
                        
                        <p class="card-text">Marks : <%= marks %> </p>
                        <p class="card-text">Number of questions : <%= numQuestions %> </p>

                        <div class="progress">
                            <div class="progress-bar" role="progressbar" style="width: <%= score %>%" aria-valuenow="<%= score %>" aria-valuemin="0" aria-valuemax="100"></div>
                            
                        </div>
                            <button class="btn btn-outline-custom btnstart" onclick="viewAnswers('<%=quizCode %>')" >View Answers</button>
                            <button class="btn btn-outline-custom btnstart" onclick="viewRank('<%=quizCode %>')" >View Rank</button>
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

            %>
        </div>
    </div>
        <script>
            function viewAnswers(quizCode)
        {
            

// Encode the variable's value
window.location.href = "QuizAnswers.jsp?quizCode=" + quizCode;
        }
        function viewRank(quizCode)
        {
           window.location.href = "cnrank.jsp?quizCode=" + quizCode;
        }
        </script>
</body>
</html>
