<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>비밀번호 찾기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			#center {
	        width: 500px;
	        position: relative;
            left:350px;
            bottom:10px;
	        padding: 10px;
	        margin-bottom: 10px;
	        float: left;
	        border: 1px solid #bcbcbc;
	      }
		li {
				list-style-type: none;
				padding: 3px;
			 }
			#center2 {
				        width: 130px;
				        padding: 5px;
				        margin-left: 0px;
				        
				      }
			#center3 {
				        width: 430px;
				        padding: 10px;
				        margin: 10px;
				        border: 1px solid #bcbcbc;
				      }
			#center4 {
				        width: 430px;
				        padding: 10px;
				        margin: 10px;
				        border: 1px solid #bcbcbc;
				      }
			#list {
				        width: 500px;
				        padding: 10px;
				        margin-bottom: 20px;
				        float: left;
				        
				      }
			#topLi{
			    list-style-type: none;
			    margin: 5px;
			    padding: 5px;
			    border: 0;
			    float: left;
			}
			#topUi {
			    list-style:none;
			    margin:0px;
			    padding:0;
			}
			a{
			    text-decoration:none;
			    color: black;
			    font-size: 13px;
			    
			}
			hr.one{
					border: 1px solid red;
			        width: 500px;
				}
			/* 버튼 css */
		.submit
		{
			-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
			-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
			box-shadow:inset 0px 1px 0px 0px #ffffff;
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
			background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
			background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
			background-color:#ffffff;
			-moz-border-radius:6px;
			-webkit-border-radius:6px;
			border-radius:6px;
			border:1px solid #dcdcdc;
			display:inline-block;
			cursor:pointer;
			color:#666666;
			font-family:Arial;
			font-size:15px;
			font-weight:bold;
			padding:6px 24px;
			text-decoration:none;
			text-shadow:0px 1px 0px #ffffff;
		}
		.submit:hover {
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
			background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
			background-color:#f6f6f6;
		}
		.submit:active {
			position:relative;
			top:1px;
		}
			
		
		</style>
	</head>
	<body>
	
	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		<div id="center">
           <div id="list">
               <ul id="topUi">
                   <li id="topLi"><a href="Find_Id" >아이디 찾기</a></li>
                   <li id="topLi"><a href="Find_Pw">비밀번호 찾기</a></li>
               </ul>
           </div>
        <div id="center2">
        <h4 id="idf">비밀번호 찾기</h4>
        </div>
        <hr class="one">
       
            <p id=p1>■비밀번호 힌트로 비밀번호 찾기</p>
            <div id="center3">
               <form action="#" id="pwFinder">
                <ul>
                    <li>아이디 : <input id="userId" type="text" size="15" maxlength="15"/></li>
                    <li>이름 : <input id="userId" type="text" size="16" maxlength="16"/></li>
                    <li>비밀번호 힌트 : <select id="pwHint">
                        <option value="">선택하세요</option>
                        <option value="mother">당신의 어머님의 성함은?</option>
                        <option value="father">당신의 아버지의 성함은?</option>
                        <option value="school">출신초등학교는?</option>
                        <option value="love">첫사랑의 이름은?</option>
                        <option value="first">가장 소중한 보물1호는?</option>
                        <option value="family">가장 중요한 기념일은?</option>
                        </select>
                    </li>
                    <li>비밀번호 힌트 답:<input id="reple1" type="text" size="20"></li>
                </ul>
                  <center><input class="submit" id="sendpw1" type=submit value="확인"/></center>
                </form>
            </div>    
            <div id="center4">
             <p id=p2>■회원정보로 비밀번호 찾기</p>
                <form action="#" id="pwFinder2" >
            <ul>
                <li>아이디 : <input id ="userId" type="text" size ="14" maxlength="14"/></li>
                <li>이름 : <input id ="userName" type="text" size ="16" maxlength="16"/></li>
                <li>이메일 : <input id ="email1" type="text" size="16" maxlength="16" /> @ <input id="email2"type="text" size="15" maxlength="16"/> </li>
                <li>생년월일:<input id="date" type="date"/> </li>
            </ul>
            <center><input class="submit" id="sendpw2" type="submit" value="확인"/></center>
            </form>
            </div>
      </div>
	</body>
	<script></script>
</html>