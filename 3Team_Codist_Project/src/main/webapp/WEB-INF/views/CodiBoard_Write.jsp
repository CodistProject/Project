<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디 게시판 글쓰기 </title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/Board.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/codiBoard.css"/>
		
	</head>
	<body>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		<div class="content">
			<form action="CodiBoard_Writes" method="post" enctype="multipart/form-data">		
			<!-- 체크박스 -->
    		<table class="boardwrite">
    			<tr>
    				<td class="align" colspan="2">코디 게시판</td>
    				<input type="hidden" name="category" value="CB" />
    			</tr>
    			<tr>
    				<td class="alignleft" colspan="2">    					
    					<input id="outter" type="checkbox" onclick="check()"/>외투 추가
    					<input id="top" type="checkbox" onclick="check()"/>상의 추가
    					<input id="Pants" type="checkbox" onclick="check()"/>하의 추가    				 					
    				</td>    				
    			</tr>
    			</table> 
    			
    			<table class="boardwrite" style="display: inline">     			
    			<tr> 
    				<td class="align">코디</td>
    				<td class="align1" rowspan="3">
    				<input type="file" name="file1" value="첨부" onchange="fileView(this,1)"/>
					<input  id="filenames1"  type="hidden" name="filename1"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="CB2"  style="display: none">
    				코디 이름:<input name='CBname' type="text" />
    				</td>
  				</tr>
  				<tr>
    				<td id="CB3"  style="display: none">
    				추가 설명:<input name='CBplus' type="text"/>
    				</td>
    			</tr>
    			</table>
    			
    			<table class="boardwrite" id="outter1" style="display: none"> 
    			<tr >
    				<td class="align">외투</td>
    				<td class="align1" rowspan="4">
    				<input type="file" name="file2" value="첨부" onchange="fileView(this,2)"/>
					<input  id="filenames2"  type="hidden" name="filename2"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="outter2" style="display: none">
    					분류:<select name="OutterCloth" >
							<option value="">선택해주세요</option>
							<option value="블레이져/코트">블레이져/코트</option>
							<option value="점퍼/패딩"> 점퍼/패딩</option>
							<option value="자켓/야상">자켓/야상</option>
							<option value="블루종/항공점퍼">블루종/항공점퍼</option>
							<option value="패딩조끼">패딩조끼</option>
							<option value="후드집업">후드집업</option>
							<option value="가디건/베스트">가디건/베스트</option>
						</select>
    					외투 이름:<input name='Outtername' type="text"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="outter3" style="display: none">
    				추가 설명:<input name='Outterplus' type="text"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="outter4" style="display: none">
    				판매 주소(IP):<input name='OutterUrl' type="text" placeholder="ex)www.naver.com"/>
    				</td>
    			</tr>
    			</table>
    			
    			<table class="boardwrite" id="top1" style="display: none"> 
    			<tr>
    				<td class="align">상의</td>
    				<td class="align1" rowspan="4">
    				<input type="file" name="file3" value="첨부" onchange="fileView(this,3)"/>
					<input  id="filenames3"  type="hidden" name="filename3"/>
    				</td>
    			</tr>
    			<tr >
    				<td id="Top2" style="display: none">
    				분류:<select name="TopCloth" >
							<option value="">선택해주세요</option>
							<option value="KNIT">KNIT</option>
							<option value="TEE"> TEE</option>
							<option value="SHIRTS">SHIRTS</option>
						</select>
    				상의 이름:<input name='Topname' type="text"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="Top3" style="display: none">
    				추가 설명:<input name='Topplus' type="text"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="Top4" style="display: none">
    				판매 주소(IP):<input name='TopUrl' type="text" placeholder="ex)www.naver.com"/>
    				</td>
    			</tr>
    			</table>
    			
    			<table class="boardwrite" id="Pants1" style="display: none;"> 
    			<tr>
    				<td class="align">하의</td>
    				<td class="align1" rowspan="4">
    				<input type="file" name="file4" value="첨부" onchange="fileView(this,4)"/>
					<input  id="filenames4"  type="hidden" name="filename4"/>
    				</td>
    			</tr>
    			<tr>
    				<td  id="Pants2" style="display: none">
    				분류:<select name="PantsCloth" >
							<option value="">선택해주세요</option>
							<option value="청바지">청바지</option>
							<option value="슬랙스"> 슬랙스</option>
							<option value="면바지">면바지</option>
							<option value="밴딩">밴딩</option>
							<option value="트레이닝">트레이닝</option>
							<option value="반바지">반바지</option>
							<option value="비치웨어">비치웨어</option>
						</select>
    				하의 이름:<input name='Pantsname' type="text"/>
    				</td>
    			</tr>
    			<tr>
    				<td  id="Pants3" style="display: none">
    				추가 설명:<input name='Pantsplus' type="text"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="Pants4" style="display: none">
    				판매 주소(IP):<input name='PantsUrl' type="text" placeholder="ex)www.naver.com"/>
    				</td>
    			</tr>
    			
    			</table>
    			
    			<table class="boardwrite"> 			
				<tr>
				<td align="right" colspan="2">					
					<input type="submit" class="button" value="등록"/>
					<input type="reset"  class="button" value="취소"/>				
				</td>
			</tr>			
    		</table>
    		</form>	
		</div>	
	</body>
	<script>
	
	//첨부파일 이름 가져오기
	function fileView(elem,i){
		console.log(elem.value);
		var fullPath = elem.value;
		var filename = fullPath.substring(12);
		console.log(filename);
		$("#filenames"+i).val(filename);
	
		if(i==1)
			{
			$("#CB2").css("display","block");
			$("#CB3").css("display","block");
			}
		if(i==2)
		{
			$("#outter2").css("display","block");
			$("#outter3").css("display","block");
			$("#outter4").css("display","block");
		}
		if(i==3)
		{
			$("#Top2").css("display","block");
			$("#Top3").css("display","block");
			$("#Top4").css("display","block");
		}
		if(i==4)
		{
			$("#Pants2").css("display","block");
			$("#Pants3").css("display","block");
			$("#Pants4").css("display","block");
		}
	}
	
	//체크
	function check() {
		var outter = false;
		var top = false;
		var bottom = false;
		
		if($('#outter').is(":checked")){
			outter = true;
		}
		if($('#top').is(":checked")){
			top = true;
		}
		if($('#Pants').is(":checked")){
			bottom = true;
		}

		if(outter==true){
			$("#outter1").css("display","inline");
		}else{
			$("#outter1").css("display","none");
		}
		if(top==true){
			$("#top1").css("display","inline");
		}else{
			$("#top1").css("display","none");
		}		
		if(bottom==true){
			$("#Pants1").css("display","inline");
		}else{			
			$("#Pants1").css("display","none");
		}		
	}	
	

	
	

	</script>

</html>