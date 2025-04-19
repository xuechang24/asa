import http from "@/http/httpRequest";

export function registry(name,password,mobile){
    return http({
        url: '/user/save',
        method: 'post',
        data:{
            name:name,
            password:password,
            mobile:mobile
        }
    })
}