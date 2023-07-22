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
    <title>DBMS</title>
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
            <h5>1. Which of the following is not a type of database?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q1-a">
                <label class="custom-control-label" for="q1-a">Hierarchical</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q1-b">
                <label class="custom-control-label" for="q1-b">Decentralized</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q1-c">
                <label class="custom-control-label" for="q1-c">Distributed</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q1-d">
                <label class="custom-control-label" for="q1-d">Network</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample1">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Different types are:
1) Centralized
2) Distributed
3) Relational
4) NoSQL
5) Cloud
6) Object-oriented
7) Hierarchical
8) Network
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>2. Which of the following is not a feature of DBMS?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q2-a">
                <label class="custom-control-label" for="q2-a">Single-user Access only</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q2-b">
                <label class="custom-control-label" for="q2-b">High Level of Security</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q2-c">
                <label class="custom-control-label" for="q2-c">Minimum duplication and redundancy of data</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q2-d">
                <label class="custom-control-label" for="q2-d">Support ACID Property</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample2">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Single-user Access only” is not a feature of DBMS. DBMS allows multiple users to access and manipulate the database concurrently. It provides mechanisms to handle concurrent access and ensure data consistency and integrity among multiple users.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>3.Which of the following is not a function of the database?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q3-a">
                <label class="custom-control-label" for="q3-a">Analysing code</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q3-b">
                <label class="custom-control-label" for="q3-b">Manipulating data</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q3-c">
                <label class="custom-control-label" for="q3-c">Security for stored data</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3d" value="d" id="q3-d">
                <label class="custom-control-label" for="q3-d">Managing stored data</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample3">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>It allows authorized users to update, store, manipulate, or access data. Since data is stored in table format it is easy to access the data and perform the required functions. It also removes duplicate and redundant data.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>4.Ready the Query carefully:</h5><br><br>SELECT emp_name<br>
            FROM department<br>
            WHERE dept_name LIKE ' _____ Computer Science'; <br><br>In the above-given Query, which of the following can be placed in the Query's blank portion to select the "dept_name" that also contains Computer Science as its ending string?
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q4-a">
                <label class="custom-control-label" for="q4-a">&</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q4-b">
                <label class="custom-control-label" for="q4-b">%</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q4-c">
                <label class="custom-control-label" for="q4-c">_</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q4-d">
                <label class="custom-control-label" for="q4-d">$</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample4">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>In the above-given Query, the "%" (like) operator will be used, which is generally used while searching for a certain pattern in the strings. It represents the single and multiple characters. In this case, it used with "Where "louse to select the "dept_name" that contains the Computer Since as its ending string. To understand it more clearly, consider the following syntax:<br><b>Syntax</b><br>SELECT column1, column2, ...<br>
                    FROM table_name<br>
WHERE columnN LIKE pattern;
                </div>
            </div>
        </div>
        <div class="question">
            <h5>5.The term "FAT" is stands for_____</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q5-a">
                <label class="custom-control-label" for="q5-a">File Allocation Tree</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q5-b">
                <label class="custom-control-label" for="q5-b">File Allocation Graph</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q5-c">
                <label class="custom-control-label" for="q5-c">File Allocation Table</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q5-d">
                <label class="custom-control-label" for="q5-d">All of the above</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>The term "FAT" can be described as a file structure (or file architecture). In which all the information about the files where they are stored and where all these files need to be stored or in which directory, all that information generally stored in the file structure. Therefore the Operating system creates a table in which all the files and clusters are stored, known as the file allocation table.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>6.In the relation model, the relation are generally termed as ________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q6-a">
                <label class="custom-control-label" for="q6-a">Tuples</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q6-b">
                <label class="custom-control-label" for="q6-b">Attributes</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q6-c">
                <label class="custom-control-label" for="q6-c">Rows</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q6-d">
                <label class="custom-control-label" for="q6-d">Tables</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample6" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample6">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>In the relation model, the relations are also referred to as the tables because the relations are considered as the technical name of the table. So the correct answer is D.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>7.Which of the following is not binary operation?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q7-a">
                <label class="custom-control-label" for="q7-a">Union</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q7-b">
                <label class="custom-control-label" for="q7-b">Cartesian product</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q7-c">
                <label class="custom-control-label" for="q7-c">Set Difference</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q7-d">
                <label class="custom-control-label" for="q7-d">Project</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample7" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample7">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Project operation selects (or chooses) certain attributes discarding other attributes.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>8.For designing a normal RDBMS which of the following normal form is considered adequate?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q8-a">
                <label class="custom-control-label" for="q8-a">4NF</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q8-b">
                <label class="custom-control-label" for="q8-b">3NF</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q8-c">
                <label class="custom-control-label" for="q8-c">2NF</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q8-d">
                <label class="custom-control-label" for="q8-d">5NF</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample8" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample8">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Because most 3NF tables are free of insertion, update, and deletion anomalies, an RDBMS table is sometimes regarded as “normalized” if it is in the Third Normal Form.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>9.What happens if a piece of data is stored in two places in the db?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q9-a">
                <label class="custom-control-label" for="q9-a">Changing the data in one spot will cause data inconsistency</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q9-b">
                <label class="custom-control-label" for="q9-b">In can be more easily accessed</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q9-c">
                <label class="custom-control-label" for="q9-c"> Storage space is wasted & Changing the data in one spot will cause data inconsistency</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q9-d">
                <label class="custom-control-label" for="q9-d">Storage space is wasted</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample9" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample9">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>One of the main features of a database management system is minimum data duplication and redundancy. Hence, is always consistent and so there is no duplication.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>10.Which of the following statements are TRUE about an SQL query? P : An SQL query can contain a HAVING clause even if it does not have a GROUP BY clause Q : An SQL query can contain a HAVING clause only if it has a GROUP BY clause R : All attributes used in the GROUP BY clause must appear in the SELECT clause S : Not all attributes used in the GROUP BY clause need to appear in the SELECT clause</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10a" value="a" id="q10-a">
                <label class="custom-control-label" for="q10-a">P and S</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10b" value="b" id="q10-b">
                <label class="custom-control-label" for="q10-b">P and R</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10c" value="c" id="q10-c">
                <label class="custom-control-label" for="q10-c">Q and R</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10d" value="d" id="q10-d">
                <label class="custom-control-label" for="q10-d">Q and S</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample10">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>According to standard SQL answer should be option (C) which is answer key given by GATE authority. If we talk about different SQL implementations like MySQL, then option (B) is also right. But in question they seem to be talking about standard SQL not about implementation. For example below is a P is correct in most of the implementations. HAVING clause can also be used with aggregate function. If we use a HAVING clause without a GROUP BY clause, the HAVING condition applies to all rows that satisfy the search condition. In other words, all rows that satisfy the search condition make up a single group.
                </div>
            </div>
        </div>
        
        
        
         <div class="question">
            <h5>11. Which of the following concurrency control protocols ensure both conflict serializability and freedom from deadlock? I. 2-phase locking II. Time-stamp ordering</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q11-a">
                <label class="custom-control-label" for="q11-a">I only</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q11-b">
                <label class="custom-control-label" for="q11-b">II only</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q11-c">
                <label class="custom-control-label" for="q11-c">Both I and II</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q11-d">
                <label class="custom-control-label" for="q11-d">Neither I nor II</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample11" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample11">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>2 Phase Locking (2PL) is a concurrency control method that guarantees serializability. The protocol utilizes locks, applied by a transaction to data, which may block (interpreted as signals to stop) other transactions from accessing the same data during the transaction’s life. 2PL may be lead to deadlocks that result from the mutual blocking of two or more transactions.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>12. A clustering index is defined on the fields which are of type</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q12-a">
                <label class="custom-control-label" for="q12-a">non-key and ordering</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q12-b">
                <label class="custom-control-label" for="q12-b">non-key and non-ordering</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q12-c">
                <label class="custom-control-label" for="q12-c">key and ordering</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q12-d">
                <label class="custom-control-label" for="q12-d">key and non-ordering</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample12" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample12">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Indexing is a data structure technique to efficiently retrieve records from database files based on some attributes on which the indexing has been done. It is used to optimize the performance of database.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>13.What is information about data called?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q13-a">
                <label class="custom-control-label" for="q13-a">Meta data</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q13-b">
                <label class="custom-control-label" for="q13-b">Tera data</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q13-c">
                <label class="custom-control-label" for="q13-c">Hyper data</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q13d" value="d" id="q13-d">
                <label class="custom-control-label" for="q13-d">Relations</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample13" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample13">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Information about data is known as Metadata. Metadata describes the data in detail by providing additional information like type, length of the data, etc. Metadata helps the user to understand the data.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>14.The ability to query data, as well as insert, delete, and alter tuples, is offered by ____________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q14-a">
                <label class="custom-control-label" for="q14-a">TCL (Transaction Control Language)</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q14-b">
                <label class="custom-control-label" for="q14-b">DML (Data Manipulation Langauge)</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q14-c">
                <label class="custom-control-label" for="q14-c">DDL (Data Definition Langauge)</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q14-d">
                <label class="custom-control-label" for="q14-d">DCL (Data Control Language)</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample14" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample14">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>A query is a request for data or information. Relational Schema is the design and structure of the relation. DDL consists of commands that help in modifying. DML performs the change in the values of the relation.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>15._________________ operations do not preserve non-matched tuples.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q15-a">
                <label class="custom-control-label" for="q15-a">Left outer join</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q15-b">
                <label class="custom-control-label" for="q15-b">Natural join</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q15-c">
                <label class="custom-control-label" for="q15-c">Inner join</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q15-d">
                <label class="custom-control-label" for="q15-d">Right outer join
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>Left outer join returns all the rows from the table that is on the left side and matching rows on the right side of the join. Inner join returns all rows when there is at least one match in BOTH tables. Natural join returns the common columns from the tables being joined. A right outer join returns all the rows from the table that is on the right side and matching rows on the left side of the join.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>16.Why the following statement is erroneous?</h5><br>SELECT dept_name, ID, avg (salary)<br>
            FROM instructor<br>
            GROUP BY dept_name;<br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q16-a">
                <label class="custom-control-label" for="q16-a">Dept_id should not be used in group by clause</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q16-b">
                <label class="custom-control-label" for="q16-b">Group by clause is not valid in this query</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q16-c">
                <label class="custom-control-label" for="q16-c">Both A and B</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q16-d">
                <label class="custom-control-label" for="q16-d">Dept_id should not be used in group by clause</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample16" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample16">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>Any property that does not occur in the group by clause must only appear in an aggregate function if it also appears in the select clause; otherwise, the query is considered incorrect.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>17.After groups have been established, SQL applies predicates in the ___________ clause, allowing aggregate functions to be used.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q17-a">
                <label class="custom-control-label" for="q17-a">Where</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q17-b">
                <label class="custom-control-label" for="q17-b">Having</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q17-c">
                <label class="custom-control-label" for="q17-c">Group by</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q17-d">
                <label class="custom-control-label" for="q17-d">With</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample17" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample17">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>The “with” clause was introduced to reduce the complexity of the queries which are lengthy. The “with” clause allows you to define a temporary relation whose definition is only visible to the query in which it appears.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>18.What does a foreign key combined with a primary key create?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q18-a">
                <label class="custom-control-label" for="q18-a">Parent-Child relationship between the tables that connects them</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q18-b">
                <label class="custom-control-label" for="q18-b">Network model between the tables that connect them</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q18-c">
                <label class="custom-control-label" for="q18-c">One to many relationship between the tables that connects them</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q18-d">
                <label class="custom-control-label" for="q18-d">All of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample18" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample18">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Using the two relationships mother and father gives us a record of a child’s mother, even if we don’t know who the father is; if the ternary connection parent is used, a null value is necessary. In this scenario, binary relationship sets are preferred.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>19.What is the function of the following command?<br>Delete from r where P;</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q19-a">
                <label class="custom-control-label" for="q19-a">Clears entries from relation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q19-b">
                <label class="custom-control-label" for="q19-b">Deletes relation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q19-c">
                <label class="custom-control-label" for="q19-c"> Deletes particular tuple from relation</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q19-d">
                <label class="custom-control-label" for="q19-d">All of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample19" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample19">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>In the command the P gives condition to delete a particular tuple.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>20. Which of the following functions construct histograms and use buckets for ranking?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q20-a">
                <label class="custom-control-label" for="q20-a">Ntil()</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q20-b">
                <label class="custom-control-label" for="q20-b">Newtil()</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q20-c">
                <label class="custom-control-label" for="q20-c">Rank()</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q20-d">
                <label class="custom-control-label" for="q20-d">All of the mentioned</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample20" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample20">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>ntile(n) returns the number of the bucket in which each tuple is stored, with bucket numbers beginning with 1.
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
