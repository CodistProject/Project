<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 회원관리 리스트 페이지</title>				
		<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
		<style>		  				
		 .y
         {
            text-decoration: none;
            
         }
         #o
         {
            border:1px solid;
            border-collapse: collapse;           
            font-size: 10px;
            text-align: center;
            width : 400px;            
         }
         .p{
         	border:1px solid;
            border-collapse: collapse;
            font-size: 10px;
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
   <div>
   		<jsp:include page="../../resources/include/AdminPage.jsp"></jsp:include>
    </div>	  
      <div class="messageDiv">      	
       <span id="i">★ 마일리지-쿠폰 관리</span>
        <table id="o" align="center">
        <thead>
           <tr class="l">
            <td class="p">번호</td>
            <td class="p">사용자(ID)</td>
            <td class="p">닉네임</td>
            <td class="p">이름</td>
            <td class="p">PHONE</td>           
            <td class="p">생년월일</td>
            <td class="p">성별</td>
            <td class="p">이메일</td>
            <td class="p">생성일</td>
            <td class="p">강제탈퇴</td>
           </tr>
          </thead>
          <tbody id="list">          
          </tbody>          
        </table>
     </div>
	</body>
	<script>	
	
	// 회원 리스트 함수 실행
	Member_list();
	
	// 회원 리스트 함수 실행(url, data 담고 리스트콜로 보내기)
	function Member_list(){
		var url="rest/Member_list";
		var data={};
		Member_listCall(url, data);	
	};
	
	// 회원 리스트 콜 함수 실행(아작스처리)		
	function Member_listCall(url, data){
		$.ajax({
			url: url,
			type: "post",
			data: data,
			dataType: "json",
			success : function(data){
				console.log(data);
				// 리스트 뿌려주기
				printList(data.list);
			}, error : function(error){
				console.log(error);
			}
		});
	} 
	
	// 리스트 뿌려주는 함수(마일리지+쿠폰)
	function printList(list){
		var content="";
		for(var i=0; i<list.length; i++){
			console.log(list[i].user_id);
			content += "<tr>"
					 +"<td class='p'>"+list[i].join_Idx+"</td>"
					 +"<td class='p'>"+list[i].id+"</td>"
					 +"<td class='p'>"+list[i].nickName+"</td>"
					 +"<td class='p'>"+list[i].name+"</td>"
					 +"<td class='p'>"+list[i].phone+"</td>"
					 +"<td class='p'>"+list[i].birth+"</td>"
					 +"<td class='p'>"+list[i].gender+"</td>"				   
					 +"<td class='p'>"+list[i].email+"</td>"
					 +"<td class='p'>"+list[i].reg_date+"</td>"
					 +"<td class='p'>"+"<a href='./withdrawa2?userId="+list[i].id+"'>"+"X"+"</a>"+"</td>"
					 +"</tr>";			
		}				  
	    $("#list").empty();
	    $("#list").append(content);				 
	}	
	
	</script>
</html>
	