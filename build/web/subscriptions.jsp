<%-- 
    Document   : subscriptions
    Created on : 19-Jun-2023, 1:49:10 pm
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
        <title>Subscriptions</title>
        <link rel="stylesheet" href="css/pricing.css"/>
        <link rel="stylesheet" href="css/hospital.css"/>
        <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
    </head>
    <body>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-chevron-circle-left" id="hov"></i>
            </a>
            <button type="button" class="navbar-toggler"  data-toggle="collapse" data-target="#mynavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="mynavbar" class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="#" class="nav-link">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link" data-toggle="modal" data-target="#alert">
                            <i class="fas fa-sign-out-alt"></i>Home
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        <main>
                <section class="section-4">
            <div class="section-4-1">
                <div class="section-main">
                    <h1>Flexible Plans for Everyone</h1>
                    <p>Our plans are made for eveyone. Whether you are new to our platform, or have been on there for a long time, we have a plan that's right for you.</p>
                </div>
            </div>
            <div class="section-4-2">
                <div class="section-main">
                    <div class="pricing-body">
                        <div class="pricing-body-header">
                            <div class="pricing-checkbox">
                                <span for="pricing__monthly">Billed Monthly</span>
                                <div id="custom-checkbox">
                                    <div class="annual"></div>
                                </div>
                                <span for="pricing__anually">Billed Anually</span>
                            </div>
                        </div>
                        <div class="pricing-body-plans">
        
                            <div class="active" id="pricing__monthly__plan">
                                <div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h2 class="card-price">$1<span>/mo</span></h2>
                                            <p>Perfect plan if you're just starting out.</p>
                                        </div>
                                        <div class="card-body">
                                            <ul>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Maximum 10 Quizes</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>10 questions limit</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Auto correction</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>No autoproctoring</p></li>
                                            </ul>
                                        </div>
                                        <div class="card-footer">
                                            <a href="hostPay.html">Subscribe Now</a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h2 class="card-price">$4<span>/mo</span></h2>
                                            <p>Perfect plan if you want to host frequently .</p>
                                        </div>
                                        <div class="card-body">
                                            <ul>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Maximum 30 Quizes</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>No question limit</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Both Manuel & Auto correction</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>No autoproctoring </p></li>
                                            </ul>
                                        </div>
                                        <div class="card-footer">
                                            <a href="hostPay.html">Subscribe Now</a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h2 class="card-price">$8<span>/mo</span></h2>
                                            <p>Perfect plan if you're just starting out.</p>
                                        </div>
                                        <div class="card-body">
                                            <ul>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>No Quiz Limit</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>No Questions Limit</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Both Manuel & Auto correction</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Auto proctoring</p></li>
                                            </ul>
                                        </div>
                                        <div class="card-footer">
                                            <a href="hostPay.html">Subscribe Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="pricing__anually__plan">
                                <div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h2 class="card-price">$50</h2>
                                            <p>Perfect plan if you're just starting out.</p>
                                        </div>
                                        <div class="card-body">
                                            <ul>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Linkedin Integration</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Twitter Integration</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Real-time Analytics</p></li>
                                            </ul>
                                        </div>
                                        <div class="card-footer">
                                            <a href="hostPay.html">Subscribe Now</a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h2 class="card-price">$140</h2>
                                            <p>Perfect plan if you're a heavy user of social media.</p>
                                        </div>
                                        <div class="card-body">
                                            <ul>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Linkedin Integration</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Twitter Integration</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Instagram Integration</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Real-time Analytics</p></li>
                                            </ul>
                                        </div>
                                        <div class="card-footer">
                                            <a href="hostPay.html">Subscribe Now</a>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <div class="card-header">
                                            <h2 class="card-price">$70</h2>
                                            <p>Perfect plan if you're just starting out.</p>
                                        </div>
                                        <div class="card-body">
                                            <ul>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Linkedin Integration</p></li>
                                                <li><img src="https://rvs-product-pricing-page.vercel.app/assets/Checkmark.svg" alt=""><p>Twitter Integration</p></li>
                                            </ul>
                                        </div>
                                        <div class="card-footer">
                                            <a href="hostPay.html">Subscribe Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
        
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>  
        <footer>
                <div class="row">
                  <div class="col-md-4">
                    <h5><b>QuizIT</b></h5><br>
                    Trichy-Tanjore Road, Thirumalaisamudram,
                    Thanjavur, Tamil Nadu 613401
                    <br>
                    +91-6305332926
                    <br>
                     Enquiry : +91-6305332926<br><br><br>
                    <a href="#" class="icn"><i class="fa fa-youtube"></i></a>
                    <a href="#" class="icn"><i class="fa fa-twitter"></i></a>
                    <a href="#" class="icn"><i class="fa fa-facebook"></i></a>
                    <a href="#" class="icn"><i class="fa fa-instagram"></i></a>
                    <a href="#" class="icn"><i class="fa fa-linkedin"></i></a><br>
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
                <div class="row">
      
                </div>
                <div class="row">
      
                </div>
        
        
        </footer>

        <script src="js/pricing.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/20c5629a29.js" crossorigin="anonymous"></script>
    </body>
</html>
