<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>마이페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>			
			#Mypage_div, .Mypage_table, .Mypage_btn{							
				padding : 5px;
			}
			#Mypage_div{				
				border : 1px solid;
				border-collapse : collapse;
				background-color : yellow;
				padding-right: 100px;				
																
			}
			#Mypage_div, #Mypage_div2{
				width : 600px;
				float: right;																	
			}					
		</style>
 	</head>
  	<body>  	  		
  		<div class="Mypage_include">
  			<jsp:include page="../../resources/include/index.jsp"/>  			
  			<jsp:include page="../../resources/include/Mypage.jsp"/>
  		</div>  		  		  		
  		<div class="content">  		  			
  		<div id="Mypage_div">
  			<table class="Mypage_table">  			  						   		 
				<tr>
			    	<td>아이디 : <b id="userId">${sessionScope.userId}</b></td>
		        </tr>
		        <tr>
		            <td>닉네임 : <b id="userNickName">${MemberData.nickName}"</b></td>
		        </tr>
		        <tr>
		            <td>이름 : <b id="userName">${MemberData.name}</b></td>
		        </tr>			             
		        <tr>
		            <td>생년월일 :<b id="userBirth">${MemberData.birth}</b></td>
		        </tr>
		        <tr>
		            <td>성별 : <b id="userGender">${MemberData.gender}</b></td>
		        </tr>
		        <tr>
		            <td>작성글 : <b id="writeContent">개</b></td>
		        </tr>
		        <tr>    
		            <td>댓글 : <b id="repleContent">개</b></td>
		        </tr>
	        </table>
	        </br>	        
		</div>
		</br>
		<div id="Mypage_div2">
	       	 <table class="Mypage_btn" align="right">				            
				 <tr>
		       	 	<td>
			       		<input type="button" onclick="location.href='./Member_modify_view?userId=${sessionScope.userId}'" value="회원 정보 수정"/>
			     	</td>
				 </tr>			
		   	 </table>
		 </div>  	
  	</div>  			    		
  	</body>
  	<script> 	  	
  	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
  	</script>
</html>