<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 외부 CSS 파일 불러오기 -->
<link rel="stylesheet" href="/resources/css/writeView.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<title>게시판</title>
<!-- writeView.jsp -->
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function() {
			if (fn_valiChk()) {
				return false;
			}
			formObj.attr("action", "/board/write");
			formObj.attr("method", "post");
			formObj.submit();
		});
	})

	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
				alert($(".chk").eq(i).attr("title"));
				return true;
			}
		}
	}
</script>

<body class="container">
	<div id="root">
		<header class="page-header">
			<img src="/resources/static/images/main.PNG" alt="메인 이미지"
				class="main-image" style="width: 100px; height: auto;"><h1>우산 메이트 글작성</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form name="writeForm" method="post" action="/board/write"
				class="form-horizontal">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" id="title" name="title"
							class="form-control chk" placeholder="제목을 입력하세요." required />
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea id="content" name="content" class="form-control chk"
							placeholder="내용을 입력하세요." required></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="writer"
							class="form-control chk" placeholder="작성자를 입력하세요."
							value="${member.userId}" readonly required />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-primary write_btn" type="submit">작성</button>
					</div>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>

</html>