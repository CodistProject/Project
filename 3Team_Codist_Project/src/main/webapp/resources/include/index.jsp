<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>인덱스</title>
		 <link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
		 <link rel="stylesheet" type="text/css" href="resources/css/button.css"/>
		<style>
		#daily_pop{				
				position:absolute;
				background-color: #6BADFF;
				z-index:20;
				width: 400px;
				height: 200px;				
				top: 180px;
				left: 135px;
				display:none;
			}
			
			#tomorrow_pop{				
				position:absolute;
				background-color: #E5FF6B;
				z-index:20;
				width: 400px;
				height: 200px;				
				top: 245px;
				left: 135px;
				display:none;
			}					
			
			#logo{
				width: 200px;
			}
			
			#codi1{
				float: right;
			}
			
			#dailywe{
				float: left;
			}
			
			#tomwwe{
				float: left;
			}
			.content{				
				margin-left: 130px;
				margin-right: 130px;				
				width: 840px;
			}
			
			#ask{
				border: 1px solid;
				height: 150px;
			}
			
			#ask1{
				text-align: center;
			}
			
			#askBox{
				border: white;				
				resize:none;
			}
		</style>
	</head>
	<body>
		<div id="head">
			<a href="./"><img id="logo" alt="로고" src="../../main/resources/img/logo.png"></a>			
		</div>
		<br/><br/>
		<div id="weather">
			<a class="top" href="javascript:Event();">이벤트</a>	
			<br/>		
			<a id="daily" class="top">Daily<br/>Cody</a>
			<br/><br/>						
			<a id="tomorrow" class="bottom">Tomorrow Cody</a>			
		</div>	
		<div id="extra">
			<div id="loginSession">
				<c:if test="${sessionScope.userId ==null}">
					<jsp:include page="loginBox.jsp"></jsp:include>					 
				</c:if>
				
				<c:if test="${sessionScope.userId !=null}">
					<jsp:include page="login_Session.jsp"></jsp:include>
				</c:if>
			</div>
			
			<br/>
				<table class="serch">
					<tr>
						<td>		
							<input type="text" size="18">
							<input type="button" class="serchbtn" value="검색"> 
						</td>						
					</tr>
				</table>
			<br/>
			<div id="ask">
				<textarea id="askBox" cols="28px" rows="8px" placeholder="답변 받을 이메일 주소 입력 : "></textarea>			
				<div id="ask1">
				<input  type="button" class="askbtn" value="쪽지" />
				<input type="button"  class="askbtn" value="이메일" name="email"/>				
				</div>				
			</div>
		</div>
		<div id="menu">		
			<table class="menu">
				<tr class="menu">
					<td class="menuTd"><a class="board" href="./CodiBoard">코디 게시판</a></td>
					<td class="menuTd"><a class="board" href="./FTBoard">패션토크 게시판</a></td>
					<td class="menuTd"><a class="board" href="./CoplzBoard">코디를 부탁해</a></td>
					<td class="menuTd"><a class="board" href="./My_Calendar?userId=${sessionScope.userId}">나만의 옷장</a></td>
					<td class="menuTd"><a class="board" href="./QnABoard">Q&A</a></td>
					<td class="menuTd"><a class="board" href="./AlterBoard">물물 교환</a></td>									
				</tr>
			</table>
		</div>
		
		<!-- daily 팝업 -->
		<div id="daily_pop">				
			<div id=dailywe>
			 날씨
			</div>
			<div id="codi1">
			코디
			</div>			
		</div>	
		
		<!-- tomorrow 팝업 -->
		<div id="tomorrow_pop">				
			<div id=tomwwe>
			 날씨
			</div>
			<div id="codi1">
			코디
			</div>		
		</div>		
	</body>
	<script>	
		// 당일 마우스 마우스오버
		$("#daily").hover(function () {
			var html = "";			
			$("#daily_pop").css("display","block");
			$(".today").empty();
			 $.getJSON("http://api.openweathermap.org/data/2.5/forecast/daily?&APPID=b50260aefcd6ed0822969e46440ce7df&lat=37.56826&lon=126.977829&mode=json&units=metric&cnt=2",function(json){
				  /*       document.write(JSON.stringify(json)); */
				        var json_obj = JSON.parse(JSON.stringify(json));
				  		var url = "http://openweathermap.org/img/w/";
				  		var icon = json_obj.list[0].weather[0].icon;
				  		var max = json_obj.list[0].temp.max+" ℃";
				  		var min = json_obj.list[0].temp.min+" ℃";
				  		var url1 = url + icon+".png";				  	
				  		html += '<div class="today"><img src="'+url1+'" width="70px"><br/>';
				  		html +='최고 기온: '+max+' <br/>최저 기온: '+ min+''		
			            html +='</div>'				  		
				  		$("#dailywe").append(html);				          	
				    });	  			 
		},function () {
			$("#daily_pop").css("display","none");		
		});				
		
		// 다음날 마우스 마우스오버
		$("#tomorrow").hover(function () {			
			var html = "";			
			$("#tomorrow_pop").css("display","block");
			$(".tom").empty();
			 $.getJSON("http://api.openweathermap.org/data/2.5/forecast/daily?&APPID=b50260aefcd6ed0822969e46440ce7df&lat=37.56826&lon=126.977829&mode=json&units=metric&cnt=2",function(json){
				 var json_obj = JSON.parse(JSON.stringify(json));
			  		var url = "http://openweathermap.org/img/w/";
			  		var icon = json_obj.list[1].weather[0].icon;
			  		var max = json_obj.list[1].temp.max+" ℃";
			  		var min = json_obj.list[1].temp.min+" ℃";
			  		var url1 = url + icon+".png";					  		
			  	
			  		html += '<div class="tom"><img src="'+url1+'" width="70px"><br/>';	
			  		html +='최고 기온: '+max+' <br/>최저 기온: '+min+''			  		
		            html +='</div>'				  		
			  		$("#tomwwe").append(html);			       	
				    });			 
				
		},function () {
			$("#tomorrow_pop").css("display","none");			
		});	
		
	
	   // 유저 아이디, 유저 메일, 관리자 메일 담기
		var userId ="${sessionScope.userId}";		
		
		// 이벤트 팝업
		function Event(){
			var Popup_url = "./Event_Popup";
			var Popup_option = "width=500px, height=600px, resizalbe=no, top=200px, left=400px";
			window.open(Popup_url,"",Popup_option);
		}
		
		// 이메일 문의(url, data 담아서 아작스처리)
		$("input[name='email']").click(function(){
			console.log("이메일 처리");
			url = "./rest/Email";
			data={};
			data.userId = userId;			
			data.content=$("#askBox").val();			
			// console 로 data 담은 것들 제대로 담겼는지 체크
			// 유저 정보
			console.log(data.userId);	
			console.log(data.content);				
			
			// 아작스로 보내서 처리(url, data)
			ajaxCall(url, data);
		});		
		
		// 아작스 처리(이메일 문의)
		function ajaxCall(reqUrl, reqData){
			console.log(reqUrl);			
			$.ajax({
				url : reqUrl,				
				type : "post",
				data : reqData,
				dataType : "json",
				success:function(data){
					console.log(data);
					console.log("성공");
					if(url=="./rest/Email"){									
						alert("문의하신 내용이 이메일 전송이 완료되었습니다.");
					}else{
						alert("이메일 전송이 실패하였습니다!");			
					}					
				}, error : function(e){
					console.log("에러");
				}
			});
		}
		
		$("#eventclose").click(function(){					
			self.close();		
		})
		
	</script>	
</html>