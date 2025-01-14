<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- 부트스트랩 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <title>우산메이트</title>
    <!-- updateView.jsp -->
    <link rel="stylesheet" href="/resources/css/readView.css">
</head>
<script type="text/javascript">
    $(document).ready(function(){
        var formObj = $("form[name='updateForm']");
        
        $(".cancel_btn").on("click", function(event){
            event.preventDefault();
            location.href = "/board/readView?bno=${update.bno}"
                   + "&page=${scri.page}"
                   + "&perPageNum=${scri.perPageNum}"
                   + "&searchType=${scri.searchType}"
                   + "&keyword=${scri.keyword}";
        });
        
        $(".update_btn").on("click", function(){
            if(fn_valiChk()){
                return false;
            }
            formObj.attr("action", "/board/update");
            formObj.attr("method", "post");
            formObj.submit();
        });
    });
    
    function fn_valiChk(){
        var updateForm = $("form[name='updateForm'] .chk").length;
        for(var i = 0; i<updateForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
                alert($(".chk").eq(i).attr("title"));
                return true;
            }
        }
    }
</script>
<body>

<div id="root" class="container">
    <header>
        <h1>우산 메이트 글수정</h1>
    </header>
    <hr />

    <div>
        <%@include file="nav.jsp" %>
    </div>
    <hr />

    <section id="container">
        <form name="updateForm" role="form" method="post" action="/board/update" class="form-horizontal">
            <input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
            <table class="table">
                <tbody>
                    <tr>
                        <td>
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" value="${update.title}" class ="form-control chk" title="제목을 입력하시오."/>
                        </td>
                    </tr>   
                    <tr>
                        <td>
                            <label for="content">내용</label>
                            <textarea id="content" name="content" class ="form-control chk" title="내용을 입력하시오."><c:out value="${update.content}" /></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="writer">작성자</label>
                            <input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="regdate">작성날짜</label>
                            <fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>
                        </td>
                    </tr>   
                </tbody>            
            </table>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary update_btn">저장</button>
                    <button type="submit" class="btn btn-default cancel_btn">취소</button>
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