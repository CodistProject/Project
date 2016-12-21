 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>물물 교환 게시판 </title>
      <style>
      .b,#a
      {
         border: 1px solid;
         border-collapse: collapse;
         padding: 5px;
      }
      .b
      {
         padding: 10px;
      }
      #alterForm
      {
         width: 500px;
         height: 500px;
         position: relative;
         left: 380px;
         top:150px;
      }
      #writeForm
      {
         position: absolute;
         left:260px;
      }
      
      </style>
   </head>
   <body>
   
      <jsp:include page="../../resources/include/index.jsp"></jsp:include>
   <div id="alterForm">
      <table id="a">
         <thead>
            <tr>
               <td colspan="5"> <h1>물물 교환</h1></td>
            </tr>
         
            <tr>
               <th class="b">번호</th>               
               <th class="b">제목</th>
               <th class="b">이미지</th>
               <th class="b">작성자</th>
               <th class="b">조회수</th>
            </tr>
         </thead>
         <tbody id="list">         
        	<!-- 내용이 들어갈 자리 -->    
        </tbody>
         <tr>
            <td colspan="5" id="paging">
               <div id="pagenation">이전 1 2 3 4 5 6 다음</div>
            </td>
         </tr>
      </table>
      <div id="writeForm"><button onclick="location.href='#'">글쓰기</button></div>
    </div>
   </body>
   <script></script>
</html>