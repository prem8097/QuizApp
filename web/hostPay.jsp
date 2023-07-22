<%-- 
    Document   : examComplete
    Created on : 30-Jun-2023, 11:34:32 am
    Author     : premsai devavarapu
--%>

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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment</title>
  <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
    <link rel="stylesheet" href="css/QuizIT.css">
    <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Libraries Stylesheet -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter+Tight:ital,wght@1,500&family=Lato&display=swap');
        html,
    body {
        height: 100vh;
    }

    .card-container {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 94vh;
        background-color: #f0f0f0;
        padding: 0px;
        font-family: 'Lato', sans-serif;
    }

    .card {
        background-color: #ffffff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        width: 500px;
        padding: 30px;
        text-align: center;
        position: relative;
        min-height: 50vh;
    }

    /* Rest of your styles... */

    @media (max-width: 500px) {
        .card {
            width: 90%;
        }
    }
.success-message {
  animation: fadeInUp 1s ease forwards;
  opacity: 0;
  transform: translateY(40px);
}

@keyframes fadeInUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.feedback-section {
  margin-top: 20px;
  animation: fadeInUp 1s ease 1s forwards;
  opacity: 0;
  transform: translateY(40px);
}

textarea {
  width: 100%;
  min-height: 100px;
  resize: vertical;
  margin-bottom: 10px;
  padding: 8px;
  border: 1px solid #06BBCC;
  border-radius: 4px;
}

.submit-button {
  background-color: #06BBCC;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.2s ease;
}

.submit-button:hover {
  background-color: #059aa6;
}

@media (max-width: 500px) {
  .card {
    width: 90%;
  }
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
    </style>
</head>
    
    <body>
      <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top p-2">
            <div class="container-fluid">
                
                            
                            <a class="navbar-brand" href="#">  
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
                        <li class="nav-item">
                          <a href="#" class="nav-link" data-target="#myadmin-signup" data-toggle="modal">
                            Signup
                          </a>
                        </li>
 



                        
                             
                    </ul>
                </div>
              </div>
    </nav>
                            <div class="card-container">
                                <div class="card">
  <div class="success-message">
    <h1>Payment</h1>
    <div class="form-group">
        
       
        <input type="text" class="form-control" id="exampleInput" placeholder="Enter your Admin Email"><br>
        
       
        <input type="password" class="form-control" id="exampleInput1" placeholder="Enter your Admin Password"><br>
      <button class="submit-button" onclick="checkEmail()">Enter</button>
      <a  href="#"data-toggle="modal" data-target="#myadmin-signup" data-dismiss="modal" >Not an Admin?</a> 
    </div>
  </div>
  <div class="feedback-section" style="display: none;">
      <h5>Proceed to Pay</h5>
    <div id="paypal-button-container"></div>
  </div>
</div>
  
                            </div>                            
 <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">Payment Successful</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Your payment was successful.</p>
            </div>
        </div>
    </div>
</div>
<form action="adminOTP_verify" method="post">
      <div class="modal fade" id="myadmin-signup">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" >Admin Signup with QuizIT</h5>
              <button id="modalcls2" type="button" data-dismiss="modal" class="btn-close"><i class="fa fa-close"></i></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3">
                <span class="input-group-text" ><i class="fas fa-user"></i></span>
                <input name="adminname" class="form-control" type="text" placeholder="Name" required>
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" ><i class="fas fa-user"></i></span>
                <input name="adminemail" class="form-control" type="email" placeholder="Email" id="adminemail" required>
              </div>
              <div class="input-group mb-3">
                <span class="input-group-text" ><i class="fas fa-lock"></i></span>
                <input name="adminpassword" class="form-control" type="password" placeholder="Password" id=adminpassword" required>
              </div><br> 
             <div class="d-grid">
                  <button class="btn btn-primary btn-info btn-md" type="submit" >create</button>
                  
             </div><br> 
            <div class="modal-footer justify-content-center">
                
            </div>
          </div>
        </div>
      </div>
      </div>
    </form>
        <script src="https://www.paypal.com/sdk/js?client-id=ASyjQ7JZyGsLCkiFplxIboO7IfzuCLbNtQcySyFKSei1UjB8R7Umsjd_Mc-3qWcSILEcMaE4Y_TlhO5p"></script>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/20c5629a29.js" crossorigin="anonymous"></script>
    <!-- jQuery library -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js"></script>
    <script>
    paypal.Buttons({
        createOrder: function (data, actions) {
             
            return fetch('/PaymentServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body : 'action=create_order' 

// Rest of your code to do something with the 'body' variable...

            })
                .then(function (response) {
                    return response.text();
                })
                .then(function (orderID) {
                    return orderID;
                });
        },
        onApprove: function (data, actions) {
            return fetch('/PaymentServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: 'action=capture_order&orderID=' + data.orderID
            })
                .then(function (response) {
                    return response.text();
                })
                .then(function (message) {
                    if (message === "success") {
                        // Show Bootstrap modal
                       
                       
                window.location.href = "PaymentSuccess.jsp";
            
                        // Prepare data to be sent in the request body
                       
                    } else {
                        $('#failureModal').modal('show');
                        
                    }
                });
        }
    }).render('#paypal-button-container');
    function checkEmail()
    {
        var email = document.getElementById('exampleInput').value;
        var password = document.getElementById('exampleInput1').value;
        const xhr =new XMLHttpRequest();
    xhr.open('POST','AdminEmailCheck',true);
    xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4 && xhr.status===200)
        {
            document.querySelector(".feedback-section").style.display = "block";
            console.log(xhr.responseText);
            document.cookie = "tempemail=" + encodeURIComponent(email);
            
        }
        else if (xhr.readyState===4 && xhr.status===400)
        {
            window.alert("Email or password incorrect or you may already have this subscription");
        }
    };
    const params = 'email=' + encodeURIComponent(email) + '&password=' + encodeURIComponent(password);
    xhr.send(params);
    
    }
    function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
}
function getEndDateForOneMonth() {
  const currentDate = new Date();
  const endDate = new Date(currentDate);
  
  // Add one month to the current date to get the end date
  endDate.setMonth(endDate.getMonth() + 1);
  
  // Convert the end date to the desired format (e.g., "yyyy-MM-dd")
  const endDateString = endDate.toISOString().split('T')[0];
  
  return endDateString;
}

// Function to get the start date as the current date
function getCurrentDate() {
  const currentDate = new Date();
  
  // Convert the current date to the desired format (e.g., "yyyy-MM-dd")
  const startDateString = currentDate.toISOString().split('T')[0];
  
  return startDateString;
}
    
</script>

    </body>
</html>
