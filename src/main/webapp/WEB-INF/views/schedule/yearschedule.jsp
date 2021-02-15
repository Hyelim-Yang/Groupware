<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
#calendar{
	width: 100%;
}
.fc-toolbar-chunk {
  display: flex; // 일렬로 나란히
  align-items: center; // 수직 가운데 정렬
}
</style>
<head>
<meta charset="UTF-8">
<title>연간 일정</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
   <!-- VENDOR CSS -->
   <link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
   <link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
   <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
   <!-- MAIN CSS -->
   <link rel="stylesheet" href="/assets/css/main.css">
   <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
   <link rel="stylesheet" href="/assets/css/demo.css">
   <!-- GOOGLE FONTS -->
   <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
   <!-- ICONS -->
   <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
   <script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
   <script src="/assets/vendor/chartist/js/chartist.min.js"></script>
   <script src="/assets/scripts/klorofil-common.js"></script>
    <!-- Calendar -->
    <link href='/resources/lib/fullcalendar/main.css' rel='stylesheet' />
    <script src='/resources/lib/fullcalendar/main.js'></script>

</head>
<body>
   <!-- WRAPPER -->
   <div id="wrapper">
      <!-- NAVBAR -->
      <nav class="navbar navbar-default navbar-fixed-top">
         <jsp:include page="/WEB-INF/views/commonPage/top.jsp"/>
      </nav>
      <!-- END NAVBAR -->
      <!-- LEFT SIDEBAR -->
      <div class="sidebar" id="sidebar-nav">
         <jsp:include page="/WEB-INF/views/commonPage/left.jsp"/>
      </div>
      <!-- END LEFT SIDEBAR -->
      <!-- MAIN -->
      <div class="main">
         <!-- MAIN CONTENT -->
         <div class="main-content">
            <div class="container-fluid">
               <h3 class="page-title"></h3>
               <div class="panel panel-headline demo-icons">
                  <!-- pannel 내부의 제목 작성 div-->
                  <div class="panel-heading">
                  <h3 class="panel-title"></h3>
                  </div>
                  <div class="panel-body">
                  <span id="currentTimeSpan"></span>
                  <div class="">
                     
                  </div>
                  <div class="">             
				</div>
               <div class="panel panel-headline demo-icons">
                  <div class="panel-heading">
                  <h3 class="panel-title">연 간 일 정</h3>
                  </div>
                  <div class="panel-body">
  				 	<div id='calendar'></div>       
                  </div>
               </div>
              </div>
               
            </div>
         </div>
         <!-- END MAIN CONTENT -->
      </div>
      <!-- END MAIN -->
      <div class="clearfix"></div>
		<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
   </div>
   <!-- END WRAPPER -->
   </div>
 <script>
   	document.getElementById("golist").onclick=function(){
   		location.href="/schedule/scheduleListProc.schedule?cpage=1";
   	}
   </script>
   <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {        	
        	headerToolbar: {
				left: '',
				center: 'prev title next',
				right: 'today'
			},
			locale: 'ko',
			businessHours: true,
			 eventSources: [
				    {
				      events: [
				    	  <c:forEach var="i" items="${list }">
				    	  {
					          title  : '${i.sch_title }',
					          start  : '${i.sch_start_date_sc }',
					          end    : '${i.sch_end_date_sc }',
					          url : "/schedule/scheduleView.schedule?sch_seq=${i.sch_seq}"
				    	  },
				          </c:forEach>
				      ],
				    }
				]

        });
        calendar.render();
      });
</script>
  
</body>
</html>