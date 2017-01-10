<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>코디 게시판 글쓰기 </title>
		<script src ="//code.jquery.com/jquery-3.1.0.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/Board.css"/>
		
	</head>
	<body>
			<jsp:include page="../../resources/include/index.jsp"></jsp:include>
		<div class="content">
			<form action="CodiBoard_Writes" method="post" enctype="multipart/form-data">		
    		<table class="boardwrite">
    			<tr>
    				<td class="align" colspan="2">코디 게시판</td>
    				<input type="hidden" name="category" value="CB" />
    			</tr>
    			<tr>
    				<td class="alignleft" colspan="2">    					
    					<input id="outter" type="checkbox" onclick="check()"/>외투 추가
    					<input id="top" type="checkbox" onclick="check()"/>상의 추가
    					<input id="bottom" type="checkbox" onclick="check()"/>하의 추가    				 					
    				</td>    				
    			</tr>
    			</table> 
    			<table class="boardwrite" style="display: inline;";>     			
    			<tr> 
    				<td class="align">코디</td>
    				<td class="align1">
    				<input type="file" name="file1" value="첨부" onchange="fileView(this)"/>
					<input  id="filenames1"  type="hidden" name="filename1"/>
    				</td>
    			</tr>
    			</table>
    			<table class="boardwrite" id="outter1" style="display: none;"> 
    			<tr >
    				<td class="align">외투</td>
    				<td class="align1">
    				<input type="file" name="file2" value="첨부" onchange="fileView(this)"/>
					<input  id="filenames2"  type="hidden" name="filename2"/>
    				</td>
    			</tr>
    			</table>
    			<table class="boardwrite" id="top1" style="display: none;"> 
    			<tr>
    				<td class="align">상의</td>
    				<td class="align1">
    				<input type="file" name="file3" value="첨부" onchange="fileView(this)"/>
					<input  id="filenames3"  type="hidden" name="filename3"/>
    				</td>
    			</tr>
    			</table>
    			<table class="boardwrite" id="bottom1" style="display: none;"> 
    			<tr>
    				<td class="align">하의</td>
    				<td class="align1">
    				<input type="file" name="file4" value="첨부" onchange="fileView(this)"/>
					<input  id="filenames4"  type="hidden" name="filename4"/>
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
	
	function check() {
		var outter = false;
		var top = false;
		var bottom = false;
		
		if($('#outter').is(":checked")){
			outter = true;
		}if($('#top').is(":checked")){
			top = true;
		}if(($('#bottom').is(":checked"))){
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
			$("#bottom1").css("display","inline");
		}else{			
			$("#bottom1").css("display","none");
		}		
		console.log(outter);
	}	
	
				
		/* if($('#outter').is(":checked")){
			$("#outter1").css("display","inline");
		}if($('#top').is(":checked")){
			$("#top1").css("display","inline");
		}if(($('#bottom').is(":checked"))){
			$("#bottom1").css("display","inline");
		} */
		

	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}
	
	function fileView(elem){
		console.log(elem.value);
		var fullPath = elem.value;
		var filename = fullPath.substring(12);
		console.log(filename);
		$("#filenames1").val(filename);
		$("#filenames2").val(filename);
		$("#filenames3").val(filename);
		$("#filenames4").val(filename);
	}
	</script>

</html>