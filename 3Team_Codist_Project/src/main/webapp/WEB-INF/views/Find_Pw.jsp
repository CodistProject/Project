<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>비밀번호 찾기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/findPw.css"/>
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
        <hr class="one">       
            <p id=p1>■ 비밀번호 힌트로 비밀번호 찾기</p>
            <form action="Pw_Find" id="pwFinder">
            <div id="center3">               
                <ul>
                    <li>아이디 : <input id="userId" name="user_Id" type="text" size="15" maxlength="15"/></li>
                    <li>이름 : <input id="userId" name="user_Name" type="text" size="16" maxlength="16"/></li>
                    <li>비밀번호 힌트 : <select id="pwHint" class="sel">
                        <option value="">선택하세요</option>
                        <option value="mother">당신의 어머니의 성함은?</option>
                        <option value="father">당신의 아버지의 성함은?</option>
                        <option value="school">출신초등학교는?</option>
                        <option value="love">나의 첫사랑의 이름은?</option>
                        <option value="first">가장 소중한 보물1호는?</option>
                        <option value="family">가장 중요한 기념일은?</option>
                        </select>
                    </li>
                    <li>비밀번호 힌트 답:<input id="reple1"  name="Pw_Ans" type="text" size="20"></li>
                </ul>

                  	<center><input class="submit" id="sendpw1" type=submit value="확인"/></center>                
            </div>    
            <div id="#content4">
             <p id=p2>■ 회원정보로 비밀번호 찾기</p>                
            <ul>
                <li>아이디 : <input id ="userId" name="userId" type="text" size ="14" maxlength="14"/></li>
                <li>이름 : <input id ="userName" name="userName" type="text" size ="16" maxlength="16"/></li>
                <li>이메일 : <input id ="email1" name="email1" type="text" size="16" maxlength="16" /> @ <input id="email2" name="email2" type="text" size="15" maxlength="16"/> </li>
                <li>생년월일:<input id="date" name="Birth" type="date"/> </li>
            </ul>
            <center><input class="submit" id="sendpw2" type="submit" value="확인"/></center>            
            </div>
            </form>
      </div>
	</body>
	<script>
	var success_msg = "${Find_Pw.msg}";
	var error_msg = "${error_msg}";
	if(success_msg=="찾으시는 비밀번호가 이메일로 전송되었습니다."){
		alert(success_msg);
	}
	if(error_msg=="입력하신 회원정보가 잘못되었습니다. 다시 확인 바랍니다."){
		alert(error_msg);
	}
	</script>
</html>