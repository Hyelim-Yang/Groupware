<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.panel-body div{
	border: 0px solid black;
}
.componentBox{
	height: 30px;
}
.selectBox{
	float: right;
	width: 80px;
}
td{
	text-align: center;
}
.col{
	text-align: center;
}
</style>
<head>
<meta charset="UTF-8">
<title>나의 근태내역</title>
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
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">근태관리</h3>
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<h3 class="panel-title">나 의 근 태 내 역</h3>
						</div>



						<div class="panel-body">
								<div class="componentBox">
									<div class="selectBox">
										<select class="form-control input-sm" name="tnaSelectYearList" id="selectYear">
										<c:forEach varStatus="a" var="list" items="${tnaSelectYearList}">
											<c:if test='${list.DATE != selectYearValue}'>
											<option value="${list.DATE }">${list.DATE } 년</option>
											</c:if>
											<c:if test='${list.DATE == selectYearValue}'>
											<option value="${list.DATE }" selected>${list.DATE } 년</option>
											</c:if>
										</c:forEach>
										</select>
									</div>
								</div>
								<hr>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th class="col">구 분</th>
											<th class="col">&nbsp 1 월&nbsp</th>
											<th class="col">&nbsp 2 월&nbsp</th>
											<th class="col">&nbsp 3 월&nbsp</th>
											<th class="col">&nbsp 4 월&nbsp</th>
											<th class="col">&nbsp 5 월&nbsp</th>
											<th class="col">&nbsp 6 월&nbsp</th>
											<th class="col">&nbsp 7 월&nbsp</th>
											<th class="col">&nbsp 8 월&nbsp</th>
											<th class="col">&nbsp 9 월&nbsp</th>
											<th class="col">10 월</th>
											<th class="col">11 월</th>
											<th class="col">12 월</th>
											<th class="col">합 계</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach varStatus="i" var="list" items="${tnaStatusList}">
										<tr>
											<th class="col"><b>${list.tna_status_name }</b></th>
											<c:forEach var="j" begin="1" end="12" step="1">
											<td class="row">
												<c:forEach varStatus="k" var="list2" items="${tnaStartCountList}">
												<c:if test='${list.tna_status_code == list2.TNA_START_STATUS_CODE}'>
													<c:if test='${list2.DATE == j}'>
													${list2.COUNTING }
													</c:if>
												</c:if>
												</c:forEach>
												<c:forEach varStatus="m" var="list4" items="${tnaEndCountList}">
												<c:if test='${list.tna_status_code == list4.TNA_END_STATUS_CODE}'>
													<c:if test='${list4.DATE == j}'>
													${list4.COUNTING }
													</c:if>
												</c:if>
												</c:forEach>
											</td>
											</c:forEach>
											<td class="row">
												<c:forEach varStatus="l" var="list3" items="${tnaStartCountSumList}">
												<c:if test='${list.tna_status_code == list3.TNA_START_STATUS_CODE}'>
												<b>${list3.COUNTING }</b>
												</c:if>
												</c:forEach>
												<c:forEach varStatus="n" var="list5" items="${tnaEndCountSumList}">
												<c:if test='${list.tna_status_code == list5.TNA_END_STATUS_CODE}'>
												<b>${list5.COUNTING }</b>
												</c:if>
												</c:forEach>
											</td>
										<tr>
										</c:forEach>
									</tbody>
								</table>
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

<script>
	// 연도 select 변경
	$('#selectYear').on('change', function() {
		location.href = "/tna/tnaMyHistoryPage.tna?selectYearValue=" + this.value;
	})
	
	// 강제로 테이블 padding left 좁히기
	$(".col").css({
		"padding-left": "8px"
	});
	$(".row").css({
		"padding-left": "8px"
	});


</script>

</body>
</html>