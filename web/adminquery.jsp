<%-- 
    Document   : adminquery
    Created on : 09-Dec-2022, 5:02:30 pm
    Author     : premsai devavarapu
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>       
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'> 
  <link rel="stylesheet" href="css/adminquery.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bglight">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                            <i class="fas fa-chevron-circle-left" id="hov"></i>
                </a>
                <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon" ></span>  
              </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end" >
                    <ul class="navbar-nav " >
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                        <i class="fa fa-question-circle" aria-hidden="true"></i>    Queries
                          </a>
                        </li>
                        <li class="nav-item" id="user">
                            <a href="#" class="nav-link">
                                 <i class="fas fa-user-alt"></i>
                            <%
                             out.println(session.getAttribute("name"));
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
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/quizit"
     user="root"  password="prem8097"/>
        <sql:query dataSource="${snapshot}" var="result">
SELECT * from query ;
</sql:query>
<table class="table table-striped">
  <thead>
    <tr>
       <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Query</th>
      <th scope="col">Answer</th>
    </tr>
  </thead>

<c:forEach varStatus="loopCounter" var="row" items="${result.rows}">
    
        <tr>
            <c:set var="i" value="${loopCounter.count}" scope="session" />
            <td><c:out value="${row.name}"/></td>
        <c:set var="name+i" value="${row.name}" scope="session" />
            <td><c:out value="${row.email}"/></td>
                <c:set var="email+i" value="${row.email}" scope="session" />
                <td><c:out value="${row.query}"/></td>
                <c:set var="query+i" value="${row.query}" scope="session" />
                
                
                
                <td><a href="adminanswer.jsp"><button id="send" type="submit" class="btn btn-primary">Send</button></a></td>
        </tr>
    
</c:forEach> 
         
</table>   
    </body>
</html>
