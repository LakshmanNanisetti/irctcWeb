$(function(){
    
    $("#getRegister").click(function(){
        alert("hello");
        $("#ourForm").html("register.html");
    });
});


$(function(){
    
    
    
    $("#getLogin").click(function(){
        
    $("#ourForm").load("register.html");
    });

    
});


function loginPage(){

    var divElement = document.getElementById("ourForm");
    alert(divElement);

}
