import http from "@/http/httpRequest";

export function updatePassword(name,password){
    return http({
        url: '/user/updatePassword',
        method: 'put',
        data:{
            name:name,
            password:password
        }
    })
}