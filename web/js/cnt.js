
function enterQuizcode() {
    
    var quizName = prompt("Enter the code of the quiz you want to join");
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'CodeCheck', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    
    xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
        if (xhr.status === 200) {
            console.log(xhr.responseText);
            var response = JSON.parse(xhr.responseText);
            var success = response.success;
            console.log(success);
            if(success === "success")
            {
                var encodedQuizName = encodeURIComponent(quizName);
                var url = "examCard.jsp?name=" + encodedQuizName;
                window.location.href = url;
            }
            if(success === "attemptfail")
            {
                window.alert("Exam already completed by this user");
            }
            if(success === "codeattempt")
            {
                window.alert("please check your quizcode and try again.");
            }
            if(success === "codecheck")
            {
                window.alert("please check your quizcode and try again.");
            }
            if(success === "timefail")
            {
                window.alert("Sorry, the Quiz has ended ");
            }
            
            
            }
               }
};

    var params = 'quizName=' + encodeURIComponent(quizName);
    xhr.send(params);
}

 