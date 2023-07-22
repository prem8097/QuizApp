<%-- 
    Document   : showanswers
    Created on : 09-Dec-2022, 12:18:52 pm
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
  <link rel="stylesheet" href="css/showanswers.css">
        <title>Answers</title>
    </head>
    <body>
        <nav id="quiznav" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="cnscore.jsp">
                    <i class="fas fa-chevron-circle-left"></i>
                </a>
                <button type="button" class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon" ></span>
              </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end" >
                    <ul class="navbar-nav " >
                        <li id="timer">   
                        </li>
                        <li class="nav-item" id="user">
                            <a href="#" class="nav-link">
                                 <i class="fas fa-user-alt"></i>
                            <%
                             out.println(session.getAttribute("user"));
                            %>
                            </a>
                        </li>  
                    </ul>
                </div>
              </div>
    </nav>
        <div class="question-form">
           <form id="quesform" method="post" action="questions" >
            <div class="question">
                <h5>1. When the mail server sends mail to other mail servers it becomes </h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q1" value="a"  id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 SMTP server
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q1" value="b" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 SMTP client
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q1" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                Peer
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q1" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             Master
             </label>
            </div>
                <p>
  
  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
      View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
</p>
<div class="collapse" id="collapseExample1">
  <div class="card card-body">
      <b>Answer: b</b><br>
<b>Explanation: </b>SMTP clients are the entities that send mails to other mail servers. The SMTP servers cannot send independent mails to other SMTP servers as an SMTP server. There are no masters or peers in SMTP as it is based on the client-server architecture.
  </div>
</div>
            </div>
                <div class="question">
                    <h5>2. If you have to send multimedia data over SMTP it has to be encoded into</h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q2" value="a" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Binary
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q2" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Signal
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q2" value="c" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 ASCII
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q2" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             Hash
             </label>
            </div>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
</p>
<div class="collapse" id="collapseExample2">
  <div class="card card-body">
      <b>Answer: c</b><br>
      <b>Explanation:</b> Since only 7-bit ASCII codes are transmitted through SMTP, it is mandatory to convert binary multimedia data to 7-bit ASCII before it is sent using SMTP.
  </div>
</div>
            </div>
            <div class="question">
                <h5>3. Expansion of SMTP is</h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q3" value="a" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 Simple Mail Transfer Protocol
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q3" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Simple Message Transfer Protocol
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q3" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Simple Mail Transmission Protocol
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q3" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             Simple Message Transmission Protocol
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
    View Explanation
  </button>
                <div class="collapse" id="collapseExample3">
  <div class="card card-body">
      <b> Answer: a</b><br>
<b>Explanation: </b>SMTP or Simple Mail Transfer Protocol is an application layer protocol used to transport e-mails over the Internet. Only 7-bit ASCII codes can be sent using SMTP.
  </div>
</div>
            </div>
            <div class="question">
                <h5>4. Choose the statement which is wrong incase of SMTP?</h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q4" value="a" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 It requires message to be in 7bit ASCII format
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q4" value="b" id="flexRadioDefault1"checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 It is a pull protocol             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q4" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 It transfers files from one mail server to another mail server
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q4" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             SMTP is responsible for the transmission of the mail through the internet
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample4" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
                <div class="collapse" id="collapseExample4">
  <div class="card card-body">
      <b>Answer: b</b><br>
<b>Explanation: </b>In SMTP, the sending mail server pushes the mail to receiving mail server hence it is push protocol. In a pull protocol such as HTTP, the receiver pulls the resource from the sending server.
  </div>
</div>
            </div>
            <div class="question">
                <h5>5. Internet mail places each object in </h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q5" value="a" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                  Separate messages for each object
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q5" value="b" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 One message
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q5" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Varies with number of objects
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q5" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
              Multiple messages for each object
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample5" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
                <div class="collapse" id="collapseExample5">
  <div class="card card-body">
      <b> Answer: b</b><br>
<b>Explanation: </b>It places all objects into one message as it wouldn’t be efficient enough if there are different messages for each object. The objects include the text and all the multimedia to be sent.
  </div>
</div>
            </div>
               <div class="question">
             <h5>6.Typically the TCP port used by SMTP is  </h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q6" value="a"  id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 25
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q6" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 35
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q6" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                15
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q6" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             50
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample6" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
             <div class="collapse" id="collapseExample6">
  <div class="card card-body">
      <b>Answer: a</b><br>
      <b>Explanation:</b> The ports 15, 35 and 50 are all UDP ports and SMTP only uses TCP port 25 for reliability.
  </div>
</div>
            </div>
                <div class="question">
                    <h5>7. A session may include</h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q7" value="a" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                  Zero or more SMTP transactions
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q7" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Exactly one SMTP transactions
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q7" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Always more than one SMTP transactions
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q7" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             Number of SMTP transactions cant be determined
             </label>
            </div>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample7" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
                    <div class="collapse" id="collapseExample7">
  <div class="card card-body">
      <b>Answer: a</b><br>
<b>Explanation: </b>An SMTP session consists of SMTP transactions only even if no transactions have been performed. But no transactions in the session might mean that the session is inactive or is just initiated.
  </div>
</div>
            </div>
             <div class="question">
                <h5>8.Which of the following is an example of user agents for e-mail?</h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q8" value="a" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
                 Microsoft Outlook
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q8" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Facebook
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q8" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                Google
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q8" value="d" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
             Tumblr
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample8" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
                <div class="collapse" id="collapseExample8">
  <div class="card card-body">
      <b> Answer: a</b><br>
      <b>Explanation:</b> Among the options, only Microsoft Outlook is an e-mail agent. Google is a search engine and Facebook, and Tumblr are social networking platforms. Gmail and Alpine are some other examples of e-mail agent.
  </div>
</div>
            </div>
            <div class="question">
                <h5>9.  When the sender and the receiver of an email are on different systems, we need only</h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q9" value="a" id="flexRadioDefault1" >
             <label class="form-check-label" for="flexRadioDefault1">
                 One MTA
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q9" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Two UAs         </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q9" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                Two UAs and one MTA
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q9" value="d" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
              Two UAs and two MTAs
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample9" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
                <div class="collapse" id="collapseExample9">
  <div class="card card-body">
      <b>Answer: d</b><br>
      <b>Explanation:</b> The sender’s User Agent (UA) submits the message to a Message Transfer Agent (MTA). Then the MTA sends the message to another MTA i.e. a mail relay. Then the receiver receives the message from the mail relay whenever it is available.
  </div>
</div>
            </div>
            <div class="question">
                <h5>10.User agent does not support this </h5>
            <div class="form-check">
            <input class="form-check-input" type="radio" name="q10" value="a" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                  Composing messages
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q10" value="b" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Reading messages
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q10" value="c" id="flexRadioDefault1">
             <label class="form-check-label" for="flexRadioDefault1">
                 Replying messages
             </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="q10" value="d" id="flexRadioDefault1" checked>
             <label class="form-check-label" for="flexRadioDefault1">
              Routing messages
             </label>
            </div>
                <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample10" aria-expanded="false" aria-controls="collapseExample">
    View Explanation <i class="fas fa-chevron-circle-down"></i>
  </button>
                <div class="collapse" id="collapseExample10">
  <div class="card card-body">
      <b>Answer: d</b><br>
<b>Explanation: </b>The user agent is basically a software program that allows the user to send, and receive e-mail messages. Routing of the message is done by the Message Transfer Agent.
  </div>
</div>
            </div>  
                </div>
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
                    
                   <button class="btn-primary" name="Yes" value="Yes" type="submit">Yes</button>
                    
                    <button class="btn-primary btn-close" data-dismiss="modal" name="No" value="No">No</button>
             </div>
              </div>
          </div>
      </div>      
                
        </form>             
        </div>
    
    </body>
</html>
