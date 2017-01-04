<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">		
		<link type="text/css" href='../../main/resources/css/fullcalendar.min.css' rel='stylesheet' />		
		<link type="text/css" href='../../main/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
		<script type="text/javascript" src='../../main/resources/js/moment.min.js'></script>
		<script type="text/javascript" src='../../main/resources/js/jquery.min.js'></script>		
		<script type="text/javascript" src='../../main/resources/js/fullcalendar.min.js'></script>	   	    
		
		<title>나만의 옷장(캘린더)</title>
  	</head> 
  	<body>		
		<div id='calendar'></div>				  	
	</body> 
	 
  	<script type="text/javascript">

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: '2017-1-1',
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				var title = prompt('일정을 입력해주세요:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-1-1'					
				},
				{
					title: 'Long Event',
					start: '2017-1-2'					
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-1-3'					
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-1-4'				
				},
				{
					title: 'Conference',
					start: '2017-1-5'					
				},
				{
					title: 'Meeting',
					start: '2017-1-6'					
				},
				{
					title: 'Lunch',
					start:'2017-1-6T12:00'					
				},
				{
					title: 'Meeting',
					start: '2017-1-7'					
				},
				{
					title: 'Happy Hour',
					start: '2017-1-8'				
				},
				{
					title: 'Dinner',
					start: '2017-1-9T20:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-3-4'
						
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-1-1'					
				}
			]
		});		
	});

</script>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
