document.getElementById('quizForm').addEventListener('submit', function(e) {
  e.preventDefault();

  const quizName = document.getElementById('quizName').value;
  const numQuestions = document.getElementById('numQuestions').value;
  const questionsContainer = document.getElementById('questionsContainer');

  // Clear previous questions
  questionsContainer.innerHTML = '';

  // Generate form fields for each question
  for (let i = 1; i <= numQuestions; i++) {
    const questionDiv = document.createElement('div');
    questionDiv.className = 'form-group';

    const questionLabel = document.createElement('label');
    questionLabel.textContent = 'Question ' + i + ':';
    const questionInput = document.createElement('input');
    questionInput.type = 'text';
    questionInput.className = 'form-control';
    questionInput.name = 'question' + i;
    questionInput.required = true;

    questionDiv.appendChild(questionLabel);
    questionDiv.appendChild(questionInput);

    for (let j = 1; j <= 4; j++) {
      const optionLabel = document.createElement('label');
      optionLabel.textContent = 'Option ' + j + ':';
      const optionInput = document.createElement('input');
      optionInput.type = 'text';
      optionInput.className = 'form-control';
      optionInput.name = 'option' + i + '_' + j;
      optionInput.required = true;

      questionDiv.appendChild(optionLabel);
      questionDiv.appendChild(optionInput);
    }
const explanationLabel = document.createElement('label');
  explanationLabel.textContent = 'Explanation:';
  const explanationTextarea = document.createElement('textarea');
  explanationTextarea.className = 'form-control explanation-input';
  explanationTextarea.name = 'explanation' + i;

  questionDiv.appendChild(explanationLabel);
  questionDiv.appendChild(explanationTextarea);
    const correctLabel = document.createElement('label');
    correctLabel.textContent = 'Correct Option:';
    const correctInput = document.createElement('input');
    correctInput.type = 'number';
    correctInput.className = 'form-control';
    correctInput.name = 'correct' + i;
    correctInput.min = '1';
    correctInput.required = true;

    questionDiv.appendChild(correctLabel);
    questionDiv.appendChild(correctInput);

    questionsContainer.appendChild(questionDiv);
  }
  if (numQuestions <= 0) {
    alert('Number of questions should be greater than 0.');
    return;
  }
  else{
  document.getElementById('generateHTMLBtn').style.display = 'block';
  document.getElementById('btn1').style.display = 'none';
  document.getElementById('date-time').style.display = 'block';
  
  document.getElementById('quizDescriptionContainer').style.display = 'block';
  }

   
});

document.getElementById('generateHTMLBtn').addEventListener('click', function(e) {
  e.preventDefault();
  const quizName = document.getElementById('quizName').value;
  const numQuestions = document.getElementById('numQuestions').value;
  const dynamicHTML = generateDynamicHTML(quizName, numQuestions);
  const dynamicHTML1=generateDynamicHTML1(quizName,numQuestions);
  const quizDescription = document.getElementById('quizDescription').value; 
  const dateTaken = document.getElementById('quizDate').value;
  const timeTaken = document.getElementById('quizTime').value;
    const endTime = document.getElementById('quizEndTime').value;
    const endDate = document.getElementById('quizEndDate').value;
  const duration=document.getElementById('quizDuration').value;
   

  if (quizName.trim() === '') {
    alert('Please enter a quiz name.');
    return;
  }

  if (quizDescription.trim() === '') {
    alert('Please enter the Emails of participants ');
    return;
  }

  if (dateTaken === '') {
    alert('Please select a quiz date.');
    return;
  }

  const currentDate = new Date();
  const selectedDate = new Date(dateTaken);

  if (selectedDate > currentDate) {
    alert('Quiz date is invalid');
    return;
  }
  
  if (endDate === '') {
    alert('Please select an end date.');
    return;
  }

  const selectedEndDate = new Date(endDate);

  if (selectedEndDate < selectedDate) {
    alert('End date is invalid');
    return;
  }

  sendDynamicHTML(quizName, numQuestions, dynamicHTML,dynamicHTML1,quizDescription,dateTaken,timeTaken,duration,endTime,endDate);
});



function generateDynamicHTML(quizName, numQuestions) {
  const questionsContainer = document.getElementById('questionsContainer');
  const questionDivs = questionsContainer.getElementsByClassName('form-group');
  let dynamicHTML = '';
  
  // Generate HTML code for each question
  for (let i = 0; i < questionDivs.length; i++) {
    const questionDiv = questionDivs[i];
    const questionInput = questionDiv.querySelector('input[type="text"]');
    const optionsInputs = questionDiv.querySelectorAll('input[type="text"]');
    const correctInput = questionDiv.querySelector('input[type="number"]');
    
    const correctOption = parseInt(correctInput.value); // Get the correct option value
    
    dynamicHTML += `
      <div class="question mt-2">
        <h5>${i + 1}. ${questionInput.value}</h5>
    `;
        

    optionsInputs.forEach(function (optionInput, index) {
      if (index !== 0) {
        dynamicHTML += `
          <div class="form-check">
            <input class="form-check-input" type="radio" name="q${i + 1}" value="${index + 1}" id="flexRadioDefault${i + 1}" >
            <label class="form-check-label" for="flexRadioDefault${i + 1}">
              ${optionInput.value}
            </label>
          </div>
        `;
            
            
      }
    });

    dynamicHTML += `
      <div class="cls">
        <input type="button" id="clear${i + 1}" onclick="clearRadios(${i + 1})" value="Clear">
      </div>
    </div>
    `;
  }

  // Wrap the generated questions in the full HTML structure
  dynamicHTML = `
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${quizName}</title>
    <link  href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>     
        <link rel="stylesheet" href="css/questions.css">
    <style>
         .question {
  margin-bottom: 30px;
}
        </style>
      </head>
      <body>
        <div class="question-form">
          
          <form id="quesform" method="post" action="ExamResult">
            ${dynamicHTML}
            
          </form>
        </div>
        
      </body>
    </html>
  `;
    

  return dynamicHTML;
}


function generateDynamicHTML1(quizName, numQuestions) {
  const questionsContainer = document.getElementById('questionsContainer');
  const questionDivs = questionsContainer.getElementsByClassName('form-group');

  let dynamicHTML1 = '';

  // Generate HTML code for each question
  for (let i = 0; i < questionDivs.length; i++) {
    const questionDiv = questionDivs[i];
    const questionInput = questionDiv.querySelector('input[type="text"]');
    const optionsInputs = questionDiv.querySelectorAll('input[type="text"]');
    const correctInput = questionDiv.querySelector('input[type="number"]');
const explanationTextarea = questionDiv.querySelector('textarea.explanation-input');
    const correctOption = parseInt(correctInput.value); // Get the correct option value

    dynamicHTML1 += `
      <div class="question mt-3">
        <h5>${i + 1}. ${questionInput.value}</h5>
    `;

    optionsInputs.forEach(function (optionInput, index) {
      if (index !== 0) {
          const isCorrectOption = index === correctOption;
    const style = isCorrectOption ? 'border-color: green; background-color: green;' : '';

        dynamicHTML1 += `
          <div class="form-check">
            <input class="form-check-input" type="radio" name="q${i + 1}" value="${index + 1}" id="flexRadioDefault${i + 1}" ${index  === correctOption ? 'checked' : ''} disabled style="${style}>
            <label class="form-check-label" for="flexRadioDefault${i + 1}">
              ${optionInput.value}
            </label>
          </div>
        `;
      }
    });
dynamicHTML1 += `<br>
        <button class="btn btn-primary expl" type="button" data-toggle="collapse" data-target="#collapse${i + 1}" aria-expanded="false" aria-controls="collapse${i + 1}">
          Explanation
        </button>
        <div class="collapse" id="collapse${i + 1}">
          <div class="card card-body">
            ${explanationTextarea.value}
          </div>
        </div><br>
      
    `;
  
    dynamicHTML1 += `
      </div>
    `;
  }

  // Wrap the generated questions in the full HTML structure
  dynamicHTML1 = `
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${quizName}</title>
        <link href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>     
        <link rel="stylesheet" href="css/questions.css">
        
      </head>
      <body>
        <div class="question-form">
          <h1>${quizName}</h1>
          <form id="quesform" method="post" action="ExamAnswers">
            ${dynamicHTML1}
          </form>
        </div>
        <script type="text/javascript" src="js/CN.js"></script>
        
      </body>
    </html>
  `;

  return dynamicHTML1;
}






function generateRandomString() {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const prefix = 'QUIZIT';
  let randomString = prefix;

  for (let i = prefix.length; i < 10; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    const randomChar = characters.charAt(randomIndex);
    randomString += randomChar;
  }

  return randomString;
}
const randomString = generateRandomString();
function sendDynamicHTML(quizName,numQuestions,dynamicHTML,dynamicHTML1,quizDescription,dateTaken,timeTaken,duration,endTime,endDate)
{
    const xhr =new XMLHttpRequest();
    xhr.open('POST','QuizServlet',true);
    xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4 && xhr.status===200)
        {
            console.log(xhr.responseText);
            //window.alert("Added successfully");
        }
    };
    const params='quizName=' + encodeURIComponent(quizName) + '&numQuestions=' + encodeURIComponent(numQuestions) + '&dynamicHTML=' + encodeURIComponent(dynamicHTML) +  '&dynamicHTML1=' + encodeURIComponent(dynamicHTML1)+ '&quizDescription=' + encodeURIComponent(quizDescription)+'&randomString=' + encodeURIComponent(randomString)+'&dateTaken=' + encodeURIComponent(dateTaken)+'&timeTaken=' + encodeURIComponent(timeTaken)+'&duration=' + encodeURIComponent(duration)+'&endTime=' + encodeURIComponent(endTime)+'&endDate=' + encodeURIComponent(endDate);
    
    xhr.send(params);
    sendAnswers(quizName,numQuestions,randomString);
}
function sendAnswers(quizName,numQuestions,randomString)
{
    const questionsContainer = document.getElementById('questionsContainer');
  const questionDivs = questionsContainer.getElementsByClassName('form-group');
  const correctOptions = [];

  // Get the correct options for each question
  for (let i = 0; i < questionDivs.length; i++) {
    const questionDiv = questionDivs[i];
    const correctInput = questionDiv.querySelector('input[type="number"]');
    const correctOption = parseInt(correctInput.value);
    correctOptions.push(correctOption);
  }
    const xhr =new XMLHttpRequest();
    xhr.open('POST','ExamAnswers',true);
    xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.onreadystatechange=function(){
        if(xhr.readyState===4 && xhr.status===200)
        {
            console.log(xhr.responseText);
            window.alert("Added successfully");
        }
    };
    const params='quizName=' + encodeURIComponent(quizName) +'&numQuestions=' + encodeURIComponent(numQuestions)+ '&correctOptions=' + encodeURIComponent(JSON.stringify(correctOptions)) + '&randomString=' + encodeURIComponent(randomString);
    
    xhr.send(params);
    AdminResponse(quizName,numQuestions);
}

function AdminResponse(quizName,numQuestions)
{
    
    const params='AdminResponse.jsp'+'?quizName=' + encodeURIComponent(quizName) + '&numQuestions=' + encodeURIComponent(numQuestions) +  '&randomString=' + encodeURIComponent(randomString);
    
    window.location.href=params;
    
}

// script.js
