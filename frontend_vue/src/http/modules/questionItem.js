import http from '@/http/httpRequest.js'

export function getQuestionItems(){
    return http({
        url: '/questionItem/items',
        method: 'get'
    })
}

//获取QuestionItem类 从而取得ItemId
export function getQuestionItemByItem(item){
    return http({
        url:'/questionItem/getQuestionItemByItem',
        method:'get',
        params:{
            item:item
        }
    })
}