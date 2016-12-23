<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>회원정보 수정</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			.Mem_Modi_div, .Mem_Modi_div2{
				width : 680px;
				float: right;	
			}			
			.Mem_Modi_div{
				border : 1px solid;
				border-collapse : collapse;
				background-color : yellow;
				padding-right: 100px;		
			}
			.Mem_Modi_div, #Mem_Modi_table1, #Mem_Modi_table2{
				padding : 5px;
			}
		</style>
 	</head>
  	<body>
   	<body>   	
   	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
  	<div id="in">
  	<jsp:include page="../../resources/include/Mypage.jsp"></jsp:include>
  	</div>
  	<div class="content">  	
  	<form action="Member_modify" method="post">
  	<div class="Mem_Modi_div">
  		<table id="Mem_Modi_table1">
  			<tr>
  				<td>아이디 : <input type="text" name="userId" value="${sessionScope.userId}" readonly/></td>
  			</tr>
  			<tr>
  				<td>닉네임 :<input type="text" name="nickName" value="${MemberData.nickName}"/></td>
  			</tr>
  			<tr>
  				<td>기존 비밀번호 :<input type="text" name="presentPw" value="${MemberData.pw}"/></td>
  			</tr>
  			<tr>
  				<td>새 비밀번호 :<input type="text" name="pw"/></td>
  			</tr>
  			<tr>  				
  				<td>비밀번호 확인 :<input type="text" name="pw1"/><font id="Pw_chk"></font></td>
  			</tr>
  			<tr>
  				<td>이름 :<input type="text" name="name" value="${MemberData.name}"/></td>
  			</tr>
  			<tr>
  				<td>생년월일 :<input type="text" name="birth" value="${MemberData.birth}"/></td>
  			</tr>
  			<tr>
  				<td> 성별 :
  						<c:if test="${MemberData.gender=='남'}">
  						 남 : <input type="radio" name="gender" value="남" checked/>
  						 여 : <input type="radio"  name="gender" value="여"/>
  						</c:if>
  						<c:if test="${MemberData.gender == '여'}">
  					 	 남 : <input type="radio" name="gender" value="남"/>
  						 여 : <input type="radio"  name="gender" value="여" checked/>  						
  						</c:if>
  						<c:if test="${MemberData.gender== null}">
  						 남 : <input type="radio" name="gender" value="남"/>
  						 여 : <input type="radio"  name="gender" value="여"/>
  						</c:if>
  				</td>  				
  			</tr>
  			<tr>
  				<td>메일 주소 :<input type="text" name="email" value="${MemberData.email}"/></td>
  			</tr>  		
  		</table>
  		</div>  	
  		<div class="Mem_Modi_div2">
  			<table id="Mem_Modi_table1" align="right">
  				<tr>
  					<td>
  						<input type="submit"  value="회원 정보 수정"/>
  						<input type="button" value="취소" onclick="location.href='MemberData_view?userId=${sessionScope.userId}'"/>
  					</td>
  				</tr>
  			</table>  		
  		</div>
  		</form>  
  		</div>			
  	</body>
  	<script>  	
  	</script>
</html>