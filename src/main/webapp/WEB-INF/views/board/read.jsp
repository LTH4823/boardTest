
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--    ${listDTO}--%>
    ${dto}<br>
    ${dto.title}<br>
    ${dto.content}<br>
    ${dto.writer}<br>
    ${dto.regDate}<br>
    ${dto.updateDate}<br>

<button class="listBtn">리스트</button>
<button class="modBtn">수정/삭제</button>

</body>
<script>

    const bno = ${dto.bno}

    document.querySelector(".listBtn").addEventListener("click",(e)=>{
        self.location = `/board/list${listDTO.link}`
    },false)
    document.querySelector(".modBtn").addEventListener("click",(e)=>{
        self.location = `/board/modify/${bno}${listDTO.link}`
            },false)
</script>
</html>
<%@ include file="/WEB-INF/includes/footer.jsp" %>