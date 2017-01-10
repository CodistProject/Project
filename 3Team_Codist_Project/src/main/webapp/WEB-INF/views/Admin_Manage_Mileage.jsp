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
		</style>
	</head>
	<body>		
		<jsp:include page="../../resources/include/AdminPage.jsp"></jsp:include>
		<div class="content">
			<table class="">
				<thead>
					<tr>
						<td>번호</td>
						<td>사용자(ID)</td>
						<td>쿠폰5%</td>
						<td>쿠폰10%</td>
						<td>쿠폰15%</td>
						<td>쿠폰20%</td>
						<td>마일리지</td>
					</tr>
				</thead>
				<tbody id="Mileage_list">				
				</tbody>
			</table>
		</div>
	</body>
	<script>	
	
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
				printList(data);
			}, error : function(error){
				console.log(error);
			}
		});
	} 
	
	// 리스트 뿌려주는 함수(마일리지+쿠폰)
	function printList(data){
		var content="";
		for(var i=0; i<list.length; i++){
			content += "<tr>"+
					   "<td>"+list[i].join_Idx+"</td>"
					   "<td>"+list[i].user_id+"</td>"
					   "<td>"+list[i].coupon_5+"</td>"
					   "<td>"+list[i].coupon_10+"</td>"
					   "<td>"+list[i].coupon_15+"</td>"
					   "<td>"+list[i].coupon_20+"</td>"
					   "<td>"+list[i].mileage+"</td>"				   
					  +"</tr>";			
		}				  
	    $("#list").empty();
	    $("#list").append(content);				 
	}
	</script>
</html>
	