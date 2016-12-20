<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>코디 계시판 선택.창 리스트</title>
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>
			div.img1{
				border: 1px solid;
				position: absolute;
				left: 200px;
				top: 215px;
				text-align: center;
				
				}
			
			div.img2{
				border: 1px solid;
				position: absolute;
				left: 450px;
				top: 215px;
				text-align: center;
				}
			div.img3{
				border: 1px solid;
				position: absolute;
				left: 700px;
				top: 215px;
				text-align: center;
				}
			div.img4{
				border: 1px solid;
				position: absolute;
				left: 200px;
				top:500px;
				text-align: center;
				}
			div.img5{
				border: 1px solid;
				position: absolute;
				left: 450px;
				top:500px;
				text-align: center;
				}
			div.img6{
				border: 1px solid;
				position: absolute;
				left: 700px;
				top:500px;
				text-align: center;
			}
			.check
			{
			position: absolute;
			left: 150px;
			}
			.con{
				position: absolute;
				top: 800px;
				right: 400px;
			}
		</style>
 	</head>
  	<body>
   		<div class="content">
   		<div class="img1">
   		스타일 1
   	
   			<span class="check"><input type="checkbox" name="#" value="2"></span>
   			<br/>
   			<img src="#" width="200" height="200" alt="이미지1"/>  
   						
   		</div>
   		
   	
   		<div  class="img2">
   		  	스타일 2
   			
   		<span class="check"><input type="checkbox" name="#" value="2"></span>
   			<br/>	
   			<img  src="#" width="200" height="200" alt="이미지2"/>
   		</div>
   		
   		<div  class="img3">
   				스타일 3
   		
   		<span class="check"><input type="checkbox" name="#" value="2"></span>
   			<br/>
   			<img  src="#" width="200" height="200" alt="이미지3"/>
   		</div>
   		
   		<div  class="img4">
   				스타일 4

   		<span class="check"><input type="checkbox" name="#" value="2"></span>
   			<br/>
   			<img  src="#" width="200" height="200" alt="이미지4"/>
   		</div>
   		<div  class="img5">
   				스타일 5
   		
   		<span class="check"><input type="checkbox" name="#" value="2"></span>
   			<br/>
   			<img  src="#" width="200" height="200" alt="이미지5"/>
   		</div>
   		<div  class="img6">
   				스타일 6
   	
   		<span class="check"><input type="checkbox" name="#" value="2"></span>
   			<br/>
   			<img  src="#" width="200" height="200" alt="이미지6"/>
   		</div>
   		</div>
   		<div class="con">
   			<input type="button" value="글쓰기">
   			<input type="button" value="등록">
   		</div>
  	</body>
</html>