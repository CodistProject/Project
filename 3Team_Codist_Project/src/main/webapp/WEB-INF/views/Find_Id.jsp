<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>아이디/비밀번호 찾기</title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		
		div#content {
            position: absolute;
            left:230px;
          	bottom: 300px;
            width: 600px;
            padding: 15px;
            margin-bottom: 20px;
            float: left;
            border: 1px solid #bcbcbc;
        }
		
		li {
		    list-style-type: none;
		    padding: 5px;
		}
		
		button#sendId {
		    position: center;
		}
		
		hr.one {
		    border: 1px solid red;
		    width: 600px;
		}
		
		p.p1 {
		    font-size: 14px;
		}
		
		p.p2 {
		    font-size: 12px;
		}
		
		
		div#list {
		    width: 500px;
		    padding: 10px;
		    margin-bottom: 20px;
		    float: left;
		}
		
		li#topLi {
		    list-style-type: none;
		    margin: 5px;
		    padding: 5px;
		    border: 0;
		    float: left;
		}
		
		ul#topUi {
		    list-style: none;
		    margin: 0px;
		    padding: 0;
		}
		
		a.a1 {
		    text-decoration: none;
		    color: black;
		    font-size: 13px;
		}
		/* 버튼 css */
		#sendId
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
		#sendId:hover {
			background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
			background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
			background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
			filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
			background-color:#f6f6f6;
		}
		#sendId:active {
			position:relative;
			top:1px;
		}
		</style>
	</head>
	<body>
		<div>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		</div>
		 <div id="content">
    <div id="list">
        <ul id="topUi">
            <li id="topLi"><a class="a1" href="Find_Id" >아이디 찾기</a></li>
            <li id="topLi"><a class="a1" href="Find_Pw">비밀번호 찾기</a></li>
        </ul>
        
    </div>
    
    <br/>
    <hr class="one">
    <h4 id="idf">아이디 찾기</h4>
    <p class="p1">회원 가입시, 입력하신 회원 정보 또는 본인 인증으로 아이디를 확인할 수 있습니다.
        <br/> 아이디는 가입시 적어주신 이메일로 보내 드립니다.</p>
    <br/>
    <br/> ■<b>본인 확인용 정보로 찾기</b>
    <br/>    
    <form action="FindId_userEmail">
        <ul>
            <li>이름 :
                <input id="userName" name="user_Name" type="text" size="14" maxlength="14" />
            </li>
<<<<<<< HEAD
            <li>
            	이메일:
            	<form name="form" method="post">
					<input name="email1" type="text" class="box" id="email1" size="15"> @ <input name="email2" type="text" class="box" id="email2" size="20">
					<select name="email_select" class="box" id="email_select" onChange="checkemailaddy();">
				    <option value="" selected>선택하세요</option>
				    <option value="naver.com">naver.com</option>
					<option value="daum.com">daum.net</option>
					<option value="gmail.com">gmail.com</option>	
				    <option value="1">직접입력</option>
					</select>
				</form>
            <p class="p2">*회원 가입시 작성한 이름과  이메일을 입력하세요.</p>
           </li>
        </ul>
        <center>
            <input id="sendId" type="submit" value="확인" />
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
=======
            <li>phone :
                <select id="phone1" name="userPhone">
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
            	<p class="p2"> *회원 가입시 작성한 이름과 전화번호, 이메일을 입력하세요.></p>
            	
        </ul>
        <center>        
          	<input id="sendId" type="submit" value="확인" />   
        </center>               
        </form>
	</div>	
	</body>	
	<script>	
>>>>>>> 7c974ebe7ee00507105e0b97aecd8b60f5d0882b
	</script>
</html>