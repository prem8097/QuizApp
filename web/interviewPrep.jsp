<!DOCTYPE html>
<html>
<head>
  <title>Interview Preparation</title>
  <!-- Include any necessary CSS or JavaScript libraries here -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-JEQNLFM1XB"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-JEQNLFM1XB');
</script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <meta Content-Security-Policy-Report-Only: script-src https://accounts.google.com/gsi/client; frame-src https://accounts.google.com/gsi/; connect-src https://accounts.google.com/gsi/; />
  <link rel="apple-touch-icon" sizes="180x180" href="img/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="img/favicon-16x16.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
  <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">  
   <link rel="stylesheet" href="css/nav.css"/>
  <style>
      body{
          margin-bottom:20px;
      }
      label
      {
          font-weight: bold;
          font-family: 'Lato', sans-serif;
          font-size:18px;
      }
/*    .collapse {
         margin-top:10px;
      
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      padding: 10px;
      border-radius:12px;
      font-family: 'Lato', sans-serif;
          font-size:16px;
    }*/
 .question-number {
      width: 40px; /* Fixed width for question number container */
      text-align: center; /* Center-align the question number */
      font-weight: bold; /* Make the question number text bold */
      margin-right: 10px; /* Add a small margin to separate question number from question text */
    }
    .sample
    {
        margin-left:10px;
        background-color: #06BBCC;
        border:none;
        display:block;
    }
    .center-button {
      display: flex;
      justify-content: center;
    }
    .btn:hover
    {
        background-color:#00A4B4;
    }
  </style>
</head>
<body>
     <nav  class="navbar navbar-expand-lg navbar-light bg-light sticky-top p-2">
            <div class="container-fluid">
                                <a class="navbar-brand" href="index.html">  
                    <i class="fas fa-chevron-circle-left" id="hov"></i>
                    <img src="img/quizhost-high-resolution-logo-color-on-transparent-background.png" alt="Logo">
                </a>
                <button type="button" class="navbar-toggler"  data-toggle="collapse" data-target="#mynavbar">
                  <span class="navbar-toggler-icon" ></span>
                </button>
                <div id="mynavbar" class="collapse navbar-collapse justify-content-end" >
                    <ul class="navbar-nav " >
                        <li class="nav-item"><span class="nav-link" id="user-email"></span></li>
                        
                        <li class="nav-item" >
                          <a href="index.html" class="nav-item nav-link ">Home</a>
                        </li>
                       
                        <li class="nav-item" >
                          <a href="#aboutus" class="nav-link scroll-to-section" >
                            About
                          </a>
                        </li>
                        
                        
                        
                        
                    </ul>
                </div>
              </div>
    </nav>
  <!-- Your HTML content for the interview preparation page -->
  <div class="container mt-4">
    <!-- Loop through the fetched questions and explanations -->
    <div id="questions">
      <!-- Questions will be appended here -->
    </div>
    <div class="center-button">
        <button id="getMoreQuestions" class="btn btn-success mt-3 kio">Get more Questions</button>
    </div>
    
  </div>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    // Get the query string from the URL
    const queryString = window.location.search.substring(1);
    let questionNumber = 1;
    // Split the query string into key-value pairs
    const queryParams = queryString.split('&');
    const params = {};
    queryParams.forEach(param => {
      const [key, value] = param.split('=');
      params[key] = value;
    });
    fetchMoreQuestions();
   function fetchMoreQuestions()
   {
       // Make an AJAX request to fetch questions based on the query parameters
    const apiUrl = `http://qmanage.online/questions/random-questions`;
    const payload = {
      branchId: params.branchId,
      topicIds: params.selectedTopics.split(','), // Convert comma-separated string back to array
      numberOfQuestions: 10
    };

    fetch(apiUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(payload)
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(responseData => {
      console.log('Response:', responseData);
      const questionsContainer = document.getElementById('questions');
      
      // Initialize the question number counter
      
      
      // Loop through the fetched questions and explanations
      responseData.forEach(question => {
        const questionDiv = document.createElement('div');
        questionDiv.className = 'mb-3';
  
        // Display question number dynamically
        const questionNumberLabel = document.createElement('label');
        questionNumberLabel.className = 'mr-2';
        questionNumberLabel.textContent = questionNumber + '.';
        
        const questionLabel = document.createElement('label');
        questionLabel.textContent = question.text;
  
        const explanationButton = document.createElement('button');
        explanationButton.className = 'btn btn-primary sample';
        explanationButton.type = 'button';
        explanationButton.textContent = 'Sample Answer';
        explanationButton.setAttribute('data-toggle', 'collapse');
        explanationButton.setAttribute('data-target', '#explanation_' + question.id);
  
        const explanationCollapse = document.createElement('div');
        explanationCollapse.id = 'explanation_' + question.id;
        explanationCollapse.className = 'collapse';
        explanationCollapse.textContent = question.explanation;
  
        questionDiv.appendChild(questionNumberLabel);
        questionDiv.appendChild(questionLabel);
        questionDiv.appendChild(explanationButton);
        questionDiv.appendChild(explanationCollapse);
  
        questionsContainer.appendChild(questionDiv);

        // Increment the question number for the next iteration
        questionNumber++;
      });
    })
    .catch(error => {
      console.error('Error:', error.message);
      // Handle errors here
    });
     $('#questions').on('show.bs.collapse', function (e) {
      const targetId = e.target.id;
      const targetCollapse = document.getElementById(targetId);
      targetCollapse.style.marginTop = '10px';
      targetCollapse.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.2)';
      targetCollapse.style.padding = '17px';
      targetCollapse.style.borderRadius = '12px';
      targetCollapse.style.fontFamily = "'Lato', sans-serif";
      targetCollapse.style.fontSize = '16px';
    });
   }
    
    const getMoreQuestionsButton = document.getElementById('getMoreQuestions');
    getMoreQuestionsButton.addEventListener('click', fetchMoreQuestions);
    $('#questions').on('show.bs.collapse', function (e) {
      const targetId = e.target.id;
      const targetCollapse = document.getElementById(targetId);
      targetCollapse.style.marginTop = '10px';
      targetCollapse.style.boxShadow = '0 8px 16px rgba(0, 0, 0, 0.2)';
      targetCollapse.style.padding = '17px';
      targetCollapse.style.borderRadius = '12px';
      targetCollapse.style.fontFamily = "'Lato', sans-serif";
      targetCollapse.style.fontSize = '16px';
    });
  </script>
</body>
</html>
