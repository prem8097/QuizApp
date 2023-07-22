var questionCounter = 0;

function addQuestion() {
    questionCounter++;
    var questionHtml = `
        <div class="question-card">
            <h4>Question ${questionCounter}</h4>
            <div class="form-group">
                <label for="question${questionCounter}">Question:</label>
                <input type="text" class="form-control" id="question${questionCounter}" name="question${questionCounter}" required>
            </div>
            <div class="form-group">
                <label for="answer${questionCounter}">Answer:</label>
                <input type="text" class="form-control" id="answer${questionCounter}" name="answer${questionCounter}" required>
            </div>
        </div>
    `;
    document.getElementById("questionContainer").insertAdjacentHTML("beforeend", questionHtml);
}

function submitQuizForm() {
    var form = document.getElementById("quizForm");
    var inputs = form.getElementsByTagName("input");
    var questionCountInput = document.createElement("input");
    questionCountInput.type = "hidden";
    questionCountInput.name = "questionCounter";
    questionCountInput.value = questionCounter;
    form.appendChild(questionCountInput);

    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].name.startsWith("question") || inputs[i].name.startsWith("answer")) {
            var hiddenInput = document.createElement("input");
            hiddenInput.type = "hidden";
            hiddenInput.name = inputs[i].name;
            hiddenInput.value = inputs[i].value;
            form.appendChild(hiddenInput);
        }
    }
}
