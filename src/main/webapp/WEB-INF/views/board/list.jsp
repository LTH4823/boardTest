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
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <form class="form-inline">
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>
        </form>

        <!-- Topbar Search -->
        <form
                class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group searchDiv">

                <select class="type">
                    <option value="">---</option>
                    <option value="t" ${listDTO.type =="t"?"selected":""}>제목</option>
                    <option value="tc"  ${listDTO.type =="tc"?"selected":""}>제목내용</option>
                    <option value="tcw"  ${listDTO.type =="tcw"?"selected":""}>제목내용작성자</option>
                </select>

                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                       aria-label="Search" aria-describedby="basic-addon2" name="keyword" value="${listDTO.keyword}">


                <div class="input-group-append">
                    <button class="btn btn-primary searchBtn" type="button">
                        <i class="fas fa-search fa-sm"></i>
                    </button>
                </div>


            </div>
        </form>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                     aria-labelledby="searchDropdown">
                    <form class="form-inline mr-auto w-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small"
                                   placeholder="Search for..." aria-label="Search"
                                   aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <!-- Counter - Alerts -->
                    <span class="badge badge-danger badge-counter">3+</span>
                </a>
                <!-- Dropdown - Alerts -->
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">
                        Alerts Center
                    </h6>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                            <div class="icon-circle bg-primary">
                                <i class="fas fa-file-alt text-white"></i>
                            </div>
                        </div>
                        <div>
                            <div class="small text-gray-500">December 12, 2019</div>
                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                            <div class="icon-circle bg-success">
                                <i class="fas fa-donate text-white"></i>
                            </div>
                        </div>
                        <div>
                            <div class="small text-gray-500">December 7, 2019</div>
                            $290.29 has been deposited into your account!
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="mr-3">
                            <div class="icon-circle bg-warning">
                                <i class="fas fa-exclamation-triangle text-white"></i>
                            </div>
                        </div>
                        <div>
                            <div class="small text-gray-500">December 2, 2019</div>
                            Spending Alert: We've noticed unusually high spending for your account.
                        </div>
                    </a>
                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-envelope fa-fw"></i>
                    <!-- Counter - Messages -->
                    <span class="badge badge-danger badge-counter">7</span>
                </a>
                <!-- Dropdown - Messages -->
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="messagesDropdown">
                    <h6 class="dropdown-header">
                        Message Center
                    </h6>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                 alt="...">
                            <div class="status-indicator bg-success"></div>
                        </div>
                        <div class="font-weight-bold">
                            <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                problem I've been having.
                            </div>
                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                 alt="...">
                            <div class="status-indicator"></div>
                        </div>
                        <div>
                            <div class="text-truncate">I have the photos that you ordered last month, how
                                would you like them sent to you?
                            </div>
                            <div class="small text-gray-500">Jae Chun · 1d</div>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                 alt="...">
                            <div class="status-indicator bg-warning"></div>
                        </div>
                        <div>
                            <div class="text-truncate">Last month's report looks great, I am very happy with
                                the progress so far, keep up the good work!
                            </div>
                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                        </div>
                    </a>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                        <div class="dropdown-list-image mr-3">
                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                 alt="...">
                            <div class="status-indicator bg-success"></div>
                        </div>
                        <div>
                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                told me that people say this to all dogs, even if they aren't good...
                            </div>
                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                        </div>
                    </a>
                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                    <img class="img-profile rounded-circle"
                         src="img/undraw_profile.svg">
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                     aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                        Settings
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                        Activity Log
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                </div>
            </li>

        </ul>

    </nav>
    <!-- End of Topbar -->

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <button type="button" class="btn btn-outline-primary"><a href="/board/register">Add</a></button>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <%--                id="dataTable" 자동생성 코드--%>
                    <table class="table table-bordered dtoList" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Bno</th>
                            <th>Title</th>
                            <th>Content</th>
                            <%--                        <th>Writer</th>--%>
                            <%--                        <th>RegDate</th>--%>
                            <%--                        <th>UpdateDate</th>--%>
                        </tr>
                        </thead>
                        <tfoot>

                        </tfoot>

                        <tbody>
                        <c:forEach items="${dtoList}" var="board">
                            <tr>
                                <td>${board.bno}</td>
                                <td><a href='/board/read/${board.bno}' class="dtoLink"> <c:out
                                        value="${board.title}"></c:out></a></td>
                                <td>${board.content}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


                    <div class="row">
                        <div class="col-sm-12 col-md-5">
                            <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1
                                to 10 of 57 entries
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-7">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                <ul class="pagination">

                                    <c:if test="${pageMaker.prev}">
                                        <li class="paginate_button page-item" id="dataTable_previous">
                                            <a class="page-link" href="${pageMaker.start-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">
                                        <li class="paginate_button page-item"><a class="page-link"
                                                                                 href="${num}">${num}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next}">
                                        <li class="paginate_button page-item" id="dataTable_next">
                                            <a class="page-link" href="${pageMaker.end+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

    <%--<h1>${listDTO}</h1>--%>
    <%--<hr/>--%>
    <%--<h3>${listDTO.link}</h3>--%>

    <%--<div class="searchDiv">--%>
    <%--    <select class="type">--%>
    <%--        <option value="">---</option>--%>
    <%--        <option value="t" ${listDTO.type =="t"?"selected":""}>제목</option>--%>
    <%--        <option value="tc"  ${listDTO.type =="tc"?"selected":""}>제목내용</option>--%>
    <%--        <option value="tcw"  ${listDTO.type =="tcw"?"selected":""}>제목내용작성자</option>--%>
    <%--    </select>--%>
    <%--    <input type="text" name="keyword" value="${listDTO.keyword}">--%>
    <%--    <button class="searchBtn">Search</button>--%>
    <%--</div>--%>


    <%--<ul class="dtoList">--%>
    <%--    <c:forEach items="${dtoList}" var="board">--%>
    <%--        <li>--%>
    <%--            <span> ${board.bno} </span>--%>
    <%--&lt;%&ndash;            전 방법&ndash;%&gt;--%>
    <%--&lt;%&ndash;            <span><a href='/board/read${listDTO.link}&bno=${board.bno}'> ${board.title}</a></span>&ndash;%&gt;--%>
    <%--            <span><a href='/board/read/${board.bno}' class="dtoLink"> <c:out value="${board.title}"></c:out></a></span>--%>
    <%--        </li>--%>
    <%--    </c:forEach>--%>
    <%--</ul>--%>


    ${pageMaker}


    <%--    <div class="col-sm-12 col-md-7">--%>
    <%--        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">--%>
    <%--        <ul class="pagination">--%>
    <%--            <li class="page-item">--%>
    <%--                <a class="page-link" href="#" aria-label="Previous">--%>
    <%--                    <span aria-hidden="true">&laquo;</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>

    <%--            <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="num">--%>
    <%--                <li class="page-item"><a class="page-link" href="${num}">${num}</a></li>--%>
    <%--            </c:forEach>--%>

    <%--            <li class="page-item">--%>
    <%--                <a class="page-link" href="#" aria-label="Next">--%>
    <%--                    <span aria-hidden="true">&raquo;</span>--%>
    <%--                </a>--%>
    <%--            </li>--%>
    <%--        </ul>--%>
    <%--        </div>--%>
    <%--    </div>--%>


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
