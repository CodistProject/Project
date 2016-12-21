<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>쿠폰</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#cou{
				position :absolute;
				left: 500px;
				top: 200px;
			}
		</style>
 	</head>
  	<body>   
   <table id="cou" border="5">
   
   		<tr>
   			<td>NO</td>
   			
   			<td>할인</td>
   			
   			<td>할인 가능 쇼핑몰</td>
   		</tr>
	   <tr>
	  		<td>1</td> 
	  		<td>10%</td> 
	  		<td>멍텅구리</td>
	   </tr>
	    <tr>
	  		<td>2</td> 
	  		<td>15%</td> 
	  		<td>어쩌구리</td>
	   </tr>
	   	<tr>
	  		<td>3</td> 
	  		<td>20%</td> 
	  		<td>저쩌구리</td>
	   </tr>
   	</table>
  	 </body>
</html>