<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<html><head>
        <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-JEQNLFM1XB"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-JEQNLFM1XB');
</script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/exams.css">
    <link rel="stylesheet" href="css/hospital.css">
    <link rel="stylesheet" href="css/nav.css">
    <script src="js/cnt.js"></script>
    <title>Practice</title>
    <style>
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
    @keyframes zoomIn {
  0% {
    opacity: 0;
    transform: scale(0.5);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
}
.mcq
{
    margin-top:1px;
}
.cn,.mcq{
  animation: zoomIn 0.9s ease-in-out;
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
        visibility: hidden;
        transition: .5s;
    }
    }
    .navbar .dropdown-toggle::after {
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    vertical-align:middle;
    margin-left: 8px;
}

.navbar-light .navbar-nav .nav-link {
    margin-right: 20px;
    
    
    font-size: 15px;
    text-transform: uppercase;
    outline: none;
}

.navbar-light .navbar-nav .nav-link:hover,
.navbar-light .navbar-nav .nav-link.active {
    color:#06BBCC ;
}
.mcq1
{
   animation: zoomIn 0.9s ease-in-out;
   color:#181d38 ;
  text-align: center;
  padding:40px 20px 20px 20px;
}
    </style>
    </head>
    <body>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top p-2">
            <div class="container-fluid">
                
                            
                            <a class="navbar-brand" href="index.html">  
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
                            
                            
                            
                            
                            
   <div class="modal fade" id="subscription" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Exams Today</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <%  
        Connection con1 = null;
        PreparedStatement stmt1 = null;
        ResultSet rs1 = null;
        int count = 0;

        try {
            // Establish database connection (Make sure you have closed the connection in a global context)
            // Class.forName("com.mysql.jdbc.Driver"); -- This is no longer required for recent versions of JDBC
            con1 = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

            // Retrieve quizzes with status = 0 for the logged-in user (consider renaming "status" to "quiz_status" to avoid confusion)
            String query1 = "SELECT quiz_name, quiz_code, date FROM user_quizzes WHERE status = 0 AND email = ? ORDER BY date DESC";
            stmt1 = con1.prepareStatement(query1);
            stmt1.setString(1, enmailCookieValue);
            rs1 = stmt1.executeQuery();

            // Iterate over the result set and display quiz details in cards
            while (rs1.next()) {
                String quizName = rs1.getString("quiz_name");
                String quizCode = rs1.getString("quiz_code");
                String date = rs1.getString("date");
                
                count++;
                LocalDate datenow = LocalDate.parse(date);

        // Get the current date
        LocalDate currentDate = LocalDate.now();
        if (currentDate.equals(datenow)) {
        %>
        <!-- Display quiz details in cards -->
        <h5 class="card-title"><%= quizName %></h5>
        <p class="card-text">Quiz Code: <%= quizCode %>
        <p class="card-text">Date: <%= date %> </p>
      </p><button class="btn btn-secondary " data-dismiss="modal" onclick="enterQuizcode()" >Start</button><br><hr><br>
        <% 
            }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources in reverse order
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
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
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
                    <a >
                    <button class="btn-primary lgout" name="Yes" value="Yes" onclick="lgout()">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>         
          </div>
      </div>
                            <br><div class="row" id="headerr">
                    <div class="col-md-6">
                        <h3 class="mcq1">Join the Fun: Participate in Our Exciting Quizzes</h3>
                    </div>
                              
                   
                </div>
                
            <div id="container-exam">
                
                <a href="dbms.jsp" class="cont">
                    <div class="cn">
                    <div class="examimg" id="cnimg">
                    </div>
                    <div class="exam-content">
                        <h5>DBMS</h5>
                        <div class="exam-desc">
                            DBMS is a software system that enables users to store, manage, and retrieve data efficiently from databases.
                        </div>
                        
                        
                    </div>           
                </div>
                </a>
                <a href="os.jsp" onclick="myfunc1()" class="cont">
                    <div class="cn">
                    <div class="examimg" id="osimg">
                    </div>
                    <div class="exam-content">
                        <h5>Operating Systems</h5>
                        <div class="exam-desc">
                            The operating system is a set of special programs 
                            that run on a computer system that allows it to work
                            properly
                        </div>
                         <p id="timer1"></p>
                    </div>   
                </div>
                </a>
                <a href="dsa.jsp" onclick="myfunc2()" class="cont">
                    <div class="cn">
                    <div class="examimg" id="aiimg">
                    </div>
                    <div class="exam-content">
                        <h5>Data Structures and Algorithms</h5>
                        <div class="exam-desc">
                            DSA involves the study and design of data structures and algorithms to efficiently organize and process data in computer programs.
                        </div>
                        <p id="timer2"></p>
                    </div>   
                </div>
                </a>
                <a href="CN.jsp" class="cont">
                    <div class="cn">
                    <div class="examimg" id="pyimg">
                    </div>
                    <div class="exam-content">
                        <h5>Computer Networks</h5>
                        <div class="exam-desc">
                            Computer Networks are interconnected systems that facilitate communication and data exchange between devices and computers,
                        </div>
                    </div>
                </div>
                </a>
                <a href="cloud.jsp" class="cont">
                    <div class="cn">
                    <div class="examimg" id="tocimg">
                    </div>
                    <div class="exam-content">
                        <h5>Cloud Computing</h5>
                        <div class="exam-desc">
                            Cloud Computing is a technology that delivers on-demand computing resources, such as storage, servers, and applications, over the internet. 
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="java.jsp" class="cont">
                    <div class="cn">
                    <div class="examimg" id="netimg">
                    </div>
                    <div class="exam-content">
                        <h5>JAVA</h5>
                        <div class="exam-desc">
                            Java is a versatile, object-oriented programming language known for its platform independence, portability, and wide use in web development
                        </div>
                    </div>
                </div>
                </a>    
                <a href="software.jsp" class="cont">
                    <div class="cn">
                    <div class="examimg" id="softimg">
                    </div>
                    <div class="exam-content">
                        <h5>Software Engineering</h5>
                        <div class="exam-desc">
                            Software Engineering is an engineering discipline focused on systematic approaches to design, develop, test, and maintain high-quality software solutions.
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="oops.jsp" class="cont">
                    <div class="cn">
                    <div class="examimg" id="netimg">
                    </div>
                    <div class="exam-content">
                        <h5>Object-Oriented Programming</h5>
                        <div class="exam-desc">
                             Uses objects, classes, and their interactions to design and implement software, promoting modularity, reusability, and flexibility in code development.
                        </div>
                    </div>
                </div>
                </a>    
            </div>
    <footer>
                <div class="row">
                  <div class="col-md-4">
                    <h5 id="foot"><b>Quizhost</b></h5><br>
                    Trichy-Tanjore Road, Thirumalaisamudram,
                    Thanjavur, Tamil Nadu 613401
                    <br>
                    +91-6305332926
                    <br>
                     Enquiry : +91-6305332926<br><br><br>
                    <a href="https://www.instagram.com/premsai_devavarapu/" class="icn"><i class="fa fa-youtube"></i></a>
                    <a href="https://www.instagram.com/premsai_devavarapu/" class="icn"><i class="fa fa-twitter"></i></a>
                    <a href="https://www.instagram.com/premsai_devavarapu/" class="icn"><i class="fa fa-facebook"></i></a>
                    <a href="https://www.instagram.com/premsai_devavarapu/" class="icn"><i class="fa fa-instagram"></i></a>
                    <a href="#https://www.instagram.com/premsai_devavarapu/" class="icn"><i class="fa fa-linkedin"></i></a><br>
                  </div>
                  <div class="col-md-4">
                    <h5 id="kn"><b>Know Us</b></h5>
                    <a href="#" class="know">Location and Directions</a><br>
                    <a href="#" class="know">Queries</a><br>
                    <a href="#" class="know">Our Tutors</a><br>
                    <a href="#" class="know">News and Media</a><br>
                    <a href="#" class="know">About Us</a><br>
                    <a href="#" class="know">Awards</a><br>
                  </div>
                  <div class="col-md-4">
                    <h5 id="act"><b>Actions</b></h5>
                    <a href="#" class="know">Contact Us</a><br>
                    <a href="#" class="know">Tech News</a><br>
                    <a href="#" class="know">IT India</a><br>
                    <a href="#" class="know">Daily updates</a><br>
                    <a href="#" class="know">Feedback</a><br>
                    
                  </div>
      
                </div>
                
        
        
        </footer>
<script>
   window.onload = function() {
  var cardContainers = document.querySelectorAll("#container-exam .cont");
  var delay = 200; // Delay between each card animation in milliseconds

  for (var i = 0; i < cardContainers.length; i++) {
    (function(index) {
      setTimeout(function() {
        cardContainers[index].style.opacity = "1";
        cardContainers[index].classList.add("zoomIn");
      }, delay * index);
    })(i);
  }
  
};
function showModalAfterDelay() {
    setTimeout(function () {
      $('#subscription').modal('show');
      sessionStorage.setItem('modalShown', 'true');
    }, 4000); // 4 seconds delay (4000 milliseconds)
  }

  // Call the function when the page is loaded
  $(document).ready(function () {
      var modalShown = sessionStorage.getItem('modalShown');
      if((<%= count %> )>0 && modalShown!=='true')
      {
          showModalAfterDelay();
      }
    
  });
    function lgout()
    {
        sessionStorage.removeItem('modalShown');
        window.location.href="logout";
    }
</script>
</body>

</html>