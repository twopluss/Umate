<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>우산 메이트</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- home.jsp -->
<!-- 외부 CSS 파일 불러오기 -->
<link rel="stylesheet" href="resources/css/home.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "member/logout";
		})
	})
</script>

<body>
	<div class="container" style="width: 100%; height: 100%;">
		<div class="row">
			<div class="col-md-6">
				<form name='homeForm' method="post" action="/member/login"
					class="login-form">
					<c:if test="${member == null}">
						<div>
							<h2>환영합니다</h2>
							<h3>이곳은 우산 대여 사이트 우산 메이트 입니다 !</h3>
						</div>
						<div class="form-group">
							<label for="userId">아이디</label> <input type="text"
								class="form-control" id="userId" name="userId"
								placeholder="아이디를 입력하세요">
						</div>
						<div class="form-group">
							<label for="userPass">비밀번호</label> <input type="password"
								class="form-control" id="userPass" name="userPass"
								placeholder="비밀번호를 입력하세요">
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">로그인</button>
							<button type="button" class="btn btn-default"
								onclick="location.href='/member/register'">회원가입</button>

						</div>

						<div>
							<p class="main-description">
								<strong style="font-size: 18px;">이곳은 우산을 대여 또는 같이 사용해서
									목적지로 가는</strong><br> <strong style="font-size: 18px;">웹사이트입니다.
									불필요한 지출을 줄이고 소액을 지불해 대여를 함으로써 돈을 절약하세요!</strong>
							</p>
							<p class="main-description">
								<strong style="font-size: 18px;"><em
									style="color: red;">로그인 하기 번거로우시다면!</em> 아래 게시판 화면을 클릭해서 로그인 하기
									전 올라온 메이트 모집을 확인해주세요!</strong>
							</p>

							

						</div>
					</c:if>
				</form>


				<c:if test="${member != null }">
					<div>
						<p class="welcome-message">
							환영합니다, <span class="user-name">${member.userId}</span>님! 대여 하러가기
							버튼을 클릭해 대여게시판으로 이동해주세요!
						</p>
						<strong><a href="/board/list" class="btn btn-primary">대여
								하러가기</a></strong><br />
						<div style="margin-bottom: 20px;"></div>
						<button id="logoutBtn" type="button" class="btn btn-danger">로그아웃</button>
					</div>
				</c:if>

				<c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
			</div>

			<div class="col-md-6">
				<!-- 이미지를 오른쪽으로 이동 -->
				<img src="resources/static/images/main.PNG" alt="메인 이미지"
					class="main-image">
			</div>
		</div>



		<div class="col-md-6" style="width: 100%; height: 100%;">
			<!-- 이미지를 오른쪽으로 이동 -->
			<a href="/board/list" target="_blank"> <!-- 원하는 URL로 수정 --> <img
				src="resources/static/images/bbbb.PNG" alt="게시판 이미지"
				class="bbs-image" style="width: 100%; height: 100%;">
			</a>


		</div>


	</div>


</body>
</html>