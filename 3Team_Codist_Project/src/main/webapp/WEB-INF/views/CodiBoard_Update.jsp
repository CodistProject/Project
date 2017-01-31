<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>관리자 수정페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/Board.css"/>
		<link rel="stylesheet" type="text/css" href="resources/css/codiBoard.css"/>
		
	</head>
	<body>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		<div class="content">
			<form action="Codiboard_update" method="post" enctype="multipart/form-data">		
			<!-- 체크박스 -->
    		<table class="boardwrite">
    			<tr>
    				<td class="align" colspan="2">코디 게시판</td>
    			</tr>
    			<tr>
    				<td class="alignleft" colspan="2"> 
    					<span  id="outterP" ><input type="checkbox" id="outter" onclick="check()" />외투 추가</span>
    					<span id="topP" ><input  type="checkbox" id="top"  onclick="check()"/>상의 추가</span>
    					<span  id="PantsP"><input type="checkbox"  id="Pants"onclick="check()"/>하의 추가 </span>
    				</td>    				
    			</tr>
    			</table> 
    			<table class="boardwrite" style="display: inline">     			
    			<tr> 
    				<td class="align">코디</td>
    				<td class="align1" rowspan="3">
    				<input type="file" name="file1" onchange="fileView(this,1)"/>
					<input  id="filenames1"  type="hidden"  name="filename1" value="${content.filename}"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="CB2">
    				코디 이름:<input name='CBname' type="text" value="${content.subject}" />
    				</td>
  				</tr>
  				<tr>
    				<td id="CB3">
    				추가 설명:<input name='CBplus' type="text" value="${content.sub_subject}"/>
    				날씨:<select name="CBweather" >
							<option value="">선택해주세요</option>
							<option value="sunny">Sunny</option>
							<option value="rain">Rain</option>
							<option value="snow">Snow</option>
						</select>
    				</td>
    			</tr>
    			</table>
    			<table class="boardwrite" id="outter1" style="display: none"> 
    			<tr>
    				<td class="align">외투</td>
    				<td class="align1" rowspan="4">
    				<input type="file" name="file2" value="첨부" onchange="fileView(this,2)"/>
					<input  id="filenames2"  type="hidden" name="filename2"/>
    				</td>
    			</tr>
    			<tr>
    				<td id="outter2" style="display: none">
    				<input  id="OutterClothHidden"  type="hidden" value="${dto.cloth_name}"/>
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
    				<input  id="TopClothHidden"  type="hidden" value="${dto.cloth_name}"/>
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
    				<input  id="PantsClothHidden"  type="hidden" value="${dto.cloth_name}"/>
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
					<input type="submit" class="button" value="수정"/>
					<input type="reset"  class="button" value="취소"/>				
				</td>
			</tr>			
    		</table>
    		</form>	
		</div>	
	</body>
	<script>
	
	var weather="${content.weather}";
	var file1="${content.filename}";
	
	$(document).ready(function(){
		$("select[name='CBweather']").val(weather);
		if(${subcontent[0].category_name=="Outer"})
			{
			$("#outterP").html("외투 수정/")
			$("#outter1").css("display","inline");
			$("#outter2").css("display","block");
			$("#outter3").css("display","block");
			$("#outter4").css("display","block");
			$("select[name='OutterCloth']").val($("#OutterClothHidden").val());
			$("input[name='Outtername']").val("${subcontent[0].real_name}");
			$("input[name='Outterplus']").val("${subcontent[0].cloth_detail}");
			$("input[name='OutterUrl']").val("${subcontent[0].cloth_url}");
			}
		if(${subcontent[1].category_name=="Top"})
			{
			$("#topP").html("상의 수정/")
			$("#top1").css("display","inline");
			$("#Top2").css("display","block");
			$("#Top3").css("display","block");
			$("#Top4").css("display","block");
			$("select[name='TopCloth']").val($("#TopClothHidden").val());
			$("input[name='Topname']").val("${subcontent[2].real_name}");
			$("input[name='Topplus']").val("${subcontent[2].cloth_detail}");
			$("input[name='TopUrl']").val("${subcontent[2].cloth_url}");
			}
		if(${subcontent[2].category_name=="Pants"})
			{
			$("#PantsP").html("하의 수정")
			$("#Pants1").css("display","inline");
			$("#Pants2").css("display","block");
			$("#Pants3").css("display","block");
			$("#Pants4").css("display","block");
			$("select[name='PantsCloth']").val($("#PantsClothHidden").val());
			$("input[name='Pantsname']").val("${subcontent[1].real_name}");
			$("input[name='Pantsplus']").val("${subcontent[1].cloth_detail}");
			$("input[name='PantsUrl']").val("${subcontent[1].cloth_url}");
			}
			
	});
	
	//파일 이름가져오기
	function fileView(elem,i){
		console.log(elem.value);
		var fullPath = elem.value;
		var filename = fullPath.substring(12);
		console.log(filename);
		$("#filenames"+i).val(filename);
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