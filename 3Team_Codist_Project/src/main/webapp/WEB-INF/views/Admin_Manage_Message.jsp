<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>관리자 쪽지 관리 페이지</title>
      <style>
         .y
         {
            text-decoration: none;
            
         }
         #o
         {
            border:1px solid;
            border-collapse: collapse;           
            font-size: 13px;
            text-align: center;
            width : 550px;            
         }
         .p{
         	border:1px solid;
            border-collapse: collapse;
            font-size: 13px;
            text-align: center;
            padding: 10px;
           }
         .l
         {
            background-color: blue;
            color: white;
         }
         .messageDiv
         {
         position: absolute;         
         top: 25%;
         left:25%;         
         }
         .b{
         	border : 1px solid white;
         }
      </style>
   </head>
   <body>
      <jsp:include page="../../resources/include/index.jsp"></jsp:include>
   <jsp:include page="../../resources/include/AdminPage.jsp"></jsp:include>
      <div class="messageDiv">
       <span id="i">쪽지 확인</span>
        <table id="o">
           <tr class="l">
            <td class="p">번호</td>
            <td class="p">사용자(ID)</td>
            <td class="p">내용</td>
            <td class="p">작성일</td>
            <td class="p">삭제</td>           
           </tr>
           <c:forEach items="${list}" var="dto">
	           <tr>
	            <td class="p">${dto.join_idx }</td>
	            <td class="p">${dto.user_id }</td>
	            <td class="p">${dto.letter_content }</td>
	            <td class="p">${dto.letter_date }</td>
	            <td class="p"><a href="#" class="y">x</a></td>           
	           </tr>
           </c:forEach>
        </table>
     </div>
   </body>
   <script>
   NewUpdate();
   
   function NewUpdate(){
		var url="./rest/NewUpdate";
		var data = {};
		reqServer(url, data);
	}
	
	function reqServer(url, data){
		console.log(url);
		$.ajax({
			url:url,
			type:"post",
			data:data,
			dataType:"json",
			success:function(d){
				console.log(d)
				if(url="./rest/NewUpdate"){
					if(d.msg==1)
						{
						alert("쪽지를 확인 하였습니다.")
						}
					}
				},error:function(e){
						console.log(e)
					}
		});
	}
   </script>
