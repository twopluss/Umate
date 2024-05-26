<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <!-- 부트스트랩 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <title>우산 메이트</title>
    <link rel="stylesheet" href="/resources/css/readView.css">
    <!-- replyUpdateView.jsp -->
</head>
<script type="text/javascript">
    $(document).ready(function(){
        var formObj = $("form[name='updateForm']");
        
        $(".cancel_btn").on("click", function(){
            location.href = "/board/readView?bno=${replyUpdate.bno}"
                   + "&page=${scri.page}"
                   + "&perPageNum=${scri.perPageNum}"
                   + "&searchType=${scri.searchType}"
                   + "&keyword=${scri.keyword}";
        });
        
    });
</script>
<body>

<div id="root" class="container">
    <header>
        <h1>우산 메이트 댓글 수정</h1>
    </header>
    <hr />

    <div>
        <%@include file="nav.jsp" %>
    </div>
    <hr />

    <section id="container">
        <form name="updateForm" role="form" method="post" action="/board/replyUpdate" class="form-horizontal">
            <input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
            <input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
            <input type="hidden" id="page" name="page" value="${scri.page}"> 
            <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
            <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
            <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

            <table class="table">
                <tbody>
                    <tr>
                        <td>
                            <label for="content">댓글 내용</label>
                            <input type="text" id="content" name="content" class="form-control" value="${replyUpdate.content}"/>
                        </td>
                    </tr>   
                </tbody>            
            </table>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary update_btn">저장</button>
                    <button type="button" class="btn btn-default cancel_btn">취소</button>
                </div>
            </div>
        </form>
    </section>
    <hr />
</div>

<!-- 부트스트랩 및 사용자 지정 스타일 관련 스크립트 추가 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>