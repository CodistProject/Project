<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<title>코디를 부탁해 글쓰기</title>
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
		.det{
			position:absolute;
			left: 230px;
			top: 600px;
		}	
		
		</style>
 	</head>
  	<body>
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
   		<div class="det">
   			<table>
   			</br>
   				<tr>
   					<td>외투 <input type="button" value="첨부"/></td>
   					<td>
   						</br>
   						</br>
   						</br>
   						</br>
   						</br>
   					</td>
   				</tr>
   			</br>
   				<tr>
   					<td>상의 <input type="button" value="첨부"/></td>
   				</tr>	
   			</br>
   				<tr>
   					<td>하의 <input type="button" value="첨부"/></td>
   				</tr>	
   				<tr>
   					<td> 
   						<input type="button" value="등록"/>
   					 	<input type="button" value="취소"/>
   					 </td>
   				</tr>
   			</table>
   		</div>
   </div>
  	</body>
</html>