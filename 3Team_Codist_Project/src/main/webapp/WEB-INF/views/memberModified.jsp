<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>회원정보 수정</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#mem{
				position: absolute;
				left: 350px;	
				top: 180px;	
			}
		</style>
 	</head>
  	<body>
   	<body>
   	<jsp:include page="index.jsp"></jsp:include>
  		<div id="in">
  	<jsp:include page="mypagehome.jsp"></jsp:include>
  	</div>
  	<div id="mem">
  		<table>
  			<tr>
  				<td>아이디 :<input type="text"/></td>
  			</tr>
  			<tr>
  				<td>기존 비밀번호 :<input type="text"/></td>
  			</tr>
  			<tr>
  				<td>새 비밀번호 :<input type="text"/></td>
  				<td>비밀번호 확인 :<input type="text"/></td>
  			</tr>
  			<tr>
  				<td>이름 :<input type="text"/></td>
  			</tr>
  			<tr>
  				<td>생년월일 :<input type="text"/></td>
  			</tr>
  			<tr>
  				<td>성별 : 남 : <input type="radio" name="gen" value="남"/> 여 :<input type="radio"  name="gen" value="여"/></td>
  				
  			</tr>
  			<tr>
  				<td>메일 주소 :<input type="text"/></td>
  			</tr>
  			<tr>
  				<td>
  					<input type="button" value="회원 정보 수정"/>
  					<input type="button" value="취소"/>
  				</td>
  			</tr>
  		</table>
  		</div>
  			
  	</body>
</html>