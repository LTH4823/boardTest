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
<%--<form action="/board/register" method="post">--%>
<%--    <div>--%>
<%--        <div>--%>
<%--            <input type="text" name="writer" placeholder="작성자를 입력하세요." value="<c:out value="${dto.writer}"/>" >--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <input type="text" name="title" placeholder="제목을 입력하세요." value="<c:out value="${dto.title}"/>" >--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <textarea name="content" placeholder="내용 입력하세요." ><c:out value="${dto.content}"/></textarea>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <button>등록</button>--%>
<%--</form>--%>

<form class="actionForm" action="/board/register" method="post">

<%--    <input type="text" name="title">--%>
    <input type="text" name="title" value="파일업로드 테스트">
    <input type="text" name="content" value="파일업로드 테스트">
    <input type="text" name="writer" value="user00">
    <button class="formBtn">CLICK</button>

</form>

<h2>파일 업로드 테스트</h2>
<form action="/upload1" method="post" enctype="multipart/form-data">

    <input type="file" name="files" multiple>
    <button>Upload</button>

</form>

<div>
    <h2>Ajax Upload</h2>
    <div class="uploadInputDiv">
        <input type="file" name="upload" multiple class="uploadFile">
    </div>
    <button class="uploadBtn">UPLOAD</button>
</div>

<div class="uploadResult">

</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    const uploadResult = document.querySelector(".uploadResult")
    const cloneInput = document.querySelector(".uploadFile").cloneNode()
    const uploadInputDiv = document.querySelector(".uploadInputDiv")


    document.querySelector(".formBtn").addEventListener("click",(e) => {
        e.preventDefault()
        e.stopPropagation()

        const divArr = document.querySelectorAll(".uploadResult > div")

        let str = "";
        for(let i= 0;i < divArr.length; i++){
            const fileObj = divArr[i]

            const uuid = fileObj.getAttribute("data-uuid")
            const img = fileObj.getAttribute("data-img")
            const savePath = fileObj.getAttribute("data-savepath")
            const fileName = fileObj.getAttribute("data-filename")

            str += `<input type='hidden' name='uploads[\${i}].uuid' value='\${uuid}'>`
            str += `<input type='hidden' name='uploads[\${i}].img' value='\${img}'>`
            str += `<input type='hidden' name='uploads[\${i}].savePath' value='\${savePath}'>`
            str += `<input type='hidden' name='uploads[\${i}].fileName' value='\${fileName}'>`
        }//for

        // document.querySelector(".actionForm").innerHTML += str

        const actionForm = document.querySelector(".actionForm")
        actionForm.innerHTML += str

        actionForm.submit()

    },false)

    uploadResult.addEventListener("click", (e) => {

        if (e.target.getAttribute("class").indexOf("delBtn") < 0) {
            return
        }

        const btn = e.target;
        const link = btn.getAttribute("data-link")

        deleteToServer(link).then(result => {
            btn.closest("div").remove()
        })

    }, false)

    document.querySelector(".uploadBtn").addEventListener("click", (e) => {

        const formObj = new FormData();

        const fileInput = document.querySelector(".uploadFile")

        console.log(fileInput.files)

        const files = fileInput.files

        for (let i = 0; i < files.length; i++) {
            console.log(files[i])
            formObj.append("files", files[i])
        }


        uploadToServer(formObj).then(resultArr => {
                                                     //구조분해할당   //result
            uploadResult.innerHTML += resultArr.map(({uuid, thumbnail, link,fileName, savePath, img}) =>
                `<div data-uuid='\${uuid}' data-img='\${img}' data-filename='\${fileName}' data-savepath='\${savePath}'>
                <img src='/view?fileName=\${thumbnail}'>
                <button data-link='\${link}' class="delBtn">x</button>
                \${fileName}</div>`).join(" ")
            //     <img src='/view?fileName=\${result.thumbnail}'>
            //     <button data-link='\${result.link}' class="delBtn">x</button>
            // \${result.fileName}</div>`).join(" ")


            fileInput.remove()
            document.querySelector(".uploadInputDiv").appendChild(cloneInput.cloneNode())
        })

    }, false)

    async function deleteToServer(fileName) {
        const options = {header: {"Content-Type": "application/x-www-form-urlencoded"}}

        const res = await axios.post("/delete", "fileName=" + fileName, options)

        console.log(res.data)


    }

    async function uploadToServer(formObj) {

        console.log("upload to server......")
        console.log(formObj)

        const response = await axios({
            method: 'post',
            url: '/upload1',
            data: formObj,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        });

        return response.data
    }

</script>

</body>
</html>
