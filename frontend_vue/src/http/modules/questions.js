import http from '@/http/httpRequest.js'

export function addQuestion(question,answer,itemId){
    return http({
        url: '/questions/addQuestion',
        method: 'post',
        data:{
            question:question,
            answer:answer,
            itemId:itemId,
        }
    })
}

export function getQuestionsByItemId(itemId){
    return http({
        url:'/questions/getQuestionsByItemId',
        method:'get',
        params:{
            itemId: itemId,
        }
    })
}

export function updateQuestion(id,question,answer){
    return http({
        url:'/questions/updateQuestion',
        method:'put',
        data:{
            id:id,
            question:question,
            answer:answer
        }
    })
}

export function deleteQuestionById(id){
    return http({
        url:'/questions/deleteQuestionById',
        method:'delete',
        params:{
            id: id,
        }
    })
}