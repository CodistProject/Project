<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>마일리지 교환</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		#in{
			position: absolute;
			}
		#mile{
			position: absolute;
			left: 200px;			
		}
		
		</style>
 	</head>
  	<body>
  	<div id="in">
  	<jsp:include page="mypagehome.jsp"></jsp:include>
  	</div>
  	
   		<table>
   			<div id="mile">
   				
   					<a href="#">5% 할인 쿠폰 1000P 사용하여 교환하기</a></br>
				   	<a href="#">10% 할인 쿠폰 2000P 사용하여 교환하기</a></br>
   				   	<a href="#">15% 할인 쿠폰 3000P 사용하여 교환하기</a></br>
   				   	<a href="#">20% 할인 쿠폰 4000P 사용하여 교환하기</a></br>
   		
   			</div>
   		</table>
  	</body>
</html>