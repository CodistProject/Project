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
		#info{
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
   		
   		<table id="total">
   			<tr>
				<td>
					<div>
				   		<table id="info">
				   		 
				           <tr>
		 	           			<td>보유 마일리지 : ${Find_Mileage.mileage}</td>
		 	           		</tr>
		 	           		<tr>
		 	           			<td>사용가능 마일리지 : <span id="use"></span></td>
		 	           		</tr>
				     <tr>
            			<td class="rig">
            				<input type="button" class="bt" onclick="" value="마일리지 사용"/>
            			</td>
            		</tr>
				            </table>
    				</div>
				</td>   			
   			</tr>    	
    		</table>    		
  	</body>
  	<script>
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
  	</script>
</html>  