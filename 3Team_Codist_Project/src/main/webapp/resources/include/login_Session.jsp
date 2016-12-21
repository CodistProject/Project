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
				padding: 5px;
				text-align:center;
			}
		</style>
	</head>
	<body>		
			<table>
				<tr >
					<td>${sessionScope.userId}님 반갑습니다.</td>				
				</tr>
				<br/>
				<tr>
					<td><a href="#">마이페이지</a> / <a href="#">로그아웃</a></td>				
			</table>	
	</body>
	<script></script>
</html>