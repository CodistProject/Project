<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>코디를 부탁해 메인</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
		div.img1{
				border: 1px solid;
				position: absolute;
				left: 230px;
				top: 215px;
		}
			
		div.img2{
				border: 1px solid;
				position: absolute;
				left: 550px;
				top: 215px;
			}
		div.img3{
				border: 1px solid;
				position: absolute;
				left: 730px;
				top: 215px;
			}
		div.img4{
				border: 1px solid;
				position: absolute;
				left: 550px;
				top:400px;
			}
		
		.te{
			position:absolute;
			left: 230px;
			top: 600px;
		}
		
	/* 	.rep{
			border: 1px solid;
			position:absolute;
			left: 230px;
			top: 600px;
		} */
		.reply{
			position: absolute;
			left: 230px;
			top:600px;
		}
	
		</style>
 	</head>
  	<body>
  
  	<jsp:include page="../../resources/include/index.jsp"></jsp:include>
  	<div class="content">
   		<div class="img1">
   			</br/>
   			<img src="#" width="300" height="335" alt="이미지1"/>
   		</div>
   		
   		<div  class="img2">
   		  	상의
   			</br>   			
   			<img  src="#" width="150" height="150" alt="이미지2"/>
   		</div>
   		
   		<div  class="img3">
   			하의
   		</br>
   			<img  src="#" width="150" height="150" alt="이미지3"/>
   		</div>
   		
   		<div  class="img4">
   			외투
   		</br>
   			<img  src="#" width="150" height="150" alt="이미지4"/>
   		</div>
   	
   	<div class="reply">
   	<table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>댓글</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="subject" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="contents" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록">
       <input type=button value="취소">
       <input type="button" value="목록">
      <td>&nbsp;</td>
      </tr>
  	
   </table>
   
   </div>
   </div>
  	</body>
  	<script>
  	
  	</script>
</html>