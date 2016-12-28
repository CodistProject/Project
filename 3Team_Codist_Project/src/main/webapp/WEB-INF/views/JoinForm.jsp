<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>회원가입 페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>			
			table{				
				border : 1px solid;
				border-collapse : collapse;
				padding : 5px;			
			}						
			#SignUp_sub h{
				font-size : 15pt;
				font-family : 굴림체;
			}
			#agree_chk{
				font-size : 13pt;
				font-family : 굴림체;	
				border : 1px solid white;						
			}
			#SignUp_table td{
				font-size : 8pt; 
				font-family : 굴림체;
			}
			#popup{
				position:absolute;
				z-index:2;
				width: 260px;
				height: 300px;
				background-color:white;
				border: 1px solid gray;
				top: 15%;
				left: 25%;
				display:none;
			}			
		</style>
	</head>
	<body>
	<div>
		<jsp:include page="../../resources/include/index.jsp"/>
	</div>
		<table id="SignUp_sub" align="center">
			<tr>
				<td>
					<h>회원 가입</h>			
				</td>
			</tr>			
		</table>		
				
		<!-- 가입 정보 확인 -->		
		<div id="popup">
			<!-- 가입정보 -->			
			<center>
			<h3> 회원가입을 축하 합니다.</h3>
			<table>
				<tr>
					<td>ID</td>
					<td id="memberId"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td id="memberName"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td id="memberNickName"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td id="memberGender"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td id="memberBirth"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td id="memberEmail"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td id="memberPhone"></td>
				</tr>
				<tr>
					<td>비밀번호 질문</td>
					<td id="memberPwQ"></td>
				</tr>
				<tr>
					<td>비밀번호 답</td>
					<td id="memberPwA"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="확인"
							onclick="location.href='./'"/>
					</td>
				</tr>
			</table>
		</center>
		</div>
		
			<table id="SignUp_table" align="center">
				<tr>
					<td>
						<!-- placeholder:바탕에 쓰기?  -->
						아이디 : <input name="SignUp_id" type="text" placeholder="정우철"/>
						<input id="Id_Chk" type="button" value="중복체크"/>
					</td>
				</tr>
				<tr>
					<td>
						닉네임 : <input name="SignUp_NickName" type="text"/>
						<input id="Nick_Chk" type="button" value="중복체크"/>		
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 : <input name="SignUp_pw" id="Pw" type="text" onkeyup="Check()" placeholder="비밀번호는 8자 이상입니다."/> 	
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 확인 : <input name="SignUp_pw_check" id="PwC" type="text" onkeyup="Check()"/>
						<font id="PW_checker"></font>			
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 질문 : <input name="PW_Q" type="text" value=""/>
						<select name="PW_Qs">
							<option value="">임의로 작성</option>
							<option value="아버지의 성함은?">아버지의 성함은?</option>
							<option value="어머니의 성함은?">어머니의 성함은?</option>
							<option value="나의 첫사랑의 이름은?">나의 첫사랑의 이름은?</option>
							<option value="내가 나온 초등학교 이름은?">내가 나온 초등학교 이름은?</option>
							<option value="내가 나온 고등학교 이름은?">내가 나온 고등학교 이름은?</option>
							<option value="내가 나온 대학교 이름은?">내가 나온 대학교 이름은?</option>
							<option value="가장 기억에 남는 추억의 장소는?">가장 기억에 남는 추억의 장소는?</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						비밀번호 답 : <input name="PW_answer" type="text"/>
					</td>
				</tr>					
				<tr>
					<td>
						이름 : <input name="SignUp_name" type="text"/>			
					</td>
				</tr>
				<tr>
					<td>
						전화번호 : 
						<select name="PhoneFirst" >
							<option value="">----</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
						</select>
						-
						<input name="PhoneMiddle" type="text" />
						-
						<input name="PhoneLast" type="text" />					
					</td>
				</tr>
				<tr>
					<td>
						생년월일 :				
						<select name="year">
							<option value="">----</option>
							<option value="1997">1997</option>
							<option value="1996">1996</option>
							<option value="1995">1995</option>
							<option value="1994">1994</option>
							<option value="1993">1993</option>
							<option value="1992">1992</option>
							<option value="1991">1991</option>
							<option value="1990">1990</option>
							<option value="1989">1989</option>
							<option value="1988">1988</option>
							<option value="1987">1987</option>
							<option value="1986">1986</option>
							<option value="1985">1985</option>
							<option value="1984">1984</option>
							<option value="1983">1983</option>
							<option value="1982">1982</option>
							<option value="1981">1981</option>
							<option value="1980">1980</option>
						</select>년
						<select name="month">
							<option value="">--</option>
							<option value="12">12</option>
							<option value="11">11</option>
							<option value="10">10</option>
							<option value="9">9</option>
							<option value="8">8</option>
							<option value="7">7</option>
							<option value="6">6</option>
							<option value="5">5</option>
							<option	value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>								
							<option value="1">1</option>
						</select>월
						<select name="day">
							<option value="">--</option>
							<option value="31">31</option>
							<option value="30">30</option>
							<option value="29">29</option>
							<option value="28">28</option>
							<option value="27">27</option>
							<option value="26">26</option>
							<option value="25">25</option>
							<option value="24">24</option>
							<option value="23">23</option>
							<option value="22">22</option>
							<option value="21">21</option>
							<option value="20">20</option>
							<option value="19">19</option>
							<option value="18">18</option>
							<option value="17">17</option>
							<option value="16">16</option>
							<option value="15">15</option>
							<option value="14">14</option>
							<option value="13">13</option>
							<option value="12">12</option>
							<option value="11">11</option>
							<option value="10">10</option>
							<option value="9">9</option>
							<option value="8">8</option>
							<option value="7">7</option>
							<option value="6">6</option>
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>								
						</select>일															
					</td>
				</tr>
				<tr>
					<td>
						성별 : 남 <input name="SignUp_gender" type="radio" value="남자"/>
				  			   여 <input name="SignUp_gender" type="radio" value="여자"/>			
					</td>
				</tr>
				<tr>
					<td>
						메일주소 : <input name="SignUp_email" type="text"/>	
						<select name="mailName">
							<option value="">임의로 작성</option>
							<option value="@naver.com">@naver.com</option>
							<option value="@daum.com">@daum.net</option>
							<option value="@gmail.com">@gmail.com</option>								
						</select>		
					</td>
				</tr>
				<tr>
					<td align="right">
						<input id="regist_btn" type="button" value="회원가입"/>				
					</td>
				</tr>
			</table>						
	
	</body>
	<script>
		var data;
		var overChkId = false;
		var overChkNick = false;
		var PWChk = false;
		var url;
		//중복(Id)체크
		$("#Id_Chk").click(function(){
			url="./rest/overlayId";
			data={};
			data.id=$("input[name='SignUp_id']").val();
			console.log(data);
			ajaxCall(url, data);
		});
		
		//중복(Nick)체크Nick_Chk
		$("#Nick_Chk").click(function(){
			url="./rest/overlayNick";
			data={};
			data.nick=$("input[name='SignUp_NickName']").val();
			console.log(data);
			ajaxCall(url, data);
		});
		
		//비밀번호 확인
		function Check(){
			var PW = $("#Pw").val();
			var PW_C = $("#PwC").val();
			console.log(PW);
			console.log(PW_C);
		        if(PW==PW_C)
		            {
		        	PWChk=true;
		        	$("#PW_checker").html("비밀번호가 일치합니다.");
		            }
		        else
		        	{
		        	PWChk=false;
		        	$("#PW_checker").html("비밀번호가 일치하지 않습니다.");
		        	}
		     }
		//숫자만 입력받게 하기
		$("input[name='PhoneMiddle']").keypress(function(event){
			if(event.which &&( event.which <=47 || event.which >=58) && event.which !=8)
				{
				event.preventDefault();
				alert("숫자만 입력 가능합니다!!");
				}
		});
		
		$("input[name='PhoneLast']").keypress(function(event){
			if(event.which &&( event.which <=47 || event.which >=58) && event.which !=8)
				{
				event.preventDefault();
				alert("숫자만 입력 가능합니다!!");
				}
		});
							
		
		//유효성 검사
		function validation(){			
			if(overChkId == false){
				alert("아이디 중복 체크를 해 주세요!!");
				return false;
			}else	if(overChkNick == false){
				alert("닉네임 중복 체크를 해 주세요!!");
				return false;
			}else if(PWChk == false){
				alert("비밀번호가 일치 해야 합니다!");
				return false;
			}else if(data.id == null || data.id == ""){
				alert("아이디는 필수 입력 사항 입니다.");
				return false;
			}else if(data.pw == null || data.pw == ""){
				alert("비밀번호는 필수 입력 사항 입니다.");
				return false;
			}else if(data.name == null || data.name == ""){
				alert("이름은 필수 입력 사항 입니다.");
				return false;
			}else{
				return true;
			}		
			
		}	
		//회원가입
		$("#regist_btn").click(function(){
			url="./rest/join";
			data={};
			data.id = $("input[name='SignUp_id']").val();
			data.nickname=$("input[name='SignUp_NickName']").val();
			data.pw = $("input[name='SignUp_pw']").val();
			if($("input[name='PW_Qs']").val()=="")
				{
				data.PW_QnA=$("input[name='PW_Q']").val();	
				}
			else
				{
				data.PW_QnA=$("select[name='PW_Qs']").val();	
				}
			data.PW_ANSWER=$("input[name='PW_answer']").val();
			data.name = $("input[name='SignUp_name']").val();
			data.phone= $("select[name='PhoneFirst']").val()+"-"+$("input[name='PhoneMiddle']").val()+"-"+$("input[name='PhoneLast']").val();
			data.birth=$("select[name='year']").val()+"/"+$("select[name='month']").val()+"/"+$("select[name='day']").val()
			data.gender = $("input[name='SignUp_gender']").val();
			if($("select[name='mailName']").val()=="")
				{
				data.email = $("input[name='SignUp_email']").val();
				}
			else
				{
				data.email = $("input[name='SignUp_email']").val()+$("select[name='mailName']").val();
				}
			console.log(data);
			
			if(validation()){
				ajaxCall(url, data);
			}
		});
		
		//요청 전송
		function ajaxCall(reqUrl, reqData){
			$.ajax({
				url:reqUrl,
				type:'get',
				data:reqData,
				dataType:'json',
				success:function(d){
					result(reqUrl, d);
				},error:function(e){
					console.log(e);
				}
			});
		}

		
		//아작스
		function result(url, data){
			console.log(url);
			//아이디 체크
			if(url=="./rest/overlayId"){
				if(data.useId=="Y"){
					overChkId= true;
					alert("사용 가능한 아이디 입니다.");
				}else{
					alert("이미 사용중인 아이디 입니다.");
					$("input[name='SignUp_id']").val("");
				}
			}
			//닉네임 체크
			if(url=="./rest/overlayNick"){
				if(data.useNick=="Y"){
					overChkNick = true;
					alert("사용 가능한 닉네임 입니다.");
				}else{
					alert("이미 사용중인 닉네임 입니다.");
					$("input[name='SignUp_NickName']").val("");
				}
			}
			//회원 정보 확인
			if(url =="./rest/join"){
				$("#popup").css("display","block");
				$("#memberId").html(data.id);
				$("#memberName").html(data.name);
				$("#memberNickName").html(data.nickname);
				$("#memberGender").html(data.gender);
				$("#memberBirth").html(data.birth);
				$("#memberEmail").html(data.email);
				$("#memberPhone").html(data.phone);
				$("#memberPwQ").html(data.pW_qna);
				$("#memberPwA").html(data.PW_ANSWER);
			}
			
			
		}
	</script>
</html>