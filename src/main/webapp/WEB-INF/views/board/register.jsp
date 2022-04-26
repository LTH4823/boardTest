<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>register</h1>
<%--<form action="/board/register" method="post">--%>
<%--    <input type="text" name="title">--%>
<%--    <button>submit</button>--%>
<%--</form>--%>
<form action="/board/register" method="post">
    <div>
        <div>
            <input type="text" name="writer" placeholder="작성자를 입력하세요." value="<c:out value="${dto.writer}"/>" >
        </div>
        <div>
            <input type="text" name="title" placeholder="제목을 입력하세요." value="<c:out value="${dto.title}"/>" >
        </div>
        <div>
            <textarea name="content" placeholder="내용 입력하세요." ><c:out value="${dto.content}"/></textarea>
        </div>
    </div>
    <button>등록</button>
</form>




</body>
</html>
