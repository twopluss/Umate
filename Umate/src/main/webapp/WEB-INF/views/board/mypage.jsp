<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>우산 메이트</title>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>

<body>
	<div id="root">
		<header>
			<img src="/resources/static/images/main.PNG" alt="메인 이미지"
				class="main-image" style="width: 100px; height: auto;"><h1>MyPage </h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp"%>
		</div>
		<hr />

		<section id="container">
			<form role="form" method="post" action="/board/review">
				<table>
					<tr>
						<th>리뷰대상자</th>
						<th>리뷰점수</th>
						<th>리뷰내용</th>
						<th>리뷰 작성자</th>
						<th>리뷰 등록일</th>
					</tr>

					<c:forEach items="${reviewlist}" var="review">
						<c:if test="${review.rwriter eq member.userId}">
							<tr>
								<td><c:out value="${review.rwriter}" /></td>
								<td><c:out value="${review.total}" /></td>
								<td><c:out value="${review.content}" /></td>
								<td><c:out value="${review.me}" /></td>
								<td><fmt:formatDate value="${review.regdate}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:if>
					</c:forEach>

				</table>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>