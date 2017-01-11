<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>관리자 수정페이지</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			.content{
				position: absolute;
				top: 215px;
				left: 450px;
				
			} 
			.te{
				text-align: right;
			}
			.right{
			text-align: right;
			}
			td{
				border: 1px solid;
			}
		</style>
 	</head>
  	<body>
   		<div class="content">
   		<table>
   			코디 계시판
   			<div class="te">
   				<tr>
   					<td>제목 :</td>
   				</tr>
   				<tr>
   					<td>작성자 :</td>
   				</tr>
   				<tr>
   					<td>내용 :</td>
   				</tr>
   				<tr>
   					<td>
   						<input type="file" value="첨부파일"/>
   					</td>
   				</tr>
   			
   			</div>
   			<tr>
   				<td class="right">
   					<input type="button" value="수정"/>
   					<input type="button" value="취소"/>
   				</td>
   			</tr>
   		</table>
   		</div>
  	</body>
</html>