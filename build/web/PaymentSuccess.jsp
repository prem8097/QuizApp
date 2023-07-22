<%-- 
    Document   : PaymentSuccess
    Created on : 04-Jul-2023, 11:45:30 am
    Author     : premsai devavarapu
--%>

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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Success</title>
  <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
  <link href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="css/QuizIT.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
  padding: 10px 10px;
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
.modal-body
{
    font-family: "Font Awesome 5 Free";
}
.bts
{
    background-color:#06BBCC ;
    border:none;
    padding: 10px 10px;
    border-radius: 4px;
    transition: background-color 0.2s ease;
}
.bts:hover {
  background-color: #059aa6;
}
    </style>
</head>
    
    <body>
      
                            
                            <div class="card-container">
                                <div class="card">
  <div class="success-message">
    <h1>Payment Successful</h1>
    <p>You are now a premium member</p>
    <img src="img/782-check-mark-success.gif" alt="success"/>
  </div>
  <div class="feedback-section">
    <h3>Host your Quiz with us!</h3>

    <a class="btn btn-primary bts" href="index.html" role="button">Go Home <i class='fas fa-chevron-right'></i></a>
  </div>
</div>
  
                            </div>    
  
 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-06Sv1uW6FD59WqT5fEnyS9Mv6P3ZwwQ9CEQV4Ez3VUOJn+uqRf3N2p6fp90a/nj8" crossorigin="anonymous"></script>
    
    </body>
</html>

