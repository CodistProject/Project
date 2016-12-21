<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>관리자 페이지 메뉴</title>
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
   <jsp:include page="index.jsp"></jsp:include>
  
        <div id="Admin">
          <a href="./AdminMember"> 회원 관리</a>
          <a href="./AdminMessage"> 쪽지 관리</a>
          <a href="#"> 이벤트 관리</a>
          <a href="#"> 마일리지 관리</a>
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