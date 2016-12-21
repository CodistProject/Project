<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>탈퇴</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			textarea{
				resize: none;
				width: 600px;
				
			}
			sec{
				right: 50px;
			}
		</style>
 	</head>
  	<body>
   	<div id="in">
  		<jsp:include page="Mypage.jsp"></jsp:include>
  	</div>
  	
  		
  	<div>
  		
  		<body data-brackets-id='259'/>
        <textarea data-brackets-id='260' id="jtext" cols="50" rows="10">
  		[회원탈퇴 약관]

		회원탈퇴 신청 전 안내 사항을 확인 해 주세요.
		회원탈퇴를 신청하시면 현재 로그인 된 아이디는 사용하실 수 없습니다.
		회원탈퇴를 하더라도, 서비스 약관 및 개인정보 취급방침 동의하에 따라  
		일정 기간동안 회원 개인정보를 보관합니다.

 		- 회원 정보
 		- 상품 구입 및 대금 결제에 관한 기록
 		- 상품 배송에 관한 기록
 		- 소비자 불만 또는 처리 과정에 관한 기록
 		- 게시판 작성 및 사용후기에 관한 기록

		※ 상세한 내용은 사이트 내 개인정보 취급방침을 참고 해 주세요.
		</textarea>
		<table id="sec">
		<br>
		<tr>
			<td>비밀번호 확인: <input type="text"/></td>
		</tr>
		</br>
		<tr>
			<td><input type="button" value="탈퇴 하기"/></td>
		</tr>
		</table>
  	</div>
  	
  	</body>
</html>