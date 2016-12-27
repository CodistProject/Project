<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
 	<head>
  	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	  <title>마이페이지 메뉴</title>
	  <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <style>
         #Admin
         {           
            position: absolute;
         	top: 15%;
         	clear: left;
         	float: left;
         	margin-left: 10px;
         	width: 120px;
         	height: 800px;   
         	left: 120px;
         	top: 25%;
         }
      #Admin a 
      {
         padding-top: 5px;
         display: block;
         height: 20px;
         text-align: center;
         font-weight: bold;
         text-decoration: none;
      }         
      </style>
   </head>
   <body>   
       <div id="Admin">
          <a href="./MemberData_view?userId=${sessionScope.userId}">회원정보 보기</a>
          <a href="./Member_modify_view?userId=${sessionScope.userId}">회원정보 수정</a>
          <a href="#"> 마일리지 </a>
          <a href="#"> 쿠폰함 </a>
          <a href="./Mypage_Withdrawal?userId=${sessionScope.userId}"> 회원 탈퇴 </a>
        </div>
      <div>      
      <table>
           <tr>
              <td>
              </td>
           </tr>
        </table>
      </div>
   </body>
   <script></script>
</html>