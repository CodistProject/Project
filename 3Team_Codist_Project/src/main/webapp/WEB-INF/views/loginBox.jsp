<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style>		
			table.login,td.login{
				border: 1px solid;
				border-collapse:collapse;
				padding: 5px;
				text-align:center;
			}
		</style>
	</head>
	<body>
		<form action="login" method="post">
			<table class="login">
				<tr >
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
						<input type="submit" value="로그인"/>
						<input type="button" onclick="#" value="회원가입"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script></script>
</html>