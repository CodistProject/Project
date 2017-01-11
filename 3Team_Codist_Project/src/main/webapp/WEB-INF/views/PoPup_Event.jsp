<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>이벤트 페이지(팝업)</title>
      <style></style>
   </head>
   <style>
         table.popup{
            width: 100%;         
            border-collapse:collapse;
            padding: 5px;
            text-align: center;            
         }
         #popup{      
            padding: 10px;         
            width: 500px;
            height: 550px;
            background-color:white;
            border: 1px solid gray;         
            /* display:none; */
         }
         .winner{
            float: right;
            padding: 15px;
            width:50px;         
         }
         .event{            
            width: 400px;
            height: 500px;
         }
         #eventclose{
            float: right;
         }
         .winnerclick{
            text-decoration: none;
         }
         #graph
         {
         	display:none;
         }               
      </style>
   </head>
   <body>      
         <div class="event">
            <table>
               <tr>
                  <td>            
                  <a class= "winnerclick" href="#">Daily Event</a>            
                  </td>
                  <td>   
                  <a class= "winnerclick"  href="javascript:TimeEvent();">Time Event</a>   
                  </td>
                  <td>
                  <a class= "winnerclick" href="#">당첨확인</a>   
                  </td>
               </tr>
            </table>                           
            <h2><p>VS 이벤트</p></h2>
            <table class="popup">
               <tr>                  
                  <td><div id="candidate1">사진1</div></td>
                  <td>vs</td>
                  <td><div id="candidate2">사진2</div></td>
               </tr>
               <tr class="btn">                  
                  <td ><input type="button" value="선택!" onclick="upLIke(1)" ></td>
                  <td></td>
                  <td><input type="button" value="선택!" onclick="upLIke(2)"></td>
               </tr>                              
            </table>
            <br/>
            <div id="graph">
               <table>
                  <tr>                  
                     <td>★1번 추천수★</td>
                  </tr>
                  <tr>
                     <td>
                        <div id="oneReco"></div>
                        <input type="hidden" id="file1"/>
                     </td>                  
                  </tr>
                  <tr>                  
                     <td>★2번 추천수★</td>
                  </tr>
                  <tr>
                     <td>
                        <div id="twoReco"></div>
                            <input type="hidden" id="file2"/>
                     </td>                  
                  </tr>
               </table>
            </div>         
         </div>         
         <div>   
         <input id="eventclose" type="button" value="닫기">      
         </div>      
   </body>
   <script>
   
   var userId="${sessionScope.userId}";
   EventCall();
   function TimeEvent()
   {
      if("${sessionScope.userId}"!="")
         {
         location.href="./TimeEvent";
         }
      else
         {
         alert("로그인 후 사용 가능합니다.");
         }
             
   }
   // 이벤트 팝업창 닫기
   $("#eventclose").click(function(){               
      self.close();      
   })
   
   function upLIke(i){
      var url="./rest/EventupLike";
      var data = {};
      data.userId=userId;
      if(i==1)
    	  {
      		data.selection_name=$("#file1").val();
    	  }
      else
    	  {
    	  	data.selection_name=$("#file2").val();
    	  }
      console.log(userId);
      console.log(data.selection_name);
      reqServer(url, data);
   }
   
   
   function EventCall(){
         var url="./rest/EventCall";
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
               if(url=="./rest/EventCall")
                  {
                  console.log(d.Event[0].selection_name);
                  console.log(d.Event[1].selection_name);
                      var content = "<img width='230' height='200px'  alt='일일 이벤트' src='./resources/upload/"+d.Event[0].selection_name+"'/>";
                     $("#candidate1").empty();
                     $("#candidate1").append(content);
                     $("#oneReco").empty();
                     $("#oneReco").append(d.Event[0].selection_like);
                     $("#file1").val(d.Event[0].selection_name);
                     
                     var content2 = "<img width='230' height='200px' alt='일일 이벤트' src='./resources/upload/"+d.Event[1].selection_name+"'/>";
                     $("#candidate2").empty();
                     $("#candidate2").append(content2);
                     $("#twoReco").empty();
                     $("#twoReco").append(d.Event[1].selection_like);
                     $("#file2").val(d.Event[1].selection_name);
                  }
               if(url=="./rest/EventupLike")
                  {
                  	alert(d.msg);
                  	$("#graph").css("display","block");
                  	$(".btn").css("visibility","hidden");
                  	EventCall();
                  }
               },error:function(e){
                     console.log(e)
                  }
         });
      }
   
   </script>
</html>