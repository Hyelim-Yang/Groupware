<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트보기</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- 아이콘 fontawesome -->
<script src="https://kit.fontawesome.com/b1e233372d.js"></script>
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="/assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/assets/img/favicon.png">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
</head>
<style>
* {
	border: 0px solid black;
}

.top-vacant {
	width: 100%;
	height: 20px;
	/* 	background-color: yellow; */
}

.navi {
	text-align: center;
}

.demo-icons li {
	margin-bottom: 0px;
}
.searchbox{
	text-align:center;
}
</style>
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
					<h3 class="page-title">프로젝트</h3>
					<div class="panel panel-headline demo-icons">
						<div class="panel-heading">
							<h3 class="panel-title">프 로 젝 트 보 기</h3>
							<div class="right"><input type="button" id="addProject" class="btn btn-sm btn-primary" value="추가"></div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">프로젝트명</th>
										<th scope="col">시작일</th>
										<th scope="col">종료일</th>
										<th scope="col">담당자(ID)</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${listProject}">
										<tr>
											<th scope="row">${i.pro_seq}</th>
											<td><a
												href="/project/projectDetail.project?pro_seq=${i.pro_seq}">${i.pro_title}</a></td>
											<td>${i.pro_start_date_str}</td>
											<td>${i.pro_end_date_str}</td>
											<td>${i.pro_id}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="searchbox">
							<form action="/project/projectSearch.project?cpage=1" method=post>
								<select name="choice" id="choice">
									<option value="pro_id">담당자(ID)</option>
									<option value="pro_title">Title</option>
								</select> <input type="text" name="search" id="search"
									placeholder="검색어를 입력하시오.">
								<button type="submit" id="searchBtn"
									class="btn btn-default btn-xs">
									<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
								</button>
							</form>
						</div>
						<br>
						<div class="navi">${navi}</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
	</div>
</body>
<script>
	$("#find")
			.on(
					"click",
					function() {
						var options = 'top=10, left=10, width=700, height=600, status=no, menubar=no, toolbar=no, resizable=no';
						window.open("/project/enterPopup.project", "popup",
								options);
					});

	function getReturnValue(returnValue) {
		obj = JSON.parse(returnValue);
		document.getElementById("projectManagerName").value = obj.key1;
		document.getElementById("pro_id").value = obj.key2;
	}
</script>
<script>
	$("#addProject").on("click", function() {
		location.href = "/project/addProject.project";
	});
</script>

</html>