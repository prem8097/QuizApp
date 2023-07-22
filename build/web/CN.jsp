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
    <title>Computer networks</title>
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
            <h5>1. The location of a resource on the internet is given by its?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q1-a">
                <label class="custom-control-label" for="q1-a">Protocol</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q1-b">
                <label class="custom-control-label" for="q1-b">URL</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q1-c">
                <label class="custom-control-label" for="q1-c">E-mail address</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q1-d">
                <label class="custom-control-label" for="q1-d">ICQ</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample1">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>A URL (Uniform Resource Locator) is a database connection that describes the database's location on a computer network and the retrieval process. A URL is a different form of URI (Uniform Resource Identifier) although the two words are used interchangeably by many people.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>2.A proxy server is used as the computer?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q2-a">
                <label class="custom-control-label" for="q2-a">with external access</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q2-b">
                <label class="custom-control-label" for="q2-b">acting as a backup</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q2-c">
                <label class="custom-control-label" for="q2-c">performing file handling</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q2-d">
                <label class="custom-control-label" for="q2-d">accessing user permissions</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample2">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>A proxy server is a computer that acts as a gateway between a user's computer and the Internet. The proxy server is also called application level gateway. By this the client computer can establish indirect network connection to another network.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>3.Which software prevents the external access to a system?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q3-a">
                <label class="custom-control-label" for="q3-a">Firewall</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q3-b">
                <label class="custom-control-label" for="q3-b">Gateway</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q3-c">
                <label class="custom-control-label" for="q3-c">Router
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3d" value="d" id="q3-d">
                <label class="custom-control-label" for="q3-d">Virus checker</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample3">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>A firewall is a network securing software that prevents unauthorized users and dangerous elements from accessing the network. Software firewall acts as a filter for our network which prevents harmful information.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>4.Which of the following statements could be valid with respect to the ICMP (Internet Control Message Protocol)?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q4-a">
                <label class="custom-control-label" for="q4-a">It reports all errors which occur during transmission.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q4-b">
                <label class="custom-control-label" for="q4-b"> A redirect message is used when a router notices that a packet seems to have been routed wrongly.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q4-c">
                <label class="custom-control-label" for="q4-c">It informs routers when an incorrect path has been taken.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q4-d">
                <label class="custom-control-label" for="q4-d">The "destination unreachable" type message is used when a router cannot locate the destination.</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample4">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>A redirect message is used when a router notices that a packet seems to have been routed wrongly.

                </div>
            </div>
        </div>
        <div class="question">
            <h5>5.The IP network 192.168.50.0 is to be divided into 10 equal sized subnets. Which of the following subnet masks can be used for the above requirement?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q5-a">
                <label class="custom-control-label" for="q5-a">255.243.240</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q5-b">
                <label class="custom-control-label" for="q5-b">255.255.0.0</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q5-c">
                <label class="custom-control-label" for="q5-c">255.255.0</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q5-d">
                <label class="custom-control-label" for="q5-d">255.255.255
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
                    <b>Explanation: </b>This address belongs to class C, so 8 bits are reserved for the host ID. 24 bits are reserved for network ID.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>6.Which of the following is true with regard to the ping command?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q6-a">
                <label class="custom-control-label" for="q6-a">Ping stands for Packet Internet Generator.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q6-b">
                <label class="custom-control-label" for="q6-b">The ping command checks the port level connectivity between source destinations end points.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q6-c">
                <label class="custom-control-label" for="q6-c">The ping command activates the RARP protocol of the IP layer.</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q6-d">
                <label class="custom-control-label" for="q6-d">Ping summarizes the packet loss and round-trip delay between two IP end points.</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample6" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample6">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>Ping summarizes the packet loss and round-trip delay between two IP end points.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>7.The correct order of corresponding OSI layers for having functionalities of routing and reconciling machine representation differences with shared access resolution and ASCII test protocol is?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q7-a">
                <label class="custom-control-label" for="q7-a">Network, Physical, Transport, Data link</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q7-b">
                <label class="custom-control-label" for="q7-b">Network, Physical, Data link, Application</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q7-c">
                <label class="custom-control-label" for="q7-c">Network, Presentation, Physical, Transport</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q7-d">
                <label class="custom-control-label" for="q7-d">Network, Presentation, Data link, Application</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample7" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample7">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>Network, Presentation, Data link, Application
                </div>
            </div>
        </div>
        <div class="question">
            <h5>8. Keyboard and Monitor is a good example of</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q8-a">
                <label class="custom-control-label" for="q8-a">Half duplex</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q8-b">
                <label class="custom-control-label" for="q8-b">Simplex</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q8-c">
                <label class="custom-control-label" for="q8-c"> Full duplex</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q8-d">
                <label class="custom-control-label" for="q8-d">a and b</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample8" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample8">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>Simplex is a unidirectional communication.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>9.Which of the following is the broadcast address for a Class B network ID using the default subnetmask?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q9-a">
                <label class="custom-control-label" for="q9-a">172.16.10.255</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q9-b">
                <label class="custom-control-label" for="q9-b">255.255.255.255</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q9-c">
                <label class="custom-control-label" for="q9-c"> 172.16.255.255</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q9-d">
                <label class="custom-control-label" for="q9-d">172.255.255.255</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample9" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample9">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>In this case, the class B network ID is 172.16.0.0. We know that the default mask of a class B network is 255.255.0.0. If we OR any address in a network with the complement of the default mask (0.0.255.255), we get the broadcast address of the network. In this case, the result of OR would be 172.16.255.255.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>10._________ implies that all subnets obtained from the same subnet mask.</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10a" value="a" id="q10-a">
                <label class="custom-control-label" for="q10-a">Static subnetting</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10b" value="b" id="q10-b">
                <label class="custom-control-label" for="q10-b"> Dynamic subnetting</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10c" value="c" id="q10-c">
                <label class="custom-control-label" for="q10-c">Variable length subnetting</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q10d" value="d" id="q10-d">
                <label class="custom-control-label" for="q10-d">Dynamic length subnetting</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample10">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>Static subnetting is used when the requirement is of same number of hosts in each subnet for the institution. The same subnet mask can be used to find the subnet id of each subnet. It is usually used to divide large networks into smaller parts.
                </div>
            </div>
        </div>
        
        
        
         <div class="question">
             <h5>11. NetWare IPX addressing uses a network number and a node number. Which statement is not true?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1a" value="a" id="q11-a">
                <label class="custom-control-label" for="q11-a">The network address is administratively assigned and can be up to 16 hexadecimal digits long</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1b" value="b" id="q11-b">
                <label class="custom-control-label" for="q11-b">The node address is always administratively assigned</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1c" value="c" id="q11-c">
                <label class="custom-control-label" for="q11-c">The node address is usually the MAC address</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q1d" value="d" id="q11-d">
                <label class="custom-control-label" for="q11-d">If the MAC address is used as the node address, then IPX eliminates the use of ARP</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample11" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample11">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>The network address can be up to 16 hexadecimal digits in length. The node number is 12 hexadecimal digits. The node address is usually the MAC address. An example IPX address is 4a1d.0000.0c56.de33. The network part is 4a1d. The node part is 0000.0c56.de33. The network number is assigned by the system administrator of the Novell network and the MAC address/node address is not assigned by the administrator.
                </div>
            </div>
        </div>
        <!-- Add other questions here -->
        <!-- ... -->
        <div class="question">
            <h5>12. Expansion of SMTP is ________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q12-a">
                <label class="custom-control-label" for="q12-a">Simple Mail Transfer Protocol</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q12-b">
                <label class="custom-control-label" for="q12-b">Simple Message Transfer Protocol</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q12-c">
                <label class="custom-control-label" for="q12-c">Simple Mail Transmission Protocol</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q12-d">
                <label class="custom-control-label" for="q12-d">Simple Message Transmission Protocol</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample12" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample12">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>SMTP or Simple Mail Transfer Protocol is an application layer protocol used to transport e-mails over the Internet. Only 7-bit ASCII codes can be sent using SMTP.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>13.The underlying Transport layer protocol used by SMTP is ________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3a" value="a" id="q13-a">
                <label class="custom-control-label" for="q13-a">TCP</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3b" value="b" id="q13-b">
                <label class="custom-control-label" for="q13-b">UDP</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q3c" value="c" id="q13-c">
                <label class="custom-control-label" for="q13-c">Either TCP or UDP</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q13d" value="d" id="q13-d">
                <label class="custom-control-label" for="q13-d">IMAP</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample13" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample13">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>TCP is a reliable protocol, and Reliability is a mandatory requirement in e-mail transmission using SMTP.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>14.Choose the statement which is wrong incase of SMTP?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4a" value="a" id="q14-a">
                <label class="custom-control-label" for="q14-a"> It requires message to be in 7bit ASCII format</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4b" value="b" id="q14-b">
                <label class="custom-control-label" for="q14-b">It is a pull protocol</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4c" value="c" id="q14-c">
                <label class="custom-control-label" for="q14-c"> It transfers files from one mail server to another mail server</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q4d" value="d" id="q14-d">
                <label class="custom-control-label" for="q14-d">SMTP is responsible for the transmission of the mail through the internet</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample14" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample14">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b>n SMTP, the sending mail server pushes the mail to receiving mail server hence it is push protocol. In a pull protocol such as HTTP, the receiver pulls the resource from the sending server.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>15.DNS database contains _______</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5a" value="a" id="q15-a">
                <label class="custom-control-label" for="q15-a">name server records</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5b" value="b" id="q15-b">
                <label class="custom-control-label" for="q15-b">hostname-to-address records</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5c" value="c" id="q15-c">
                <label class="custom-control-label" for="q15-c">Both A and B</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q5d" value="d" id="q15-d">
                <label class="custom-control-label" for="q15-d">None of the above</label>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample5">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>Domain Name system not only deals with mapping IP addresses with the hostname but also deals with exchange of information in the server.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>16.The right to use a domain name is delegated by domain name registers which are accredited by _______</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6a" value="a" id="q16-a">
                <label class="custom-control-label" for="q16-a">internet architecture board</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6b" value="b" id="q16-b">
                <label class="custom-control-label" for="q16-b"> internet society</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6c" value="c" id="q16-c">
                <label class="custom-control-label" for="q16-c">internet research task force</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q6d" value="d" id="q16-d">
                <label class="custom-control-label" for="q16-d">internet corporation for assigned names and numbers</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample16" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample16">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>The ICANN (Internet Corporation for Assigned Names and Numbers) deals with IP address space allocation, protocol identifier assignment, generic and country code Top Level domain name system management (gTLD and ccTLD).
                </div>
            </div>
        </div>
        <div class="question">
            <h5>17.The domain name system is maintained by _______</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7a" value="a" id="q17-a">
                <label class="custom-control-label" for="q17-a">a single server</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7b" value="b" id="q17-b">
                <label class="custom-control-label" for="q17-b">a single computer</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7c" value="c" id="q17-c">
                <label class="custom-control-label" for="q17-c">Both A and B</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q7d" value="d" id="q17-d">
                <label class="custom-control-label" for="q17-d">distributed database system</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample17" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample17">
                <div class="card card-body">
                    <b>Answer: D</b><br>
                    <b>Explanation: </b>A domain name system is maintained by a distributed database system. It is a collection of multiple, logically interrelated databases distributed over a computer network.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>18 Which multiple access technique is used by IEEE 802.11 standard for wireless LAN?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8a" value="a" id="q18-a">
                <label class="custom-control-label" for="q18-a">CDMA</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8b" value="b" id="q18-b">
                <label class="custom-control-label" for="q18-b">CSMA/CA</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8c" value="c" id="q18-c">
                <label class="custom-control-label" for="q18-c">ALOHA</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q8d" value="d" id="q18-d">
                <label class="custom-control-label" for="q18-d">CSMA/CD</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample18" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample18">
                <div class="card card-body">
                    <b>Answer: B</b><br>
                    <b>Explanation: </b> CSMA/CA stands for Carrier-sense multiple access/collision avoidance. It is a multiple access protocol used by IEEE 802.11 standard for wireless LAN. It’s based on the principle of collision avoidance by using different algorithms to avoid collisions between channels.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>19.Which one of the following event is not possible in wireless LAN?</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9a" value="a" id="q19-a">
                <label class="custom-control-label" for="q19-a">acknowledgement of data frames</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9b" value="b" id="q19-b">
                <label class="custom-control-label" for="q19-b">multi-mode data transmission</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9c" value="c" id="q19-c">
                <label class="custom-control-label" for="q19-c"> collision detection
</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q9d" value="d" id="q19-d">
                <label class="custom-control-label" for="q19-d">connection to wired networks</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample19" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample19">
                <div class="card card-body">
                    <b>Answer: C</b><br>
                    <b>Explanation: </b>Collision detection is not possible in wireless LAN with no extensions. Collision detection techniques for multiple access like CSMA/CD are used to detect collisions in Wireless LANs.
                </div>
            </div>
        </div>
        <div class="question">
            <h5>20. A proxy firewall filters at _________</h5>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2a" value="a" id="q20-a">
                <label class="custom-control-label" for="q20-a">Application layer</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2b" value="b" id="q20-b">
                <label class="custom-control-label" for="q20-b">Physical layer</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2c" value="c" id="q20-c">
                <label class="custom-control-label" for="q20-c">Data link layer</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" name="q2d" value="d" id="q20-d">
                <label class="custom-control-label" for="q20-d">Network layer</label>
            </div>
            <p>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample20" aria-expanded="false" aria-controls="collapseExample">
                    View Explanation <i class="fas fa-chevron-circle-down"></i>
                </button>
            </p>
            <div class="collapse" id="collapseExample20">
                <div class="card card-body">
                    <b>Answer: A</b><br>
                    <b>Explanation: </b>The application firewall is typically built to control all network traffic on any layer up to the application layer. It is able to control applications or services specifically, unlike a stateful network firewall, which is – without additional software – unable to control network traffic regarding a specific application. There are two primary categories of application firewalls, network-based application firewalls and host-based application firewalls.
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
                    <a href="logout">
                    <button class="btn-primary lgout" name="Yes" value="Yes">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>         
          </div>
      </div>
        
        
        
        
        
        
    </form>
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
