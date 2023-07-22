<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
    <link href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="css/showanswers.css">
    <link rel="stylesheet" href="css/nav.css">
    <title>Software Engineering</title>
    <style>
        /* CSS for changing the color of the checkboxes */
        .question .custom-control-label.correct::before {
            border-color: green; /* Change to your desired correct answer color */
            background-color: green; /* Change to your desired correct answer color */
        }

        .question .custom-control-label.incorrect::before {
            border-color: red; /* Change to your desired incorrect answer color */
            background-color: red; /* Change to your desired incorrect answer color */
        }
        .navbar-brand img {
  height: 28px; /* Adjust the height as needed */
  width: auto; /* Maintain the aspect ratio */
  margin: 5px; /* Optional: Add margin around the logo */
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
               Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query = "SELECT name FROM user_details where email = ?";
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
                      <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="examsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Exams
    </a>
    <div class="dropdown-menu animated fadeIn" aria-labelledby="examsDropdown" style="transition: all 0.3s ease-in-out;">
        <a class="dropdown-item" href="ScheduledExams.jsp">Scheduled Exams</a>
        <a class="dropdown-item" href="CompletedExams.jsp">Completed Exams</a>
        <a class="dropdown-item" href="exams.jsp">Practice</a>
    </div>
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
<div class="question-form">
    <form id="quesform" method="post" action="questions">
        <div class="question">
            <h5>1. Define Agile scrum methodology.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q1-a">
                <label class="custom-control-label" for="q1-a">project management that emphasizes decremental progress</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q1-b">
                <label class="custom-control-label" for="q1-b">project management that emphasizes incremental progress</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q1-c">
                <label class="custom-control-label" for="q1-c">project management that emphasizes neutral progress</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q1-d">
                <label class="custom-control-label" for="q1-d">project management that emphasizes no progress</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample1">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Agile scrum methodology is a style of project management that emphasizes incremental progress. Each iteration is divided into two to four-week sprints, with the goal of completing the most important features first and delivering a possibly deliverable product at the end of each sprint.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>2. What does SDLC stands for?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q2-a">
                <label class="custom-control-label" for="q2-a">Software Development Life Cycle</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q2-b">
                <label class="custom-control-label" for="q2-b">Software Design Life Cycle</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q2-c">
                <label class="custom-control-label" for="q2-c">System Design Life Cycle</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q2-d">
                <label class="custom-control-label" for="q2-d">System Development Life cycle</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample2">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The Software Development Life Cycle (SDLC) is a method for designing, developing, and testing high-quality software. The software developed to meet or exceed customer expectations must have an SDLC designed to complete the software on time and on budget
                </div>
            </div>
        </div>
        <div class="question">
            <h5>3. In which step of SDLC actual programming of software code is done?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q3-a">
                <label class="custom-control-label" for="q3-a">Development and Documentation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q3-b">
                <label class="custom-control-label" for="q3-b">Maintenance and Evaluation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q3-c">
                <label class="custom-control-label" for="q3-c">Design</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3d" value="d" id="q3-d">
                <label class="custom-control-label" for="q3-d">Analysis</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample3">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The documentation explains the functions of the final product. The developer must discover adequate knowledge in the technical documentation to begin coding.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>4.The word which describes the importance of software design is?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q4-a">
                <label class="custom-control-label" for="q4-a">Complexity</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q4-b">
                <label class="custom-control-label" for="q4-b">Quality</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q4-c">
                <label class="custom-control-label" for="q4-c"> Efficiency</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q4-d">
                <label class="custom-control-label" for="q4-d">Accuracy</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample4">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>The degree to which software complies with or adheres to a particular design based on functional requirements or specifications is referred to as functional quality.

                </div>
            </div>
        </div>
        <div class="question">
            <h5>5. _____________ specification is also known as SRS document.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q5-a">
                <label class="custom-control-label" for="q5-a">white-box</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q5-b">
                <label class="custom-control-label" for="q5-b">grey-box</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q5-c">
                <label class="custom-control-label" for="q5-c">black-box</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q5-d">
                <label class="custom-control-label" for="q5-d">none of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>The system is regarded as a black box, with no knowledge of its underlying workings, and just its observable exterior (input/output) behavior described.

                </div>
            </div>
        </div>
        <div class="question">
            <h5>6.Which of the following document contains the user system requirements?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q6-a">
                <label class="custom-control-label" for="q6-a">SRD</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q6-b">
                <label class="custom-control-label" for="q6-b">DDD</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q6-c">
                <label class="custom-control-label" for="q6-c">SDD</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q6-d">
                <label class="custom-control-label" for="q6-d">SRS</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample6" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample6">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>A software requirements specification (SRS) is a detailed explanation of how a system should behave before it is built. It may also include a collection of use cases that explain how users will interact with the programme.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>7.Which of the following is involved in the system planning and designing phase of the Software Development Life Cycle (SDLC)?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q7-a">
                <label class="custom-control-label" for="q7-a">Sizing</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q7-b">
                <label class="custom-control-label" for="q7-b">Parallel run</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q7-c">
                <label class="custom-control-label" for="q7-c">Specification freeze</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q7-d">
                <label class="custom-control-label" for="q7-d">All of the above</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample7" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample7">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>None.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>8.What does RAD stand for? </h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q8-a">
                <label class="custom-control-label" for="q8-a"> Rapid Application Document</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q8-b">
                <label class="custom-control-label" for="q8-b">Rapid Application Development</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q8-c">
                <label class="custom-control-label" for="q8-c"> Relative Application Development</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q8-d">
                <label class="custom-control-label" for="q8-d">None of the above</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample8" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample8">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>RAD stands for Rapid Application Development is categorized as an agile development method, which is meant to accomplish a quick turnaround and high-end outcomes.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>9.Which of the following models doesn't necessitate defining requirements at the earliest in the lifecycle?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q9-a">
                <label class="custom-control-label" for="q9-a">RAD & Waterfall</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q9-b">
                <label class="custom-control-label" for="q9-b">Prototyping & Waterfall</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q9-c">
                <label class="custom-control-label" for="q9-c"> Spiral & Prototyping</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q9-d">
                <label class="custom-control-label" for="q9-d">Spiral & RAD</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample9" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample9">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>In the Prototyping model, the first phase is the requirement analysis phase, which involves Brainstorming, QFD, and FAST, whereas the Spiral model encompasses customer communication activities such as defining objectives.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>10.Arrange the following activities for making a software product by utilizing 4GT.</h5><br><br>I. Design strategy<br>

            II. Transformation into product<br>

            III. Implementation<br>

            IV. Requirement gathering<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10a" value="a" id="q10-a">
                <label class="custom-control-label" for="q10-a">4, 1, 3, 2</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10b" value="b" id="q10-b">
                <label class="custom-control-label" for="q10-b">4, 3, 2, 1</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10c" value="c" id="q10-c">
                <label class="custom-control-label" for="q10-c">1, 2, 3, 4</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10d" value="d" id="q10-d">
                <label class="custom-control-label" for="q10-d">1, 4, 2, 3</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample10">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The sequence of activities mentioned in option c represents the Fourth Generation Techniques(4GT) Model.
                </div>
            </div>
        </div>
        
        
        
         <div class="question">
            <h5>11. Which of the following is the main advantage of deploying a 4GT model for producing small-scale products, programs, and applications?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q11-a">
                <label class="custom-control-label" for="q11-a">The productivity of software engineers is improved.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q11-b">
                <label class="custom-control-label" for="q11-b">The time required for developing software is reduced.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q11-c">
                <label class="custom-control-label" for="q11-c">CASE tools and code generators help the 4GT model by providing a credible solution to their problems.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q11-d">
                <label class="custom-control-label" for="q11-d">None of the above.</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample11" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample11">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Since automated coding is done using CASE tools & code generators, proponents claim a dramatic reduction in software development time.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>12.Which of the following model has a major downfall to a software development life cycle in terms of the coding phase?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q12-a">
                <label class="custom-control-label" for="q12-a">4GT Model</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q12-b">
                <label class="custom-control-label" for="q12-b">Waterfall Model</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q12-c">
                <label class="custom-control-label" for="q12-c">RAD Model</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q12-d">
                <label class="custom-control-label" for="q12-d">Spiral Model</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample12" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample12">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Much more expertise is needed in the 4GT model for analyzing, designing, and testing activities as it eliminates the coding phase.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>13.RUP is abbreviated as __________, invented by a division of __________.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q13-a">
                <label class="custom-control-label" for="q13-a">Rational Unified Process, IBM</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q13-b">
                <label class="custom-control-label" for="q13-b">Rational Unified Program, IBM</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q13-c">
                <label class="custom-control-label" for="q13-c">Rational Unified Process, Infosys</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q13d" value="d" id="q13-d">
                <label class="custom-control-label" for="q13-d">Rational Unified Program, Infosys</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample13" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample13">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>None.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>14.The agile software development model is built based on __________.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q14-a">
                <label class="custom-control-label" for="q14-a">Iterative Development</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q14-b">
                <label class="custom-control-label" for="q14-b">Both Incremental and Iterative Development</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q14-c">
                <label class="custom-control-label" for="q14-c">Incremental Development</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q14-d">
                <label class="custom-control-label" for="q14-d">Linear Development</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample14" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample14">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>In agile software development, the software is usually developed in increments with the customer specifying necessary requirements in each increment. Here the main aim of a developer is to meet customer satisfaction at the earliest by providing a valuable software product. It is known as iterative because it chooses to work on one particular increment and make the improvement in other iteration.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>15.Which of the following activities is not applicable to agile software development?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q15-a">
                <label class="custom-control-label" for="q15-a">Producing only the essential work products.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q15-b">
                <label class="custom-control-label" for="q15-b">Utilizing the strategy of incremental product delivery.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q15-c">
                <label class="custom-control-label" for="q15-c">Abolishing the project planning and testing.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q15-d">
                <label class="custom-control-label" for="q15-d">All of the above</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>Testing can never be avoided as it plays a significant role in the software development life cycle.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>16.Which one of the following is TRUE?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q16-a">
                <label class="custom-control-label" for="q16-a">The requirements document also describes how the requirements that are listed in the document are implemented efficiently</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q16-b">
                <label class="custom-control-label" for="q16-b">Consistency and completeness of the functional requirements are always achieved in practice</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q16-c">
                <label class="custom-control-label" for="q16-c">Prototyping is a method of requirements validation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q16-d">
                <label class="custom-control-label" for="q16-d">Requirements review is carried out to find the errors in system design</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample16" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample16">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>No explanation available
                </div>
            </div>
        </div>
        <div class="question">
            <h5>17.Which of the following is NOT desired in a good Software Requirement Specifications 
 document?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q17-a">
                <label class="custom-control-label" for="q17-a">Functional Requirements</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q17-b">
                <label class="custom-control-label" for="q17-b">Non Functional Requirements</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q17-c">
                <label class="custom-control-label" for="q17-c">Goals of Implementation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q17-d">
                <label class="custom-control-label" for="q17-d">Algorithm for software implementation</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample17" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample17">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b> No explanation available
                </div>
            </div>
        </div>
        <div class="question">
            <h5>18.Consider the following statements about the cyclomatic complexity of the control flow graph of a program module. Which of these are TRUE?</h5><br><br>a. The cyclomatic complexity of a module is equal to the maximum number of
            linearly independent circuits in the graph.<br>
 b. The cyclomatic complexity of a module is the number of decisions in the
module plus one, where a decision is effectively any conditional statement in
the module.<br>
 c. The cyclomatic complexity can also be used as a number of linearly
 independent paths that should be tested during path coverage testing.<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q18-a">
                <label class="custom-control-label" for="q18-a">a & b</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q18-b">
                <label class="custom-control-label" for="q18-b">b & c</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q18-c">
                <label class="custom-control-label" for="q18-c">a & c</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q18-d">
                <label class="custom-control-label" for="q18-d">a,b & c</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample18" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample18">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>No explanation available
                </div>
            </div>
        </div>
        <div class="question">
            <h5>19.Which of the following statements are TRUE?</h5><br><br>a. The content diagram should depict the system as a single bubble.<br>
            b. External entities should be identified clearly at all levels of DFDs<br>

            c. Control information should not be represented in DFD <br>

 d. A data store can be connected either to another data store or to an external
 entity.<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q19-a">
                <label class="custom-control-label" for="q19-a">b & c</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q19-b">
                <label class="custom-control-label" for="q19-b">a,b & d</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q19-c">
                <label class="custom-control-label" for="q19-c"> a & c
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q19-d">
                <label class="custom-control-label" for="q19-d">a,b&c</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample19" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample19">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>No explanation available
                </div>
            </div>
        </div>
        <div class="question">
            <h5>20. Which of the following does not complement the decomposition techniques but offers a potential estimation approach for their impersonal growth?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q20-a">
                <label class="custom-control-label" for="q20-a">Empirical estimation models</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q20-b">
                <label class="custom-control-label" for="q20-b">Decomposition techniques</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q20-c">
                <label class="custom-control-label" for="q20-c">Automated estimation tools</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q20-d">
                <label class="custom-control-label" for="q20-d">Both empirical estimation models and automated estimation tools</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample20" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample20">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>In computer software, the estimation model uses empirically derived formulas for guessing the effort as a function of LOC or FP.
                </div>
            </div>
        </div>
        
        
        
        
        
        
        
        
    </form>
</div>
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
<script>
   

   const checkboxes = document.querySelectorAll(".question input[type='checkbox']");

checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("click", function () {
        const questionName = this.name;
        const selectedValue = this.value;
        const checkboxElement = this; // Capture the correct context (checkbox element)
        var correctValue = "";

        var xhr = new XMLHttpRequest();
        xhr.open("POST", "dbms", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    correctValue = response.success;
                    console.log(response.success);
                    if (selectedValue === correctValue) {
                        // Apply green color for correct answer
                        checkboxElement.nextElementSibling.classList.add("correct");
                    } else {
                        // Apply red color for incorrect answer
                        checkboxElement.nextElementSibling.classList.add("incorrect");
                    }
                }
            }
        };
        var params = "questionName=" + encodeURIComponent(questionName);
        xhr.send(params);

        console.log(questionName);
        console.log(selectedValue);
        console.log(correctValue);

        // Toggle the value in correctAnswers object for checkbox questions

        // Check if the checkbox is checked or unchecked
            });
});

</script>


</body>
</html>
