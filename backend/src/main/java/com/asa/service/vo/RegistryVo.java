package com.asa.service.vo;

import com.asa.common.validator.group.AddGroup;
import com.asa.common.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Data
public class RegistryVo {
    @NotEmpty(message = "用户名不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @ApiModelProperty(value = "用户名")
    private String name;
    @NotEmpty(message = "用户密码不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @ApiModelProperty(value = "用户密码")
    private String password;
    @NotEmpty(message = "手机号不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Pattern(message = "手机号格式不合法", regexp = "^[1-9]{1}\\d{10}$", groups = {AddGroup.class, UpdateGroup.class})
    @ApiModelProperty(value = "用户手机号")
    private String mobile;

}
