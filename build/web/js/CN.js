var startmin=10;
var time=startmin * 60 ;
var minutes,sec;
var xx=document.getElementById("timer");
setInterval(update,1000);
function update()
{
    minutes=Math.floor(time / 60);
    sec=time % 60;
    sec=sec < 10 ? '0' + sec : sec;
    document.getElementById('timer').innerHTML=minutes + ":" + sec;
     if(minutes>0 || sec>0)
    {
        time--;
    }
    else
    {
        alert("time up");
        document.getElementById("quesform").submit(); 
    }
}
function radioclr()
{
   document.querySelector('input[name="q1"]:checked').checked = false; 
}
function radioclr1()
{
   document.querySelector('input[name="q2"]:checked').checked = false;
}
function radioclr2()
{
   document.querySelector('input[name="q3"]:checked').checked = false;  
}
function radioclr3()
{
   document.querySelector('input[name="q4"]:checked').checked = false; 
}
function radioclr4()
{
   document.querySelector('input[name="q5"]:checked').checked = false; 
}
function radioclr5()
{
   document.querySelector('input[name="q6"]:checked').checked = false; 
}
function radioclr6()
{
   document.querySelector('input[name="q7"]:checked').checked = false;
}
function radioclr7()
{
   document.querySelector('input[name="q8"]:checked').checked = false; 
}
function radioclr8()
{
   document.querySelector('input[name="q9"]:checked').checked = false;
}
function radioclr9()
{
   document.querySelector('input[name="q10"]:checked').checked = false; 
}
function radioclr10()
{
    document.querySelector('input[name="q1"]:checked').checked = false;
    document.querySelector('input[name="q2"]:checked').checked = false;
    document.querySelector('input[name="q3"]:checked').checked = false;
    document.querySelector('input[name="q4"]:checked').checked = false;
    document.querySelector('input[name="q5"]:checked').checked = false;
    document.querySelector('input[name="q6"]:checked').checked = false;
    document.querySelector('input[name="q7"]:checked').checked = false;
    document.querySelector('input[name="q8"]:checked').checked = false;
    document.querySelector('input[name="q9"]:checked').checked = false;
   document.querySelector('input[name="q10"]:checked').checked = false; 
}
function clearRadios(questionNumber) {
  const radios = document.getElementsByName(`q${questionNumber}`);
  radios.forEach((radio) => (radio.checked = false));
}
