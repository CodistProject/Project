<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <style>
      #d
      {
      position: absolute;
      left: 380px;
      }
      .a
      {
         text-decoration:none;
         text-align: right;
      }
      </style>
   </head>
   <body>
         <jsp:include page="index.jsp"></jsp:include>
        <div id="d">
        <form >
        <table>
           <tr>
              <td>
                 <select name="cordisearch" onchange="change()">
                     <option value="Total">전체</option>
                        <option value="CBoard">코디게시판</option>
                       <option value="FTBoard">패션토크게시판</option>
                     <option value="CPBoard">코디를부탁해</option>
                     <option value="AlBoard">물물교환</option>
                 </select>
              </td>
              <td>
              검색: <input type="text" id="searchName" size="40"/>
                    <input type="submit" value="검색"/>
              </td>
           </tr>
           <tr>
              <td colspan="2">
              <div id="CBoard2">
                 <h2><b>코디 게시판</b></h2>
                 <br/>
                 검색된 글1<br/>
                 검색된 글2<br/>
                 검색된 글3<br/>
                 <div class="a"><a href="#">+더보기</a></div>
              </div>
              </td>
           </tr>
           <tr>
              <td colspan="2">
              <div id="FTBoard2">
                 <h2><b>패션토크 게시판</b></h2>
                 <br/>
                 검색된 글1<br/>
                 검색된 글2<br/>
                 검색된 글3<br/>
                 <div class="a"><a href="#">+더보기</a></div>
              </div>
              </td>
           </tr>
           <tr>
              <td colspan="2">
              <div id="CPBoard2">
                 <h2><b>코디를 부탁해</b></h2>
               <br/>              
                 검색된 글1<br/>
                 검색된 글2<br/>
                 검색된 글3<br/>
                 <div class="a"><a href="#">+더보기</a></div>
              </div>
              </td>
           </tr>
           <tr>
              <td colspan="2">
              <div id="AlBoard2">
                 <h2><b>물물교환</b></h2>
                 <br/>
                 검색된 글1<br/>
                 검색된 글2<br/>
                 검색된 글3<br/>
                 <div class="a"><a href="#">+더보기</a></div>
              </div>
              </td>
           </tr>
        </table>
        </form>
        </div>
   </body>
   
   
   <script>
   function change(){
       var value=$("select").val()
       console.log(value);
         switch(value)
         {
         case "Total":
            $("#CBoard2").css({"display":"block"});
          $("#FTBoard2").css({"display":"block"});
          $("#CPBoard2").css({"display":"block"});
          $("#AlBoard2").css({"display":"block"});
         break;
         case "CBoard":
          $("#CBoard2").css({"display":"block"});
          $("#FTBoard2").css({"display":"none"});
          $("#CPBoard2").css({"display":"none"});
          $("#AlBoard2").css({"display":"none"});
       break;

       case "FTBoard":
          $("#CBoard2").css({"display":"none"});
          $("#FTBoard2").css({"display":"block"});
          $("#CPBoard2").css({"display":"none"});
          $("#AlBoard2").css({"display":"none"});
       break;

       case "CPBoard":
          $("#CBoard2").css({"display":"none"});
          $("#FTBoard2").css({"display":"none"});
          $("#CPBoard2").css({"display":"block"});
          $("#AlBoard2").css({"display":"none"});
       break;

       case "AlBoard":
          $("#CBoard2").css({"display":"none"});
          $("#FTBoard2").css({"display":"none"});
          $("#CPBoard2").css({"display":"none"});
          $("#AlBoard2").css({"display":"block"});
       break;
         }
   }
  
   </script>
</html>