<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>우산 메이트</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WykpeQmTlAA8Xyz6U/D5uYRVNHII3pq8h4"
          crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/list.css">
</head>
<body>

<div class="container mt-5">
    <div id="root">
        <header class="text-center">
            <h1>리뷰하기</h1>
        </header>
        <hr class="my-4"/>

        <div>
            <%@include file="nav.jsp"%>
        </div>
        <hr class="my-4"/>

        <section id="container">
            <form role="form" method="post" action="/board/review">
                <div class="form-group row">
                    <label for="rwriter" class="col-sm-2 col-form-label">리뷰 대상자</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="rwriter" name="rwriter"/>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="total" class="col-sm-2 col-form-label">리뷰 평점(1~100)</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="total" name="total"/>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="content" class="col-sm-2 col-form-label">리뷰 내용</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="content" name="content"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="me" class="col-sm-2 col-form-label">리뷰작성자</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="me" name="me" value="${member.userId}" readonly/>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary">작성</button>
                    </div>
                </div>
            </form>
        </section>
        <hr class="my-4"/>
    </div>
</div>

<!-- Add Bootstrap JS and Popper.js links if needed -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"
        integrity="sha384-lbMS1VBq8jW3+e6kAOzKVd7OO/gvXbQFoGDFIHlU6uUCZ2qGK5vFfFg/ASZhmuMJ"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WykpeQmTlAA8Xyz6U/D5uYRVNHII3pq8h4"
        crossorigin="anonymous"></script>

</body>
</html>