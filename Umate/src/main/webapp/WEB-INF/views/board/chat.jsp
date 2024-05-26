<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- chat.jsp -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- readView.jsp -->
<link rel="stylesheet" href="/resources/css/list.css">
<title>우산메이트</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

	
		
		$(".reviewBtn").on("click", function() {
            location.href = "/board/review";
        });

	})
</script>

<body>
	<div class="container">
		<header>
			<h1>1대1 채팅방</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>

		<section id="container">
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

				 <div class="col-sm-offset-2 col-sm-10" style="text-align: right;">
            <button type="button" class="reviewBtn btn btn-danger">리뷰하기</button>
        </div>

				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">채팅 할 사용자</label>
					<div class="col-sm-10">
						<input type="text" id="writer" name="writer"
							value="${member.userId}" readonly="readonly" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">채팅 내용</label>
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