<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
	</head>
	<body>
		<form action="login" method="post">
			<table class="loginBox">
				<tr>
					<td> LOGIN </td>
				</tr>
				<tr>
					<td class="login">
						<input type="text" name="userId" class="input" style="height:30px;"placeholder="아이디를 입력하세요" />
					</td>
				</tr>
				<tr>
					<td class="login">
						<input type="password" name="userPass" class="input" style="height:30px;" placeholder="비밀번호를 입력하세요"/>
					</td>
				</tr>
				<tr>
					<td class="login" colspan="2">
						<input type="submit" class="logbtn" value="로그인"/>
					</td>
				</tr>
			</table>
		</form>
		
	</body>
	<script>			
	</script>
</html>