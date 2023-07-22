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
    <title>Java</title>
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
            <h5>1. Which statement is true about Java?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q1-a">
                <label class="custom-control-label" for="q1-a">Java is a platform-dependent programming language</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q1-b">
                <label class="custom-control-label" for="q1-b">Java is a platform-independent programming language</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q1-c">
                <label class="custom-control-label" for="q1-c">Java is a code dependent programming language</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q1-d">
                <label class="custom-control-label" for="q1-d">Java is a sequence-dependent programming language</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample1">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Java is called ‘Platform Independent Language’ as it primarily works on the principle of ‘compile once, run everywhere’.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>2.What will be the output of the following Java code?</h5><br>class increment {<br>
            public static void main(String args[]) <br>
            {        <br>
            int g = 3;<br>
            System.out.print(++g * 8);<br>
            } <br>
            }<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q2-a">
                <label class="custom-control-label" for="q2-a">32</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q2-b">
                <label class="custom-control-label" for="q2-b">33</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q2-c">
                <label class="custom-control-label" for="q2-c">24</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q2-d">
                <label class="custom-control-label" for="q2-d">25</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample2">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b> Operator ++ has more preference than *, thus g becomes 4 and when multiplied by 8 gives 32.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>3.What is Truncation in Java?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q3-a">
                <label class="custom-control-label" for="q3-a">Floating-point value assigned to an integer type</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q3-b">
                <label class="custom-control-label" for="q3-b">Floating-point value assigned to a Floating type</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q3-c">
                <label class="custom-control-label" for="q3-c">Integer value assigned to floating type
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3d" value="d" id="q3-d">
                <label class="custom-control-label" for="q3-d">Integer value assigned to floating type</label>
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
            <h5>4.What will be the output of the following Java code snippet?</h5><br>class abc<br>
            {<br>
            public static void main(String args[])<br>
            {<br>
            if(args.length>0)<br>
            System.out.println(args.length);<br>
            }<br>
            }<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q4-a">
                <label class="custom-control-label" for="q4-a">The snippet compiles, runs and prints 0</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q4-b">
                <label class="custom-control-label" for="q4-b"> The snippet compiles and runs but does not print anything</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q4-c">
                <label class="custom-control-label" for="q4-c">The snippet compiles, runs and prints 1</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q4-d">
                <label class="custom-control-label" for="q4-d">The snippet does not compile</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample4">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>  As no argument is passed to the code, the length of args is 0. So the code will not print.

                </div>
            </div>
        </div>
        <div class="question">
            <h5>5.Which of these keywords is used to define interfaces in Java?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q5-a">
                <label class="custom-control-label" for="q5-a">intf</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q5-b">
                <label class="custom-control-label" for="q5-b">Intf</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q5-c">
                <label class="custom-control-label" for="q5-c">interface</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q5-d">
                <label class="custom-control-label" for="q5-d">Interface
</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b> interface keyword is used to define interfaces in Java.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>6.What will be the output of the following Java program?</h5><br>class output <br>
            {<br>
    public static void main(String args[])<br>
    { <br>
    StringBuffer s1 = new StringBuffer("Quiz");<br>
    StringBuffer s2 = s1.reverse();<br>
    System.out.println(s2);<br>
    }<br>
    }<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q6-a">
                <label class="custom-control-label" for="q6-a">QuizziuQ</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q6-b">
                <label class="custom-control-label" for="q6-b"> ziuQQuiz</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q6-c">
                <label class="custom-control-label" for="q6-c">Quiz</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q6-d">
                <label class="custom-control-label" for="q6-d">ziuQ</label>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample6" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample6">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>reverse() method reverses all characters. It returns the reversed object on which it was called.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>7.Which of the following is a superclass of every class in Java?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q7-a">
                <label class="custom-control-label" for="q7-a">String</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q7-b">
                <label class="custom-control-label" for="q7-b">Abstract class</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q7-c">
                <label class="custom-control-label" for="q7-c">ArrayList</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q7-d">
                <label class="custom-control-label" for="q7-d">Object class</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample7" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample7">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>Object class is superclass of every class in Java.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>8. Which of these statements is incorrect about Thread?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q8-a">
                <label class="custom-control-label" for="q8-a"> start() method is used to begin execution of the thread</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q8-b">
                <label class="custom-control-label" for="q8-b">run() method is used to begin execution of a thread before start() method in special cases</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q8-c">
                <label class="custom-control-label" for="q8-c">  A thread can be formed by implementing Runnable interface only</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q8-d">
                <label class="custom-control-label" for="q8-d">A thread can be formed by a class that extends Thread class</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample8" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample8">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b> run() method is used to define the code that constitutes the new thread, it contains the code to be executed. start() method is used to begin execution of the thread that is execution of run(). run() itself is never used for starting execution of the thread.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>9.What is the numerical range of a char data type in Java?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q9-a">
                <label class="custom-control-label" for="q9-a">0 to 256</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q9-b">
                <label class="custom-control-label" for="q9-b"> -128 to 127
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q9-c">
                <label class="custom-control-label" for="q9-c">0 to 65535</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q9-d">
                <label class="custom-control-label" for="q9-d">0 to 32767</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample9" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample9">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>Char occupies 16-bit in memory, so it supports 216 i:e from 0 to 65535.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>10.What will be the output of the following Java program?</h5><br><br>class overload <br>
            {<br>
            int x;<br>
            double y;<br>
            void add(int a , int b) <br>
            {<br>
            x = a + b;<br>
            }<br>
            void add(double c , double d)<br>
            {<br>
            y = c + d;<br>
            }<br>
            overload() <br>
            {<br>
            this.x = 0;<br><!-- comment -->
            this.y = 0;<br>
            } <br>       
            }    <br>
            class Overload_methods <br>
            {<br>
            public static void main(String args[])<br>
            {<br>
            overload obj = new overload();<br>   
            int a = 2;<br>
            double b = 3.2;<br>
            obj.add(a, a);<br>
            obj.add(b, b);<br>
            System.out.println(obj.x + " " + obj.y);   <br>  
            }<br>
            }<br><br>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10a" value="a" id="q10-a">
                <label class="custom-control-label" for="q10-a">4 6.4</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10b" value="b" id="q10-b">
                <label class="custom-control-label" for="q10-b"> 6.4 6</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10c" value="c" id="q10-c">
                <label class="custom-control-label" for="q10-c">6.4 6.4</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10d" value="d" id="q10-d">
                <label class="custom-control-label" for="q10-d">6 6</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample10">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>For obj.add(a,a); ,the function in line number 4 gets executed and value of x is 4. For the next function call, the function in line number 7 gets executed and value of y is 6.4
                </div>
            </div>
        </div>
        
        
        
         <div class="question">
             <h5>11. Which of the following is true about servlets?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q11-a">
                <label class="custom-control-label" for="q11-a">Servlets can use the full functionality of the Java class libraries</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q11-b">
                <label class="custom-control-label" for="q11-b">Servlets execute within the address space of web server, platform independent and uses the functionality of java class libraries</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q11-c">
                <label class="custom-control-label" for="q11-c"> Servlets execute within the address space of web server</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q11-d">
                <label class="custom-control-label" for="q11-d">Servlets are platform-independent because they are written in java</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample11" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample11">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Servlets execute within the address space of a web server. Since it is written in java it is platform independent. The full functionality is available through libraries.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>12. Which of the following is FALSE about abstract classes in Java</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q12-a">
                <label class="custom-control-label" for="q12-a">A class can inherit from multiple abstract classes.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q12-b">
                <label class="custom-control-label" for="q12-b">A class can be made abstract without any abstract method</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q12-c">
                <label class="custom-control-label" for="q12-c">Abstract classes can have constructors</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q12-d">
                <label class="custom-control-label" for="q12-d">If we derive an abstract class and do not implement all the abstract methods, then the derived class should also be marked as abstract using 'abstract' keyword</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample12" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample12">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>None.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>13.Which of the following option leads to the portability and security of Java?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q13-a">
                <label class="custom-control-label" for="q13-a">Bytecode is executed by JVM</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q13-b">
                <label class="custom-control-label" for="q13-b">The applet makes the Java code secure and portable<label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q13-c">
                <label class="custom-control-label" for="q13-c">Use of exception handling</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q13d" value="d" id="q13-d">
                <label class="custom-control-label" for="q13-d">Dynamic binding between objects</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample13" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample13">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b> The output of the Java compiler is bytecode, which leads to the security and portability of the Java code. It is a highly developed set of instructions that are designed to be executed by the Java runtime system known as Java Virtual Machine (JVM). The Java programs executed by the JVM that makes the code portable and secure. Because JVM prevents the code from generating its side effects. The Java code is portable, as the same byte code can run on any platform.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>14.What is the return type of the hashCode() method in the Object class?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q14-a">
                <label class="custom-control-label" for="q14-a"> Object</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q14-b">
                <label class="custom-control-label" for="q14-b">int</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q14-c">
                <label class="custom-control-label" for="q14-c"> long</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q14-d">
                <label class="custom-control-label" for="q14-d">void</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample14" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample14">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>In Java, the return type of hashCode() method is an integer, as it returns a hash code value for the object.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>15.What does the expression float a = 35 / 0 return?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q15-a">
                <label class="custom-control-label" for="q15-a">0</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q15-b">
                <label class="custom-control-label" for="q15-b">Not a Number</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q15-c">
                <label class="custom-control-label" for="q15-c">Infinity</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q15-d">
                <label class="custom-control-label" for="q15-d">Run time exception</label>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>In Java, whenever we divide any number (double, float, and long except integer) by zero, it results in infinity. According to the IEEE Standard for Floating-Point Arithmetic (IEEE 754), if we divide 1/0 will give positive infinity, -1/0 will give negative infinity, and 0/0 will give NaN. But on dividing an integer by zero, it throws a runtime exception, i.e., java.lang.ArithmeticException.
            </div>
        </div>
        <div class="question">
            <h5>16.Evaluate the following Java expression, if x=3, y=5, and z=10:<br>

++z + y - y + z + x++</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q16-a">
                <label class="custom-control-label" for="q16-a">24</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q16-b">
                <label class="custom-control-label" for="q16-b"> 23</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q16-c">
                <label class="custom-control-label" for="q16-c">20</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q16-d">
                <label class="custom-control-label" for="q16-d">25</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample16" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample16">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b> In the above expression, ++z means that the value will first increment by 1, i.e. 12. Now, evaluate the statement by putting the values of x, y, and z. On evaluating the expression, we get 25, as shown below.
                    <br><br>
++z +y -y +z + x++
11 + 5 - 5 + 11 + 3 = 25
                </div>
            </div>
        </div>
        <div class="question">
            <h5>17.Which of the following for loop declaration is not valid?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q17-a">
                <label class="custom-control-label" for="q17-a">for ( int i = 2; i <= 20; i = 2* i )</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q17-b">
                <label class="custom-control-label" for="q17-b">for ( int i = 20; i >= 2; - -i )</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q17-c">
                <label class="custom-control-label" for="q17-c">for ( int i = 7; i <= 77; i += 7 )</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q17-d">
                <label class="custom-control-label" for="q17-d">for ( int i = 99; i >= 0; i / 9 )</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample17" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample17">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>The first option is not a valid declaration as i/9 is not declared correctly. The correct statement will be:<br>
                    for ( int i= 99; i>=0; i= i/9)<br><br>

                    Then the code would execute. But without assigning the value of i/9 to a variable, it would not execute, and an exception is thrown, as shown below.<br><br>

Exception in thread "main" java.lang.Error: Unresolved compilation problem:
      Syntax error on token "/", invalid AssignmentOperator
                </div>
            </div>
        </div>
        <div class="question">
            <h5>18 .In which process, a local variable has the same name as one of the instance variables?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q18-a">
                <label class="custom-control-label" for="q18-a">Serialization</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q18-b">
                <label class="custom-control-label" for="q18-b">Variable Shadowing</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q18-c">
                <label class="custom-control-label" for="q18-c">Abstraction</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q18-d">
                <label class="custom-control-label" for="q18-d">Multi-threading</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample18" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample18">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b> here are following reasons for considering a variable shadowing, they are listed below:
                    <ul>
                        <li>When we define a variable in a local scope with a variable name same as the name of a variable defined in an instance scope.</li>
                        <li>When a subclass declares a variable with the same name as of the parent class variable.</li>
                        <li>When a method is overridden in the child class.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="question">
            <h5>19.Which option is false about the final keyword?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q19-a">
                <label class="custom-control-label" for="q19-a">A final method cannot be overridden in its subclasses.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q19-b">
                <label class="custom-control-label" for="q19-b">A final class cannot be extended.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q19-c">
                <label class="custom-control-label" for="q19-c">A final class cannot extend other classes.
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q19-d">
                <label class="custom-control-label" for="q19-d">A final method can be inherited.</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample19" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample19">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>A final method can be inherited.<br><br><!-- comment -->
                    <ul>
                        <li>Using the final keyword with a variable makes it constant or immutable. We can't reassign the values of it.</li>
                        <li>A final variable must be a local variable and cannot be used in other classes.</li>
                        <li>Using the final keyword with a method makes it constant, and we can't override it in the subclass.</li>
                        <li>Using final with a class makes the class constant, and we cannot extend a final class. But a final class can extend other classes.</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="question">
            <h5>20. What is the use of the intern() method?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q20-a">
                <label class="custom-control-label" for="q20-a">It returns the existing string from memory</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q20-b">
                <label class="custom-control-label" for="q20-b">It creates a new string in the database</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q20-c">
                <label class="custom-control-label" for="q20-c">It modifies the existing string in the database</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q20-d">
                <label class="custom-control-label" for="q20-d">None of the above</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample20" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample20">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The intern() method is used to return the existing strings from the database. In other words, the intern() method returns a reference of the string. For example, if the string constant pool already has a string object with the same value, the intern() method will return a reference of the string from the pool.
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
