<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>마일리지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<style>
<<<<<<< HEAD
		/* 	table {
				text-align: center;
				
				} */
		.info{
				width: 490px;               
                border-style: solid;
                padding: 25px;
                text-align: left;
		}
		#total{
			position: absolute;
            left: 380px;
            text-align: right;    
		}
		
		.rig{
		text-align: right;
		}
		#in{
		left: 200px;
		top: 215px;		
		}		
		
		</style>
 	</head>
  	<body>
  	   	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
  		<div id="in">
  			<jsp:include page="../../resources/include/Mypage.jsp"></jsp:include>
  		</div> 
  		<div id="total">  		
			<table class="info">				   		 
				<tr height="30px">
		 	    	<td>보유 마일리지 : ${Find_Mileage.mileage}</td>
		 	    </tr>
		 	    <tr>
		 	           <td>사용가능 마일리지 : <span id="use"></span></td>
		 	     </tr>
				  	   <tr>
            	  <td class="rig">
            			<input type="button" onclick="coupon()" value="쿠폰 교환하기"/>
            	  </td>
            			</tr>
            </table>
            <table id="coupon" style="display: none">
            	  <tr height="30px">
            			<td width="230px">
            				1000원 할인 쿠폰
            			</td>
            			<td class="rig" width="220px">
            				<input type="button" onclick="usemile1000()" value="교환하기"/>
            			</td>
            	   </tr>            	   
            		<tr>
            			<td>
            				2000원 할인 쿠폰
            			</td>
            			<td class="rig">
            				<input type="button" onclick="usemile2000()" value="교환하기"/>
            			</td>
            		</tr>            		 
            		<tr>
            			 <td>
            				3000원 할인 쿠폰
            			 </td>
            			 <td class="rig">
            				<input type="button" onclick="usemile3000()" value="교환하기"/>
            			</td>
            		</tr>         	
            	</table>
			</div>			 		
  	</body>
  	<script>  		
  		function usemile1000() {
  			var mile = "${sessionScope.mil}";
  			var coupon_10="coupon_5";
  			if(mile<=1000){
  				alert("포인트 없는 거지새끼");
  			}else{
  				location.href='./usemile?won=1000&coupon=coupon_5';
  			} 			
		}
  		
  		function usemile2000() {
  			var mile = "${sessionScope.mil}";
  			
  			if(mile<=2000){
  				alert("포인트 없는 거지새끼");
  			}else{
  				location.href='./usemile?won=2000&coupon=coupon_10';
  			} 			
		}
  		
  		function usemile3000() {
  			var mile = "${sessionScope.mil}";
  			
  			if(mile<=3000){
  				alert("포인트 없는 거지새끼");
  			}else{
  				location.href='./usemile?won=3000&coupon=coupon_15';
  			} 			
		}
  	
  	
  		usemileage();
  		
  		function usemileage() {
  			var mg = ${Find_Mileage.mileage};
  			var html ="";
  			var use = $("#use");
  			console.log(mg);
  			if(mg<1000){
				html += "(1000 마일리지부터 사용가능합니다)";
				use.append(html);
			}else{
				html += mg;
				use.append(html);
			}
		}
  		
  		function coupon() {
			$("#coupon").css("display","block");				
		}
  	</script>
</html>  