<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>관리자 마일리지(쿠폰) 관리 페이지</title>				
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
            font-size: 15px;
            text-align: center;            
         }
         .p{
         	border:1px solid;
            border-collapse: collapse;
            font-size: 15px;
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
	        <tr>
	        	<td class="b" colspan="7" align="right">
	        		<button id="btn_accept" onclick="Upate_Mileage()">적용</button>
	        	</td>
	        </tr>                	        
           <tr class="l">           	
            <td class="p">번호</td>
            <td class="p">사용자(ID)</td>
            <td class="p">쿠폰5%</td>
            <td class="p">쿠폰10%</td>
            <td class="p">쿠폰15%</td>           
            <td class="p">쿠폰20%</td>
            <td class="p">마일리지(점)</td>
           </tr>
          </thead>
          <tbody id="list">          
          </tbody>          
        </table>
     </div>
	</body>
	<script>	
	// 업뎃 적용 완료 메시지
	var msg = "${msg}";
	if(msg=="업데이트가 적용되었습니다!."){
		alert(msg);
	}
	
	// 마일리지 리스트 함수 실행
	Mileage_list();
	
	// 마일리지 리스트 함수 실행(url, data 담고 리스트콜로 보내기)
	function Mileage_list(){
		var url="rest/Mileage_list";
		var data={};
		Mileage_listCall(url, data);	
	};
	
	// 마일리지 리스트 콜 함수 실행(아작스처리)		
	function Mileage_listCall(url, data){
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
	var listcount="";
	// 리스트 뿌려주는 함수(마일리지+쿠폰)
	function printList(list){
		var content="";
		listcount=list.length;
		for(var i=0; i<list.length; i++){
			console.log(list[i].user_id);
			content += "<tr>"
					 +"<td class='p'>"+list[i].join_Idx+"</td>"
					 +"<td class='p' id='mileageId"+i+"'>"+list[i].user_id+"</td>"					 
					 +"<td class='p'>"+"<input id='coupon_5"+i+"' type='text' value="+list[i].coupon_5+" size='5'>"+"</td>"
					 +"<td class='p'>"+"<input id='coupon_10"+i+"' type='text' value="+list[i].coupon_10+" size='5'>"+"</td>"
					 +"<td class='p'>"+"<input id='coupon_15"+i+"' type='text' value="+list[i].coupon_15+" size='5'>"+"</td>"
					 +"<td class='p'>"+"<input id='coupon_20"+i+"' type='text' value="+list[i].coupon_20+" size='5'>"+"</td>"
					 +"<td class='p'>"+"<input id='mileage"+i+"' type='text' value="+list[i].mileage+" size='5'>"+"</td>"
					 +"</tr>";			
		}				  
	    $("#list").empty();
	    $("#list").append(content);				 
	}
	
		
	// 마일리지 업데이트
	function Upate_Mileage(){
		console.log("리스트 개수:"+listcount);		
		for(var i=0;i<listcount;i++){
			var mileage = $("#mileage"+i).val();
			var userId=$("#mileageId"+i).html();
			console.log(mileage+"/"+userId);
			var url = "/rest/Upate_Mileage";
			var data={};
			data.mileage = mileage; 
			data.userId = userId;
			data.count=i;
			// 아작스 처리함수(url, data) 담아보내기 
			Update_Ajax(url, data);
		} 				
	}
	
	// 마일리지 업데이트(아작스처리)
	function Update_Ajax(url, data){
		$.ajax({
			url : url,
			type : "post",
			data : data,
			dataType : "json",
			success : function(d){
				console.log(d);				
			}, error : function(e){
				console.log(e);
			}
		});
	};
	</script>
</html>
	