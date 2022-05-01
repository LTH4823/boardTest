<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--jstl CDN--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Modify Page</h1>

${listDTO}

${dto}

<form class="modForm" action="/board/modify/${dto.bno}" method="post">
    <input type="hidden" name="page" value="${listDTO.page}">
    <input type="hidden" name="size" value="${listDTO.size}">
    <input type="hidden" name="type" value="${listDTO.type}">
    <input type="hidden" name="keyword" value="${listDTO.keyword}">
    <div>
        <div>
            <input type="text" name="bno" value="<c:out value="${dto.bno}"/>" readonly>
        </div>
        <div>
            <input type="text" name="title" value="<c:out value="${dto.title}"/>" >
        </div>
        <div>
            <textarea name="content" ><c:out value="${dto.content}"/></textarea>
        </div>
    </div>
</form>

<div>
    <button class="listBtn">리스트</button>
    <button class="modPostBtn">수정</button>
    <button class="delPostBtn">삭제</button>
</div>

<form class="actionForm" action="/board/remove/${bno}" method="post">
</form>

<script>

    function sQuery(expression){

        return document.querySelector(expression)
    }

    const bno = ${dto.bno}

    const actionForm = sQuery(".actionForm")

    document.querySelector(".listBtn").addEventListener("click",(e)=> {

        self.location = `/board/list${listDTO.link}`

    }, false)

    sQuery(".delPostBtn").addEventListener("click",(e)=> {

        actionForm.setAttribute("action", `/board/remove/${bno}`)
        actionForm.submit()

    }, false)

    sQuery(".modPostBtn").addEventListener("click",(e)=> {

        sQuery(".modForm").submit()

    }, false)

</script>

</body>
</html>
