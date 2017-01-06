<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>아이디/비밀번호 찾기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/findId.css"/>
	</head>
	<body>
		<div>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		</div>
		 <div id="content">
    <div class="list">
        <ul class="topUi">
            <li class="topLi"><a class="a1" href="Find_Id" >아이디 찾기</a></li>
            <li class="topLi"><a class="a1" href="Find_Pw">비밀번호 찾기</a></li>
        </ul>
    </div>
    <br/>
    <hr class="one">
    <h4 id="idf">아이디 찾기</h4>
    <p class="p1">회원 가입시, 입력하신 회원 정보 또는 본인 인증으로 아이디를 확인할 수 있습니다.
    <br/> 아이디는 가입시 적어주신 이메일로 보내 드립니다.</p>
    <br/> ■<b>본인 확인용 정보로 찾기</b>
    <form action="FindId_userEmail">
        <ul class="find">
            <li>이름 :
                <input id="userName" name="user_Name" type="text" size="14" maxlength="14" />
            </li>
 			<li>phone :
                <select id="phone1" name="userPhone" class="sel">
                        <option value="">선택하세요</option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
               </select>
               - <input id="phone2" type="text" size="6" maxlength="6"/>
                - <input id="phone3" type="text" size="6" maxlength="6"/>       
            </li>
            <li>이메일 :
                <input id="email1" name="userEmail1" type="text" size="16" maxlength="16" /> @
                <input id="email2" name="userEmail2" type="text" size="15" maxlength="16" /> </li>
            	<p class="p2"> *회원 가입시 작성한 이름과 전화번호, 이메일을 입력하세요.</p>
        </ul>
        <center>        
          	<input class="bt" type="submit" value="확인" />   
        </center>               
        </form>
	</div>		
	</body>
	<script>
		function checkemailaddy(){
	        if (form.email_select.value == '1') {
	            form.email2.readonly = false;
	            form.email2.value = '';
	            form.email2.focus();
	        }
	        else {
	            form.email2.readonly = true;
	            form.email2.value = form.email_select.value;
	        }
	    }
	</script>
</html>