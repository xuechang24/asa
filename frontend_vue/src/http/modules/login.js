import http from '@/http/httpRequest.js'

export function getToken(name,password) {
    return http({
        url: '/auth/token',
        method: 'post',
        data:{
            name:name,
            password:password
        }
    })
}