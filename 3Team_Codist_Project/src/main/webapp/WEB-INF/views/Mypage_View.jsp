<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>마이페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#info{
				width: 600px;
				position: absolute;
				left: 300px;
				top: 215px;
                border-width: 10px;              
                text-align: center;

		}
		#total{
		text-align: center;
            left: 10%;
            text-align: right;    
		}
		.right{
			text-align: right;
		}		
		</style>
 	</head>
  	<body>
  	<jsp:include page="index.jsp"></jsp:include>
  	<div id="content">
  	<div id="in">
  	<jsp:include page="Mypage.jsp"></jsp:include>
  	</div>   		
   		<table id="total">
   			<tr>
				<td>
					<div>
				   		<table id="info">				   		 
				            <tr>
				                <td>아이디 :<input type="text" name="userId"/>${sessionScope.userId}</td>
				            </tr>			             
				            <tr>
				                <td>생년월일 :<input type="text" name="userBirth"/>${memberData.birth}</td>
				            </tr>
				            <tr>
				                <td>성별 :<input type="text" name="userGender"/>${memberData.gender}</td>
				            </tr>
				            <tr>
				                <td>작성글 :<input type="text" name="writeCotent"/>개</td>
				                
				                <td>댓글 : <input type="text" name="repleContent"/>개</td>
				            </tr>
						    <tr>
				            	<td colspan="2" class="right">
				            		<input type="button" onclick="location.href='./Member_modify'" value="회원 정보 수정"/>
				            	</td>
				            </tr>
				            </table>
    				</div>
				</td>   			
   			</tr>    		
    		</table>
    		</div>    		
  	</body>
  	<script>
  	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
  	</script>
</html>