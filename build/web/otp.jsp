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
  <title>Exam Submission Success</title>
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
    #timer
    {
        margin-top:50px;
    }
    </style>
</head>

    <body >
        
        
                            <div class="card-container">
                                <div class="card">
  <div class="success-message">
    <h1>Enter OTP</h1>
    
  </div>
  <div class="feedback-section">
      
          <div class="form-group">
    
    <input type="text" class="form-control" id="exampleInput" placeholder="Enter OTP">
  </div>
    
    
    <button class="submit-button" onclick="submitOTP()">Submit</button>
    <a href="#" onclick="resendOTP()">Resend otp?</a>
    <p id="timer" style="color:green">OTP Sent Successfully for the registered Email! Resend available in <span id="countdown">180</span> seconds</p>
  </div>
</div>
  
                            </div>                            
 

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-06Sv1uW6FD59WqT5fEnyS9Mv6P3ZwwQ9CEQV4Ez3VUOJn+uqRf3N2p6fp90a/nj8" crossorigin="anonymous"></script>
    
</script>
<script>
function submitOTP()
{
var otp = document.getElementById("exampleInput").value;
        
        
        const xhr =new XMLHttpRequest();
    xhr.open('POST','VerifyCode',true);
    xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4 && xhr.status===200)
        {
            window.location.href="success.html";
            
        }
        else if (xhr.readyState===4 && xhr.status===400)
        {
            window.alert("Incorrect otp");
        }
    };
        var params = "otp=" + encodeURIComponent(otp) ;
        xhr.send(params);
        }
        
  var resendAvailable = true; // Flag to check if resend OTP is available

  function resendOTP() {
    if (resendAvailable) {
      const xhr = new XMLHttpRequest();
      xhr.open('POST', 'ResendOTP', true);
      xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
          window.alert("OTP sent successfully");
          showResendSuccessMessage();
        } else if (xhr.readyState === 4 && xhr.status === 400) {
          window.alert("Failed to send OTP");
        }
      };

      xhr.send();
      resendAvailable = false; // Disable resend until the timer completes
      startTimer(180); // Start the timer for 180 seconds (3 minutes)
    }
  }

  function showResendSuccessMessage() {
    document.getElementById("timer").style.display = "block";
    setTimeout(function () {
      document.getElementById("timer").style.display = "none";
      resendAvailable = true; // Enable resend after the timer completes
    }, 180000); // Hide the message after 180000 milliseconds (3 minutes)
  }

  function startTimer(duration) {
    var timer = duration, minutes, seconds;
    var countdownElement = document.getElementById("countdown");

    var intervalId = setInterval(function () {
      minutes = parseInt(timer / 60, 10);
      seconds = parseInt(timer % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      countdownElement.textContent = minutes + ":" + seconds;

      if (--timer < 0) {
        clearInterval(intervalId);
        countdownElement.textContent = "00:00";
      }
    }, 1000);
  }

 window.onload = function() {
    // Start the timer when the page is loaded
    startTimer(180);
    window.alert(sessionStorage.getItem("phone"));
  };


        </script>
    </body>
</html>
