<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2022-04-24
  Time: 오전 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/header.jsp" %>
<div id="content">
    <!-- Topbar -->

    <!-- /.container-fluid -->

    <h1>${listDTO}</h1>
    <hr/>
    <h3>${listDTO.link}</h3>

    <div class="searchDiv">
        <select class="type">
            <option value="">---</option>
            <option value="t" ${listDTO.type =="t"?"selected":""}>제목</option>
            <option value="tc"  ${listDTO.type =="tc"?"selected":""}>제목내용</option>
            <option value="tcw"  ${listDTO.type =="tcw"?"selected":""}>제목내용작성자</option>
        </select>
        <input type="text" name="keyword" value="${listDTO.keyword}">
        <button class="searchBtn">Search</button>
    </div>


    <ul class="dtoList">
        <c:forEach items="${dtoList}" var="board">
            <li>
                <span> ${board.bno} </span>
    <%--            전 방법--%>
    <%--            <span><a href='/board/read${listDTO.link}&bno=${board.bno}'> ${board.title}</a></span>--%>
                <span>
                    <a href='/board/read/${board.bno}' class="dtoLink">
                    <c:out value="${board.title}"></c:out></a>
                </span>
                <span> ${board.content} </span>
                <span> ${board.writer} </span>
            </li>
        </c:forEach>
    </ul>


    ${pageMaker}
    <div><a href="/board/register">add</a></div>

        <div class="col-sm-12 col-md-7">
            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
            <ul class="pagination">
                <li class="page-item" id="dataTable_previous">
                    <a class="page-link" href="${pageMaker.start-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                    <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>
                </c:forEach>

                <li class="page-item" id="dataTable_next">
                    <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
            </div>
        </div>


    <form class="actionForm" action="/board/list" method="get">
        <input type="hidden" name="page" value="${listDTO.page}">
        <input type="hidden" name="size" value="${listDTO.size}">
        <input type="hidden" name="type" value="${listDTO.type == null? "":listDTO.type}">
        <input type="hidden" name="keyword" value="${listDTO.keyword == null? "":listDTO.keyword}">
    </form>

    <script>

        // 1방법 모든 태그 값 받고 foreach
        // const linkTags = document.querySelectorAll(".page-link")
        const linkDiv = document.querySelector(".pagination")
        const actionForm = document.querySelector(".actionForm")

        document.querySelector(".dtoList").addEventListener("click", (e) => {
            e.preventDefault()
            e.stopPropagation()
            const target = e.target;
            if (target.getAttribute("class").indexOf('dtoLink') < 0) {
                return
            }
            const url = target.getAttribute("href")
            //alert(url)

            actionForm.setAttribute("action", url)
            actionForm.submit()

        }, false)

        linkDiv.addEventListener("click", (e) => {
            e.stopPropagation()
            e.preventDefault()

            const target = e.target

            if (target.getAttribute("class") !== 'page-link') {
                return
            }

            const pageNum = target.getAttribute("href")
            actionForm.querySelector("input[name='page']").value = pageNum
            actionForm.setAttribute("action", "/board/list") //뒤로 가기 문제 방지
            actionForm.submit()
        }, false)

        //console.log(linkTags)
        // for (const tag of linkTags) {
        //     //console.log(tag)
        //     tag.addEventListener("click",(e)=>{
        //         e.preventDefault()
        //         console.log(tag.href)
        //         const pageNum = tag.getAttribute("href")
        //
        //         actionForm.querySelector("input[name='page']").value = pageNum
        //         actionForm.submit()
        //
        //     },false)
        // }

        document.querySelector(".searchBtn").addEventListener("click", (e) => {
            const type = document.querySelector('.searchDiv .type').value
            const keyword = document.querySelector(".searchDiv input[name='keyword']").value

            console.log(type, keyword)
            actionForm.setAttribute("action", "/board/list") //뒤로 가기 문제 방지
            actionForm.querySelector("input[name='page']").value = 1
            actionForm.querySelector("input[name='type']").value = type
            actionForm.querySelector("input[name='keyword']").value = keyword
            actionForm.submit()


        }, false)


        <%--   단순한 데이터 보내기 방식으로 할 시 param을 추가하여 받을 수 있게 해줌 단순한 방법   --%>
        <%--const result = ${param.result}--%>
        const result = `${result == null ? "" : result}`
        console.log(result)

        if (result !== '') {
            alert("처리되었습니다.")
        }

    </script>

    <%@ include file="/WEB-INF/includes/footer.jsp" %>
