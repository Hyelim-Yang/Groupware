<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<script>
	$(document)
			.ready(
					function() {
						//여기 아래 부분
						$('#summernote')
								.summernote(
										{
											height : 500, // 에디터 높이
											minHeight : 500, // 최소 높이
											maxHeight : null, // 최대 높이
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											lang : "ko-KR", // 한글 설정
											toolbar : [
													// [groupName, [list of button]]
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋음체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]
										});
					});
</script>


<style>

.top-vacant {
	width: 1020px;
	height: 20px;
}
</style>

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
					<h3 class="page-title">게시판</h3>
					<div class="col-md-12">
						<div class="panel panel-headline demo-icons">
							<div class="panel-heading">
								<h3 class="panel-title">게시판 새 글쓰기</h3>
							</div>
							<div class="panel-body">
								<div style="width: 100%;">
									<form action="/write/insertBoardWrite.write" method="post">
										<div class="row">
											<div class="col-3 col-sm-2">
												<b>제목 </b>
											</div>
											<div class="col-9 col-sm-10 pr-5">
												<input style="width: 90%;" type="text" name="write_title" placeholder="제목을 입력하세요." />
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-3 col-sm-2">
												<b>작성자 </b>
											</div>
											<div class="col-9 col-sm-10">
												<input style="width: 90%;" type="text" name="write_id" value="${id}" readonly />
											</div>
										</div>
										<br>

										<textarea id="summernote" name="write_contents"></textarea><br>
										<input id="delBtn" class="btn btn-sm btn-secondary" type="button"
											value="취소" style="float: right;"> <input
											id="subBtn" class="btn btn-sm btn-primary" type="button"
											value="글쓰기" style="float: right;"
											onclick="goWrite(this.form)" />
									</form>
								</div>
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

	<script>
		document.getElementById("delBtn").onclick = function() {
			location.href = "/write/boardList.write?cpage=1";
		}
	</script>

	<script>
		function goWrite(frm) {
			var write_title = frm.write_title.value;
			var write_id = frm.write_id.value;
			var write_contents = frm.write_contents.value;

			if (write_title.trim() == '') {
				alert("제목을 입력해주세요");
				return false;
			}
			if (write_id.trim() == '') {
				alert("작성자를 입력해주세요");
				return false;
			}
			if (write_contents.trim() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
	</script>
</body>
</html>