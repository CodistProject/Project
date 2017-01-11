<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>쿠폰</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			
		</style>
 	</head>
  	<body>   
   	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
  	<div id="in">
  	<jsp:include page="../../resources/include/Mypage.jsp"></jsp:include>
  	</div>
  	<div class="content">  	  	
  	<div class="Mem_Modi_div">
  		<table id="Mem_Modi_table1">
 			<tr>
 				<td>
 					<p>쿠폰 보유 내역</p>
 				</td>
 			</tr>
 			<tr>
 				<td>
 					1000원 쿠폰 : ${Find_Mileage.coupon_5} 개
 				</td>
 			</tr>
 			<tr>
 				<td>
 					2000원 쿠폰 : ${Find_Mileage.coupon_10} 개
 				</td>
 			</tr>
 			<tr>
 				<td>
 					3000원 쿠폰 : ${Find_Mileage.coupon_15} 개
 				</td>
 			</tr>						 		
  		</table>
  		</div>   	
  		</div>			
  	 </body>
</html>