<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>		
	</head>
	<body>
		<br/><br/>
		<form action="login" method="post">
			<table class="login">
				<tr>
					<td class="login">ID</td>
					<td class="login">
						<input type="text" name="userId"/>
					</td>
				</tr>
				<tr>
					<td class="login">PW</td>
					<td class="login">
						<input type="password" name="userPass"/>
					</td>
				</tr>
				<tr>
					<td class="login" colspan="2">
						<a href="#" class="a2" onclick="location.href='./joinCheck'">회원 가입</a>					
						<input type="submit" class="logbtn" value="로그인"/>
					</td>
				</tr>
				</table>
				<table>				
				<tr>
					<td class="login" colspan="2">
						<a href="Find_Id" class="a2">아이디 찾기</a>/<a href="Find_Pw" class="a2">비밀번호 찾기</a>						
					</td>
				</tr>				
					<br/>						
			</table>
		</form>
	</body>
	<script>
		
			
	</script>
</html>