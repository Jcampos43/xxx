$( document ).ready(function() {
	$("#sam-login").click(function(){
		document.location.href = "./login.html";
	});
	$("#sam-login-tab").click(function(){
		document.getElementById("fw-container").style.backgroundImage="url(./images/bg_4.png)";
	});
	$("#sam-signup-tab").click(function(){
		document.getElementById("fw-container").style.backgroundImage="url(./images/bg_5.png)";
	});
	$("#demo-gotomypets").click(function(){
		document.location.href = "./crud_mascota.html";
	});
});