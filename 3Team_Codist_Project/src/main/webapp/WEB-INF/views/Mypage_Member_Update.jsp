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
   	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
  	<div id="in">
  	<jsp:include page="../../resources/include/Mypage.jsp"></jsp:include>
  	</div>
  	<div id="mem">
  		<table>
  			<tr>
  				<td>아이디 : ${sessionScope.userId} </td>
  			</tr>
  			<tr>
  				<td>기존 비밀번호 :<input type="text" name="presentPw" value="${MemberData.pw}"/></td>
  			</tr>
  			<tr>
  				<td>새 비밀번호 :<input type="text" name="newPw"/></td>  				
  				<td>비밀번호 확인 :<input type="text" name="newPw1"/></td>
  			</tr>
  			<tr>
  				<td>이름 :<input type="text" name="Name" value="${MemberData.name}"/></td>
  			</tr>
  			<tr>
  				<td>생년월일 :<input type="text" name="Birth" value="${MemberData.birth}"/></td>
  			</tr>
  			<tr>
  				<td> 성별 :
  						<c:if test="${MemberData.gender=='남'}">
  						 남 : <input type="radio" name="Gender" value="남" checked/>
  						 여 : <input type="radio"  name="Gender" value="여"/>
  						</c:if>
  						<c:if test="${MemberData.gender == '여'}">
  					 	 남 : <input type="radio" name="Gender" value="남"/>
  						 여 : <input type="radio"  name="Gender" value="여" checked/>  						
  						</c:if>
  						<c:if test="${MemberData.gender== null}">
  						 남 : <input type="radio" name="Gender" value="남"/>
  						 여 : <input type="radio"  name="Gender" value="여"/>
  						</c:if>
  				</td>  				
  			</tr>
  			<tr>
  				<td>메일 주소 :<input type="text" name="Email" value="${MemberData.email}"/></td>
  			</tr>
  			<tr>
  				<td>
  					<input type="button" value="회원 정보 수정" onclick="location.href='./Member_modify'"/>
  					<input type="button" value="취소" onclick="location.href='MemberData_view?userId=${sessionScope.userId}'"/>
  				</td>
  			</tr>
  		</table>
  		</div>  			
  	</body>
</html>