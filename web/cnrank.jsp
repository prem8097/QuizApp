<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Rank</title>
<link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'> 
    <link rel="stylesheet" href="css/cnrank.css">
    <link rel="stylesheet" href="css/nav.css">
    <style>
        
    </style>
</head>
<body>
<%
    String quizCode = request.getParameter("quizCode");
    String examName = "";

    // Retrieve exam name from the "quizzes" table based on quizCode
    try {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
        Statement statement = connection.createStatement();
        String query = "SELECT quiz_name FROM quizzes WHERE quiz_code = '" + quizCode + "'";
        ResultSet resultSet = statement.executeQuery(query);

        if (resultSet.next()) {
            examName = resultSet.getString("quiz_name");
        }

        resultSet.close();
        statement.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/quizit"
     user="root"  password="prem8097"/>
 
<c:catch var="sqlException">
    <sql:query dataSource="${snapshot}" var="result">
        SELECT * FROM <%= quizCode %>_Result ORDER BY score DESC;
    </sql:query>
</c:catch>
        <c:if test="${not empty sqlException}">
    <!-- Exception occurred, handle the error -->
    
    <!-- You can also log the exception or perform any other necessary actions -->
</c:if>
 <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light">
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
            if (( cookie.getName().equals("email"))) {
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
                String query = "SELECT name FROM admin_details where email = ?";
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
<div class="modal fade" id="alert" role="dialog" >
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
                    <a href="index.html">
                    <button class="btn-primary lgout" name="Yes" value="Yes">Yes</button>
                    </a>
                    <button class="btn-primary btn-close lgout" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>
          </div>
      </div>
<%
    // ... Existing code ...

    // Check if the table exists in the database
    boolean tableExists = false;
    try {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/quizit", "root", "prem8097");
        DatabaseMetaData metaData = connection.getMetaData();
        ResultSet tables = metaData.getTables(null, null, quizCode + "_Result", null);
        if (tables.next()) {
            tableExists = true;
        }
        tables.close();
        connection.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // Fetch and display the results if the table exists
    if (tableExists) {
        %>
        <table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Rank</th>
            <th scope="col">Name</th>
            <th scope="col">Exam</th>
            <th scope="col">Marks</th>
        </tr>
    </thead>
    <c:if test="${not empty result.rows}">
        <c:forEach varStatus="loopCounter" var="row" items="${result.rows}">
            <c:set var="isCurrentUser" value="${row.username == user}" />
            <c:if test="${isCurrentUser}">
                <tr style="background-color: #06BBCC;">
            </c:if>
            <c:if test="${!isCurrentUser}">
                <tr>
            </c:if>
            <td><c:out value="${loopCounter.count}" /></td>
            <td><c:out value="${row.username}" /></td>
            <td><c:out value="<%=examName%>" /></td>
            <td><c:out value="${row.score}" /></td>
            </tr>
        </c:forEach>
    </c:if>
</table>

        <c:if test="${empty result.rows}">
    <h3>No one attempted the quiz</h3>
</c:if>
        <%
    } else {
        // Table doesn't exist, display an appropriate message
        %>
        <h3>No one attempted the Quiz</h3>
        <%
    }
%>


</body>
</html>
