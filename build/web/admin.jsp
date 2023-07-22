<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
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
        <title>Admin Page</title>
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
  <link rel="stylesheet" href="css/hospital.css">
  <link rel="stylesheet" href="css/nav.css">
  <style>
      @import url('https://fonts.googleapis.com/css2?family=Inter+Tight:ital,wght@1,500&family=Lato&display=swap');
      body
      {
          font-family: 'Lato', sans-serif;
      }
  .btn-outline-custom {
    color: white;
    border-color: white;
    background-color:#06BBCC;
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
/* CSS for the quiz card */
/* CSS for the quiz card */
.quiz-card {
    position: relative;
    opacity: 0;
    transform: scale(0.9); /* Start with a slightly smaller size */
    transition: opacity 0.6s ease-in-out, transform 0.6s ease-in-out;
    cursor: pointer;
}

.quiz-card.loaded {
    opacity: 1;
    transform: scale(1); /* Scale back to its original size */
}

/* CSS for the button inside the card */
.btn-outline-custom {
    transition: background-color 0.6s ease-in-out, color 0.6s ease-in-out;
}

.btn-outline-custom:hover {
    background-color: #3366ff;
    color: white;
}

/* Additional styling for card appearance (you can adjust these according to your design) */
.card {
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    padding: 15px;
    margin-bottom: 20px;
}

.card-title {
    font-size: 18px;
    margin-bottom: 10px;
    color:black;
    font-weight:650;
}

.card-text {
    margin-bottom: 15px;
}

.card-body {
    transition: box-shadow 0.6s ease-in-out;
    
}

.card-body:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


</style>
  
    </head>
    <body>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top p-2">
            <div class="container-fluid">
                <a class="navbar-brand" href="#" data-toggle="modal" data-target="#alert">
                            <i class="fas fa-chevron-circle-left" id="hov"></i>
                            <a class="navbar-brand" href="#">  
                    <img src="img/quizhost-high-resolution-logo-color-on-transparent-background.png" alt="Logo">
                </a>
                </a>
                <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon" ></span>  
              </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end" >
                    <ul class="navbar-nav " >
                        
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#subscription">
                        <i class="fas fa-crown" aria-hidden="true"></i>
                        
                        <%
                            
                            String subscription = null;
                            String enddate= null;
    Cookie[] cookies1 = request.getCookies();

    if (cookies1 != null) {
        for (Cookie cookie : cookies1) {
            if (cookie.getName().equals("subscription")) {
                subscription = cookie.getValue();
                break;
            }
        }
                            }
        if (cookies1 != null) {
        for (Cookie cookie : cookies1) {
            if (cookie.getName().equals("enddate")) {
                enddate = cookie.getValue();
                break;
            }
        }
                            }
    if(subscription.equals("free"))
    {
    out.println("FREE");   
    }
    else
    {
    out.println("PREMUIM");
                            }
                         
                            
                            
                            
                            %>
                           
                        
                        
                        
                        
                          </a>
                        </li>
                        <li class="nav-item" id="user">
                            <a href="#" class="nav-link" data-toggle="modal" data-target="#subscription1">
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
        
    }          String user=null;
               Connection con1 = null;
            PreparedStatement stmt1 = null;
            ResultSet rs1 = null;
             int quizCount=0;
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con1 = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query1 = "SELECT name,quiz_count FROM admin_details where email = ?";
                stmt1 = con1.prepareStatement(query1);
                stmt1.setString(1, enmailCookieValue);
                rs1 = stmt1.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs1.next()) {
                 user=rs1.getString("name");
                quizCount=rs1.getInt("quiz_count");
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
        <div class="row mt-4">
            <div class="col-md-6">
            <div class="d-flex justify-content-start">
                <h1>Created Exams</h1>
            </div>
        </div>
        <div class="col-md-6">
            <div class="d-flex justify-content-start">
                <form >
                    <button type="button" class="btn btn-outline-custom btnstart btn-lg" onclick="checkSubscription('<%= enmailCookieValue %>')">
                    <i class="fas fa-plus"></i> Create Exam
                </button>
                </form>
                
            </div>
        </div>
    </div>
        <div class="row">
            <%  
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String email = enmailCookieValue;
            int count=0;
            try {
                // Establish database connection
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
                
                // Retrieve quizzes with status = 1 for the logged-in user
                String query = "SELECT quiz_name, quiz_code, date_created FROM quizzes where admin_email = ? ORDER BY date_created DESC";
                stmt = con.prepareStatement(query);
                stmt.setString(1, email);
                rs = stmt.executeQuery();
                
                // Iterate over the result set and display quiz details in cards
                while (rs.next()) {
                    String quizName = rs.getString("quiz_name");
                    String quizCode = rs.getString("quiz_code");
                    String date=rs.getString("date_created");
                    count++;
            %>
            <div class="col-md-4 mt-4">
    <div class="card quiz-card">
        <div class="card-body">
            <h1 class="card-title" style="text-transform:uppercase;"><%= quizName %></h1>
            <h6 class="card-text">Quiz Code: <%= quizCode %></h6>
            <h6 class="card-text">Created on : <%= date %> </h6> 
            <button type="button" class="btn btn-outline-custom" onclick="getResults('<%= quizCode %>')">View Result</button>
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
{%><div class="notfound"><h3>No exams created</h3></div>
<%
    }
            %>
        </div>
    </div>
        <footer>
                <div class="row">
                  <div class="col-md-4">
                    <h5><b>Quizhost</b></h5><br>
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
                    <a href="https://www.instagram.com/premsai_devavarapu/" class="icn"><i class="fa fa-linkedin"></i></a><br>
                  </div>
                  <div class="col-md-4">
                    <h5 id="kn"><b>Know Us</b></h5>
                    <a href="#" class="know">Location and Directions</a><br>
                    <a href="#" class="know">Queries</a><br>
                   
                    <a href="#" class="know">News and Media</a><br>
                    <a href="#" class="know">About Us</a><br>
                    
                  </div>
                  <div class="col-md-4">
                    <h5 id="act"><b>Actions</b></h5>
                    <a href="#" class="know">Contact Us</a><br>
                    <a href="#" class="know">Tech News</a><br>
                    
                    <a href="#" class="know">Daily updates</a><br>
                    <a href="#" class="know">Feedback</a><br>
                    
                  </div>
      
                </div>
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0 mt-5">
                        &copy; <a class="border-bottom" href="#">Quizhost</a>, All Right Reserved.

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://quizhost.online">Prem</a>
                    </div>
        
        
        </footer>
        <div class="modal fade" id="subscription" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">My Subscription</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
          <b>Subscription  :  <% if(subscription.equals("free"))
          {
                out.println("Free");
          }
          else
          {
           out.println("4$");
          }
                            %>  </b><br><br><!-- comment -->
                            <b> End date     :  None</b><br><br>
                            <b>Hosted : <%= quizCount%><br><br><!-- comment -->
                                <b>Remaining : <% int remaining=0;
                                                  
                                    if(subscription.equals("free"))
                                    {
                                         remaining=10-quizCount;
                                    }
                                    else
                                    {
                                    remaining=30-quizCount;
                                }
                                    
                                    
                                    
                                    
                                    
                                    
                                    %> <%= remaining %></b>
                  </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
          
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>
                  
                  
  <div class="modal fade" id="subscription1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">My Account</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
          <b>Name : <%= user %></b><br><br>
          <b>Subscription  :  <% if(subscription.equals("free"))
          {
                out.println("Free");
          }
          else
          {
           out.println("4$");
          }
                            %>  </b><br><br><!-- comment -->
                            <b > End date     :  None</b><br><br>
                            <b >Hosted : <%= quizCount%><br><br><!-- comment -->
                                <b>Remaining : <% int remaining1=0;
                                    
                                    if(subscription.equals("free"))
                                    {
                                         remaining1=10-quizCount;
                                    }
                                    else
                                    {
                                    remaining1=30-quizCount;
                                }
                                    
                                    
                                    
                                    
                                    
                                    
                                    %> <%= remaining1 %></b>
                  </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>                
                  
                  
                  
                  
                  
                  
            <script>
    function getResults(quizCode) {
        // Redirect to cnrank.jsp with the quizCode as a query parameter
        window.location.href = "cnrank.jsp?quizCode=" + quizCode;
    }
    <!-- Your other HTML content -->
 document.addEventListener("DOMContentLoaded", function() {
        // Get all the quiz cards on the page
        const quizCards = document.querySelectorAll(".quiz-card");

        // Add the "loaded" class to each quiz card
        quizCards.forEach(function(card) {
            card.classList.add("loaded");
        });
    });
    
    
    function checkSubscription(email)
    {
    const xhr =new XMLHttpRequest();
    xhr.open('POST','CheckSubscription',true);
    xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4 && xhr.status===200)
        {
            window.location.href="adminexam.jsp";
            /*var response = JSON.parse(xhr.responseText);
                    if (response.result === true) {
                        // Subscription check passed
                        window.alert("Subscription check passed.");
                    } else {
                        // Subscription check failed
                        window.alert("Subscription check failed.");
                    }*/
            //window.alert("Added successfully");
        }
        else if(xhr.readyState===4 && xhr.status===400)
        {
            window.alert("Quiz limit completed for your Subscription");
            window.location.href="hostPay.jsp";
        }
    };
    const params='email=' + encodeURIComponent(email);
    
    xhr.send(params);
    }

</script>
           
        
    </body>
</html>
