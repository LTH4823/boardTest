const replyService = (function(){

    const addReply = async function (replyObj, callback){
        console.log("addReply............")

        const res = await axios.post("/replies/", replyObj)

        callback()

    }

    const getList = async function({bno,page,size}, callback){
        console.log("getList.............")

        const parameter = {page:page||1, size:size||10}

        const res = await axios.get(`/replies/list/${bno}`, {params: parameter })
        //console.log(res.data)
        callback(res.data)
    }

    return {addReply, getList}

})()

const qs = function(str){
    return document.querySelector(str)
}

const qsAddEvent = function(selector, type, callback){

    const target = document.querySelector(selector)

    target.addEventListener(type, callback, false)

}