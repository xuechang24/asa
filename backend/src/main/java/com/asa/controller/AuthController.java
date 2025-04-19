package com.asa.controller;

import com.asa.common.utils.Result;
import com.asa.entity.BackUser;
import com.asa.service.BackUserService;
import com.asa.service.vo.BackUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

import static com.asa.common.utils.JwtUtil.getJwtToken;

@RestController
@RequestMapping("/auth")
@CrossOrigin
public class AuthController {

    @Autowired
    BackUserService backUserService;

    @RequestMapping("/token")
    public Result getToken(@RequestBody BackUserVo userVo) {

        BackUser userInfo = backUserService.getUserByName(userVo.getName());

        if(userInfo.getPassword().equals(userVo.getPassword())){
            String token = getJwtToken(userInfo.getId().toString(), userInfo.getName());
            return Result.ok().data("token",token);
        }else{
            return Result.error().data("token",null);
        }
    }
}
