<%@page import="java.sql.*"%>
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
    <title>Operating Systems</title>
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
                
                <a class="navbar-brand" href="exams.jsp">  
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
        <a class="dropdown-item" href="CompletedExams.jsp">Practice</a>
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
            <h5>1. To access the services of the operating system, the interface is provided by the ___________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q1-a">
                <label class="custom-control-label" for="q1-a">Library</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q1-b">
                <label class="custom-control-label" for="q1-b">System calls</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q1-c">
                <label class="custom-control-label" for="q1-c">Assembly instructions</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q1-d">
                <label class="custom-control-label" for="q1-d">API</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample1">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>To access services of the Operating System an interface is provided by the System Calls. Generally, these are functions written in C and C++. Open, Close, Read, Write are some of most prominently used system calls.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>2. CPU scheduling is the basis of ___________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q2-a">
                <label class="custom-control-label" for="q2-a">multiprogramming operating systems</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q2-b">
                <label class="custom-control-label" for="q2-b">larger memory sized systems</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q2-c">
                <label class="custom-control-label" for="q2-c">multiprocessor systems</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q2-d">
                <label class="custom-control-label" for="q2-d">none of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample2">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>None.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>3.Where is the operating system placed in the memory?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q3-a">
                <label class="custom-control-label" for="q3-a">either low or high memory (depending on the location of interrupt vector)</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q3-b">
                <label class="custom-control-label" for="q3-b">in the low memory</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q3-c">
                <label class="custom-control-label" for="q3-c">in the high memory</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3d" value="d" id="q3-d">
                <label class="custom-control-label" for="q3-d">none of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample3">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>None.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>4.If a process fails, most operating system write the error information to a ______</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q4-a">
                <label class="custom-control-label" for="q4-a">new file</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q4-b">
                <label class="custom-control-label" for="q4-b"> log file</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q4-c">
                <label class="custom-control-label" for="q4-c">another running process</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q4-d">
                <label class="custom-control-label" for="q4-d">none of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample4">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>If a process fails, most operating systems write the error information to a log file. Log file is examined by the debugger, to find out what is the actual cause of that particular problem. Log file is useful for system programmers for correcting errors.

                </div>
            </div>
        </div>
        <div class="question">
            <h5>5.In a timeshare operating system, when the time slot assigned to a process is completed, the process switches from the current state to?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q5-a">
                <label class="custom-control-label" for="q5-a">Suspended state</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q5-b">
                <label class="custom-control-label" for="q5-b">Terminated state</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q5-c">
                <label class="custom-control-label" for="q5-c">Ready state</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q5-d">
                <label class="custom-control-label" for="q5-d">Blocked state</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>In a time-sharing operating system, when the time slot given to a process is completed, the process goes from the running state to the Ready State. In a time-sharing operating system, unit time is defined for sharing CPU, it is called a time quantum or time slice. If a process takes less than 1 time quantum, then the process itself releases the CPU.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>6.In operating system, each process has its own __________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q6-a">
                <label class="custom-control-label" for="q6-a">open files</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q6-b">
                <label class="custom-control-label" for="q6-b">pending alarms, signals, and signal handlers</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q6-c">
                <label class="custom-control-label" for="q6-c">address space and global variables</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q6-d">
                <label class="custom-control-label" for="q6-d">all of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample6" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample6">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>In Operating Systems, each process has its own address space which contains code, data, stack, and heap segments or sections. Each process also has a list of files that is opened by the process as well as all pending alarms, signals, and various signal handlers.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>7.Using transient code, _______ the size of the operating system during program execution.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q7-a">
                <label class="custom-control-label" for="q7-a">maintains</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q7-b">
                <label class="custom-control-label" for="q7-b">decreases</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q7-c">
                <label class="custom-control-label" for="q7-c">increases</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q7-d">
                <label class="custom-control-label" for="q7-d">changes</label>
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
            <h5>8. For real time operating systems, interrupt latency should be ___________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q8-a">
                <label class="custom-control-label" for="q8-a"> zero</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q8-b">
                <label class="custom-control-label" for="q8-b">minimal</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q8-c">
                <label class="custom-control-label" for="q8-c"> maximum</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q8-d">
                <label class="custom-control-label" for="q8-d">dependent on the scheduling</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample8" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample8">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Interrupt latency is the time duration between the generation of interrupt and execution of its service.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>9.The priority of a process will ______________ if the scheduler assigns it a static priority.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q9-a">
                <label class="custom-control-label" for="q9-a">depends on the operating system</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q9-b">
                <label class="custom-control-label" for="q9-b">change</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q9-c">
                <label class="custom-control-label" for="q9-c"> remain unchanged</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q9-d">
                <label class="custom-control-label" for="q9-d">none of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample9" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample9">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>None.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>10.Which of the following is not an operating system?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10a" value="a" id="q10-a">
                <label class="custom-control-label" for="q10-a">Oracle</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10b" value="b" id="q10-b">
                <label class="custom-control-label" for="q10-b">Windows</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10c" value="c" id="q10-c">
                <label class="custom-control-label" for="q10-c">Linux</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10d" value="d" id="q10-d">
                <label class="custom-control-label" for="q10-d">DOS</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample10">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Oracle is an RDBMS (Relational Database Management System). It is known as Oracle Database, Oracle DB, or Oracle Only. The first database for enterprise grid computing is the Oracle database.
                </div>
            </div>
        </div>
        
        
        
         <div class="question">
            <h5>11.  When does page fault occur?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q11-a">
                <label class="custom-control-label" for="q11-a">The page is present in memory.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q11-b">
                <label class="custom-control-label" for="q11-b">The page does not present in memory.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q11-c">
                <label class="custom-control-label" for="q11-c">The deadlock occurs.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q11-d">
                <label class="custom-control-label" for="q11-d">The buffering occurs.</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample11" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample11">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>2 Page faults occur when a process tries to access a block page of the memory and that page is not stored in RAM (Read only memory) or memory.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>12. What is the full name of the IDL?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q12-a">
                <label class="custom-control-label" for="q12-a">Interface definition language</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q12-b">
                <label class="custom-control-label" for="q12-b">Interface direct language</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q12-c">
                <label class="custom-control-label" for="q12-c">Interface data library</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q12-d">
                <label class="custom-control-label" for="q12-d">None of these</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample12" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample12">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The IDL stands for Interface Definition Language. It is used to establish communications between clients and servers in RPC (Remote Procedure Call).
                </div>
            </div>
        </div>
        <div class="question">
            <h5>13.What is bootstrapping called?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q13-a">
                <label class="custom-control-label" for="q13-a">Cold boot</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q13-b">
                <label class="custom-control-label" for="q13-b">Cold hot boot</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q13-c">
                <label class="custom-control-label" for="q13-c">Cold hot strap</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q13d" value="d" id="q13-d">
                <label class="custom-control-label" for="q13-d">Hot boot</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample13" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample13">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Bootstrapping is also known as the cool boot.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>14.If the page size increases, the internal fragmentation is also?..?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q14-a">
                <label class="custom-control-label" for="q14-a">Decreases</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q14-b">
                <label class="custom-control-label" for="q14-b">Increases</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q14-c">
                <label class="custom-control-label" for="q14-c">Remains constant</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q14-d">
                <label class="custom-control-label" for="q14-d">None of these</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample14" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample14">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>None
                </div>
            </div>
        </div>
        <div class="question">
            <h5>15.Which of the following is a single-user operating system?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q15-a">
                <label class="custom-control-label" for="q15-a">Windows</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q15-b">
                <label class="custom-control-label" for="q15-b">MAC</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q15-c">
                <label class="custom-control-label" for="q15-c">Ms-Dos</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q15-d">
                <label class="custom-control-label" for="q15-d">None of these</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>The single-user operating system is the operating system in which only one user can access the computer system at a time, and Ms-DOS is the best example of a single-user operating system.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>16.Which of the following operating systems does not support more than one program at a time?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q16-a">
                <label class="custom-control-label" for="q16-a">Linux</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q16-b">
                <label class="custom-control-label" for="q16-b">Windows</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q16-c">
                <label class="custom-control-label" for="q16-c">MAC</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q16-d">
                <label class="custom-control-label" for="q16-d">DOS</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample16" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample16">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>DOS stands for Disk operating system. Disk operating system is a single-user operating system that does not support more than one program at a time.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>17.Who among the following can block the running process?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q17-a">
                <label class="custom-control-label" for="q17-a">Fork</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q17-b">
                <label class="custom-control-label" for="q17-b">Read</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q17-c">
                <label class="custom-control-label" for="q17-c">Down</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q17-d">
                <label class="custom-control-label" for="q17-d">All of these</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample17" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample17">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>None
                </div>
            </div>
        </div>
        <div class="question">
            <h5>18.Which of the following does not interrupt the running process?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q18-a">
                <label class="custom-control-label" for="q18-a">Timer interrupt</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q18-b">
                <label class="custom-control-label" for="q18-b">Device</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q18-c">
                <label class="custom-control-label" for="q18-c">Power failure</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q18-d">
                <label class="custom-control-label" for="q18-d">Scheduler process</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample18" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample18">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Scheduler process does not interrupt in any running process. Its job is to select the processes for long-term, short-term, and short-term scheduler.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>19.Which command is used to fetch a group (.doc) of files that have just been deleted?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q19-a">
                <label class="custom-control-label" for="q19-a">Undelete</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q19-b">
                <label class="custom-control-label" for="q19-b">Undelete/all</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q19-c">
                <label class="custom-control-label" for="q19-c"> Undelete *.doc
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q19-d">
                <label class="custom-control-label" for="q19-d">All of above</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample19" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample19">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>Undelete *.doc command is used to fetch a group (.doc) of files that have just been deleted.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>20. Where are placed the list of processes that are prepared to be executed and waiting?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q20-a">
                <label class="custom-control-label" for="q20-a">Ready queue</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q20-b">
                <label class="custom-control-label" for="q20-b">Execution queue</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q20-c">
                <label class="custom-control-label" for="q20-c">Job queue</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q20-d">
                <label class="custom-control-label" for="q20-d">Process queue</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample20" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample20">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The ready queue is a set of all the processes that processes are ready to execute and wait.
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
