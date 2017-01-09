<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style></style>
	</head>
<body> 
<button id = "getIt" onclick = "gettingJSON()">Get JSON</button>
<div id='openweathermap-widget'></div>              
</body>
<script>

function gettingJSON(){
    document.write("jquery loaded");
    $.getJSON("http://api.openweathermap.org/data/2.5/forecast/daily?&APPID=b50260aefcd6ed0822969e46440ce7df&lat=36.1444292&lon=128.391079&mode=json&units=metric&cnt=7",function(json){
  /*       document.write(JSON.stringify(json)); */
        var json_obj = JSON.parse(JSON.stringify(json));
  		var dt = json_obj.list[i].dt
  		
  		for(i=0;i<=6;i++){
  			console.log(json_obj.list[i].dt);  
  		}
  
              
    });
}
</script>
</html>
