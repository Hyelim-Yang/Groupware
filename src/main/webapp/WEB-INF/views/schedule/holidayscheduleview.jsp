<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>일정 상세</title>
<style>
    *{box-sizing: border-box}

	.top-vacant {
		width: 100%;
		height: 20px;
	}
	.btnHome{
		text-align: right;
	}
</style>
</head>
<body>
<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">일정 상세</h3>					
				</div>
					<div class="top-vacant d-none d-lg-block"></div>

					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">상 세 일 정</h3>
						</div>
						<div class="panel-body">
						<!-- Table -->
						  <table class="table">
						  <input type="hidden" value="${chdto.comp_hd_seq }">
						  	<tr>
						  		<th>일정명 : ${chdto.comp_hd_name }</th>
						  	</tr>
						  	<tr>
						  		<th>날짜 : ${chdto.comp_hd_date_str }</th>
						  	</tr>
						  </table>
						</div>
						

				   </div>
				   <div class="btnHome">
				   		<button id="goHome" class="btn btn-primary">목록으로</button>
				   </div>
		</div>
</div>

<script>
	document.getElementById("goHome").onclick=function(){
		location.href="/schedule/monthSchedule.schedule";
	}
</script>
</body>
</html>