<%-- 
    Document   : userexam
    Created on : 17-Jun-2023, 11:36:08 am
    Author     : premsai devavarapu
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
        <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    
    <link rel="stylesheet" href="css/nav.css" type="text/css"/>
    
    
    
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    
    <script src="js/cnt.js"></script>
        <title>Exam</title>
        <style>
    #fullscreen-instructions {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 20px;
        font-size: 18px;
        text-align: center;
        z-index: 9999;
    }
    #timer1 {
    font-size: 40px;
    color:green;
  }

  .red-timer {
    color: red;
  }
  @media (max-width: 767px) {
    .navbar-collapse {
      display: flex !important;
      justify-content: flex-end;
    }
    .navbar-nav {
      flex-direction: row;
     
    }
    .nav-item {
      margin-left: 0px;
      
    }
  }
  .modal-backdrop {
      /* You can adjust the color and opacity as per your preference */
      background-color: rgba(0, 0, 0, 0.9) !important;
    }
    .lgout
    {
        
        border:none;
        height:38px;
        width:60px;
        border-radius:8px;
    }
</style>
    </head>
    <body>
       <div id="fullscreenModal" class="modal" tabindex="-1" role="dialog" aria-labelledby="fullscreenModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="fullscreenModalLabel">Fullscreen Confirmation</h5>
          
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Enter into full screen</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary lgout" onclick="requestFullScreen()">Yes</button>
          
        </div>
      </div>
    </div>
  </div>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light sticky-top p-2">
            <div class="container-fluid">
                <a class="navbar-brand" href="exams.jsp">
                    <img src="img/quizhost-high-resolution-logo-color-on-transparent-background.png" alt="Logo">
                </a>
                <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon" ></span>
              </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end" >
                    <ul class="navbar-nav " >
                        <li id="quiztimer">  
                            <span id="timer1"></span>
                        </li>
                        <li class="nav-item" id="user">
                            <a href="#" class="nav-link">
                                 <i class="fas fa-user-alt"></i>
                            <%
                             out.println(session.getAttribute("email"));
                            %>
                            </a>
                        </li>  
                    </ul>
                </div>
              </div>
    </nav>
    <%
   String quizCode = (String) session.getAttribute("code");
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   
      String dynamichtml = "";
      int duration=0;
      //String code="QUIZIT74Gg";

   try {
      // Load the JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      // Create a connection to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");

      // Create a statement
      stmt = conn.createStatement();

      // Execute the query to retrieve data from the table
      rs = stmt.executeQuery("SELECT dynamic_html,duration FROM quizzes where quiz_code = '" + quizCode + "'");

      // Declare variables to store the data
      

      // Process the retrieved data
      while (rs.next()) {
         // Access the columns of each row
         
         
         dynamichtml = rs.getString("dynamic_html");
         duration=rs.getInt("duration");
         //code=rs.getString("quiz_code");

         // Perform further processing or display the data
         // ...
      }

      // Use the variables in the HTML content
      rs.close();
      stmt.close();
      conn.close();
   } catch (Exception e) {
      e.printStackTrace();
   }
%>

<div class="exam">
    <form id="quesform">
    <%= dynamichtml %>
    <div class="modal fade" id="alert1" role="dialog" >
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">Hey!!!</h5>
                    <button id="modalcls" type="button" class="btn-close" aria-label="Close" data-dismiss="modal"><i class="fa fa-close"></i></button>
                  </div>
                  <div class="modal-body">
                    Do you really want to submit?
                  </div>
                  <div class="modal-footer justify-content-center">
                    <button class="btn-primary lgout" name="Yes" value="Yes" type="submit" onclick="submitExam('<%= quizCode %>')">Yes</button>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
                  </div>
                </div>
              </div>
            </div>      
            <div class="sub">
              <a href="#" data-toggle="modal" data-target="#alert1">
                <button   id="btnsubmit" name="submit_test" value="submit_test" type="submit">Submit test</button>
              </a>
              
            </div>  
    </form>
</div>

  <script type="text/javascript">
      
     var isInFullScreen = false;

    // Disable right-click context menu
    document.addEventListener('contextmenu', function (event) {
        event.preventDefault();
    });

    // Disable keyboard shortcuts
    document.onkeydown = function (event) {
        event = event || window.event;
        var key = event.key || event.keyCode;

        // Disable Ctrl+Shift+I (Developer Tools)
        if (event.ctrlKey && event.shiftKey && (key === 'I' || key === 'i'||key === 'J' || key === 's' ) ) {
            event.preventDefault();
        }

        // Disable Escape key if in fullscreen mode
        if (key === 'Escape' && isInFullScreen) {
            event.preventDefault();
        }
    };

    // Disable opening new tabs or windows
    window.open = function () {
        return null;
    };

    // Request fullscreen when the button is clicked
    function requestFullScreen() {
        var element = document.documentElement;
        if (element.requestFullscreen) {
            element.requestFullscreen();
        } else if (element.mozRequestFullScreen) {
            element.mozRequestFullScreen();
        } else if (element.webkitRequestFullscreen) {
            element.webkitRequestFullscreen();
        } else if (element.msRequestFullscreen) {
            element.msRequestFullscreen();
        }

        isInFullScreen = true;
        $('#fullscreenModal').modal('hide');

        // Add an event listener for fullscreen change
        document.addEventListener("fullscreenchange", handleFullScreenChange);
        document.addEventListener("webkitfullscreenchange", handleFullScreenChange);
        document.addEventListener("mozfullscreenchange", handleFullScreenChange);
        document.addEventListener("MSFullscreenChange", handleFullScreenChange);
    }

    // Function to handle fullscreen change event
    function handleFullScreenChange() {
        if (document.fullscreenElement || document.webkitFullscreenElement || document.mozFullScreenElement || document.msFullscreenElement) {
            // Entered fullscreen mode
            document.onkeydown = function (event) {
                event = event || window.event;
                var key = event.key || event.keyCode;
                if (key === 'Escape') {
                    event.preventDefault();
                }
            };
        } else {
            // Exited fullscreen mode
            document.onkeydown = null;

            // Show the fullscreen confirmation modal again
            $('#fullscreenModal').modal('show');
            isInFullScreen = false;
        }
    }


    // Exit fullscreen when the submit button is clicked
    

    // Show the fullscreen confirmation modal on page load
    window.onload = function () {
      $('#fullscreenModal').modal('show');
    };
     // Retrieve the duration value from the JSP variable
  var duration = <%= duration %>;
  duration=duration*60;
  // Calculate the end time based on the current time and duration
  var endTime = new Date().getTime() + duration * 1000;

  // Update the timer every second
  var timerInterval = setInterval(updateTimer, 1000);

  function updateTimer() {
    // Get the current time
    var currentTime = new Date().getTime();

    // Calculate the remaining time in seconds
    var remainingTime = Math.max(0, Math.floor((endTime - currentTime) / 1000));

    // Calculate the minutes and seconds
    var minutes = Math.floor(remainingTime / 60);
    var seconds = remainingTime % 60;

    // Format the minutes and seconds as two digits
    var formattedTime = ('0' + minutes).slice(-2) + ':' + ('0' + seconds).slice(-2);

    // Update the timer element
    document.getElementById('timer1').textContent = formattedTime;

    // Check if the time has expired
    if (remainingTime === 0) {
      clearInterval(timerInterval);

      // Perform any necessary actions when the time expires
      // Example: submit the exam or show a notification
      // ...
      document.getElementById('quesform').submit();
      submitExam('<%= quizCode %>');
      onExamComplete();
    }else if (remainingTime <= 60) {
    // If less than or equal to 60 seconds remaining, apply the red color class
    document.getElementById('timer1').style.color='red';
  }
    
  }
  function submitExam(quizCode) {
  const questionsContainer = document.querySelector('.question-form');
  const questionDivs = questionsContainer.getElementsByClassName('question');
  const selectedOptions = [];
if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
  } else if (document.msExitFullscreen) {
    document.msExitFullscreen();
  }

  isInFullScreen = false;
  // Get the selected options for each question
  for (let i = 0; i < questionDivs.length; i++) {
    const questionDiv = questionDivs[i];
    const questionNumber = i + 1;
    const selectedOption = questionDiv.querySelector('input[type="radio"]:checked');
    
    if (selectedOption) {
      selectedOptions.push({
        questionNumber,
        selectedOption: selectedOption.value-1
      });
    }
  }

  console.log('Selected Options:', selectedOptions);
                const xhr = new XMLHttpRequest();
                xhr.open('POST', 'ExamResult', true);
                xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log(xhr.responseText);
                        var response = JSON.parse(xhr.responseText);
                        var score = response.score;

                        //window.alert( score);
                        // Add any further processing or redirection if needed
                        window.location.href = 'examComplete.jsp';
                        
                    }
                };

                const params = 'quizCode=' + encodeURIComponent(quizCode) +
                               '&selectedOptions=' + encodeURIComponent(JSON.stringify(selectedOptions));

                xhr.send(params);
            }
   // Show the alert1 modal before the user leaves the page
  

    // Function to navigate forward again when the user tries to go back
    

    // Disable form submission on reload or leave
    
    
       
         function clearRadios(questionNumber) {
  const radioInputs = document.getElementsByName('q' + questionNumber);
  radioInputs.forEach((radio) => {
    radio.checked = false;
  });
}

  </script>
  
 

</body>
</html>
