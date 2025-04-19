import http from '@/http/httpRequest.js'

export function getAllFiles(){
    return http({
        url: '/files/all',
        method: 'get'
    })
}

export function deleteFileById(id){
    return http({
        url:'/files/deleteFileById',
        method:'get',
        params:{
            id: id,
        }
    })
}