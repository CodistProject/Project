<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>관리자 회원 관리 페이지</title>
      <style>
         .y
         {
            text-decoration: none;
            
         }
         #o,.p
         {
            border:1px solid;
            border-collapse: collapse;
            padding: 20px;
            font-size: 20px;
            text-align: center;
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
  
         
      </style>
   </head>
   <body>
   <jsp:include page="AdminPage.jsp"></jsp:include>
      <div class="messageDiv">
       <span id="i">회원 리스트 </span>
        <table id="o">
           <tr class="l">
            <td class="p">ID</td>
            <td class="p">이름</td>
            <td class="p">생년월일</td>
            <td class="p">가입일</td>
            <td class="p">탈퇴</td>           
           </tr>
           <tr>
            <td class="p">ID1</td>
            <td class="p">이름1</td>
            <td class="p">0000-00-00</td>
            <td class="p">0000-00-00</td>
            <td class="p"><a href="#" class="y">x</a></td>           
           </tr>
        </table>
     </div>
   </body>
   <script></script>
</html>