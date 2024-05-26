<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- readView.jsp -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/readView.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- readView.jsp -->
<title>우산 메이트</title>
</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".update_btn").on("click", function() {
							formObj.attr("action", "/board/updateView");
							formObj.attr("method", "get");
							formObj.submit();
						})

						// 삭제
						$(".delete_btn").on("click", function() {

							var deleteYN = confirm("삭제하시겠습니까?");
							if (deleteYN == true) {

								formObj.attr("action", "/board/delete");
								formObj.attr("method", "post");
								formObj.submit();

							}
						})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "/board/list?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

						$(".chat_btn").on("click", function() {
							// "/board/chat" 페이지로 이동
							location.href = "/board/chat";
						});
						
						
						$(".replyWriteBtn").on("click", function() {
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "/board/replyWrite");
							formObj.submit();
						});

						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyUpdateView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});

						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyDeleteView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
					})

	$(document).ready(function() {
		// 현재 사용자의 아이디
		var currentUser = "${member.userId}";

		// 글 작성자의 아이디
		var writerId = "${read.writer}";

		// 현재 사용자와 글 작성자가 다를 경우에만 수정과 삭제 버튼을 비활성화
		if (currentUser !== writerId) {
			$(".update_btn").hide();
			$(".delete_btn").hide();
		}
		
		// 현재 사용자의 아이디가 없으면 채팅하기와 작성 버튼을 숨김
		if (currentUser === null || currentUser === "") {
			$(".chat_btn").hide();
			$(".replyWriteBtn").hide();

			// "로그인을 하세요" 버튼 추가
			var loginButton = '<button type="button" class="login_btn btn btn-primary">로그인을 하세요</button>';
			$(".container").append(loginButton);

			// "로그인을 하세요" 버튼 클릭 시 홈으로 이동
			$(".login_btn").on("click", function() {
				location.href = "/"; // 홈 페이지의 경로로 변경
			});
		}

	});
	$(document)
			.ready(
					function() {
						// 댓글 수정 버튼 클릭 시
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											// 댓글 수정 화면으로 이동하는 코드 작성
											var rno = $(this).data("rno");
											location.href = "/board/replyUpdateView?bno=${read.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&rno="
													+ rno;
										});

						// 댓글 삭제 버튼 클릭 시
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											// 댓글 삭제 화면으로 이동하는 코드 작성
											var rno = $(this).data("rno");
											location.href = "/board/replyDeleteView?bno=${read.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}&rno="
													+ rno;
										});

						// ... (이하 동일) ...
					});
</script>

<body>
	<div class="container">
		<header>
			<img src="/resources/static/images/main.PNG" alt="메인 이미지"
				class="main-image" style="width: 100px; height: auto;"><h1>우산 메이트 </h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
			</form>

			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${read.title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">내용</label>
				<textarea id="content" name="content" class="form-control"
					readonly="readonly"><c:out value="${read.content}" /></textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${read.writer}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
				<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />
			</div>

			<div>
				<button type="button" class="update_btn btn btn-warning">수정</button>
				<button type="button" class="delete_btn btn btn-danger">삭제</button>
				<button type="button" class="list_btn btn btn-primary">목록</button>
				<button type="button" class="chat_btn btn btn-success">채팅하기</button>

			</div>

			<!-- 댓글 목록 부분 -->
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${replyList}" var="reply">
						<li>
							<p>
								작성자 : ${reply.writer}<br /> 작성 날짜 :
								<fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd" />
							</p>
							<p>${reply.content}</p>
							<div>
								<!-- 현재 사용자와 댓글 작성자가 같을 때만 수정, 삭제 버튼을 표시 -->
								<c:if test="${reply.writer eq member.userId}">
									<button type="button" class="replyUpdateBtn btn btn-warning"
										data-rno="${reply.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger"
										data-rno="${reply.rno}">삭제</button>
								</c:if>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>

			<form name="replyForm" method="post" class="form-horizontal">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="writer"
							value="${member.userId}" readonly="readonly" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">댓글 내용</label>
					<div class="col-sm-10">
						<input type="text" id="content" name="content"
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="replyWriteBtn btn btn-success">작성</button>
					</div>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>