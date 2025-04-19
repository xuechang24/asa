package com.asa.controller;


import com.asa.common.utils.Result;
import com.asa.common.validator.group.AddGroup;
import com.asa.entity.BackUser;
import com.asa.service.BackUserService;
import com.asa.service.vo.BackUserVo;
import com.asa.service.vo.RegistryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author asa
 * @since 2025-04-08
 */
@RestController
@RequestMapping("user")
@Api(tags = "测试 user")
public class BackUserController {

    @Autowired
    BackUserService userService;

    @ApiOperation(value = "测试 JSR 303 添加时的校验规则")
    @PostMapping("/save")
    public Result registryValidatorSave(@Validated({AddGroup.class}) @RequestBody RegistryVo userVo) {
        BackUser user = new BackUser();
        user.setName(userVo.getName());
        user.setPassword(userVo.getPassword());
        user.setMobile(userVo.getMobile());

        if(userService.save(user)) {
            return Result.ok().message("数据添加成功");
        }
        return Result.error().message("数据添加失败");
    }

    @ApiOperation(value = "修改密码")
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody BackUserVo userVo){
        BackUser user = userService.getUserByName(userVo.getName());
        //如果能查询到用户
        if(user!=null){
            BackUser backUser = new BackUser();
            // 使用updateById方法更新数据
            backUser.setId(user.getId());//根据该id更新
            backUser.setPassword(userVo.getPassword());

            userService.updateById(backUser);

            return Result.ok().message("密码修改成功");
        }else{
            return Result.error().message("请确认用户名是否正确");
        }


    }

}

