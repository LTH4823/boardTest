<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
</head>
<body>


<textarea><c:out value="${dto.content}"/></textarea>

<div>
    <button class="listBtn">리스트</button>
    <button class="modBtn">수정/삭제</button>
</div>

<div>
    <div>
        <input type="text" name="replyText" value="샘플">
    </div>
    <div>
        <input type="text" name="replyer" value="sampleUser">
    </div>
    <div>
        <button class="addReplyBtn">댓글추가</button>
    </div>
</div>

<div>
    <ul class="replyUL">

    </ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script>

    const bno = ${dto.bno}

    document.querySelector(".addReplyBtn").addEventListener("click",(e)=>{

        const replyTextInput = document.querySelector("input[replyText]")
        const replyerInput = document.querySelector("input[replyer]")

        const replyText = replyTextInput.value;
        const replyer = replyerInput.value;

        const reply = {bno,replyText,replyer}

        console.log(reply)

    },false)

    async function sendPost(reply){
        const res = await axios.post(`/replies/`,reply)

        console.log(res)
    }

    async function getReplyList(bno){

        try{
            const res = await axios.get(`/replies/list/${bno}`)

            const data = res.data

            return data
        }catch(err){
            return err
        }

    }



        getReplyList(bno)
            .then(arr => {

                const liStr = arr.map(replyDTO => `<li>\${replyDTO.rno}-- \${replyDTO.replyText}</li>`).join(" ")

                document.querySelector(".replyUL").innerHTML = liStr
            })
            .catch(err => console.log(err))


    document.querySelector(".listBtn").addEventListener("click",(e)=> {

        self.location = `/board/list${listDTO.link}`

    }, false)

    document.querySelector(".modBtn").addEventListener("click",(e)=> {

        self.location = `/board/modify/${bno}${listDTO.link}`
    }, false)

</script>

</body>
</html>
