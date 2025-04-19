package com.asa.entity;

import com.asa.common.validator.group.AddGroup;
import com.asa.common.validator.group.UpdateGroup;
import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

/**
 * <p>
 * 用户表
 * </p>
 *
 * @author asa
 * @since 2025-04-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("back_user")
@ApiModel(value="BackUser对象", description="用户表")
public class BackUser implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "用户 ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @NotEmpty(message = "用户名不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @ApiModelProperty(value = "用户名")
    private String name;

    @NotEmpty(message = "手机号不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @Pattern(message = "手机号格式不合法", regexp = "^[1-9]{1}\\d{10}$", groups = {AddGroup.class, UpdateGroup.class})
    @ApiModelProperty(value = "用户手机号")
    private String mobile;

    @NotEmpty(message = "用户密码不能为空", groups = {AddGroup.class, UpdateGroup.class})
    @ApiModelProperty(value = "用户密码")
    private String password;

    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @TableField(fill = FieldFill.INSERT)
    @TableLogic(value = "0", delval = "1")
    @ApiModelProperty(value = "逻辑删除标志，0 表示未删除， 1 表示删除")
    private Integer deleteFlag;

    @Version
    @TableField(fill = FieldFill.INSERT)
    @ApiModelProperty(value = "版本号")
    private Integer version;


}
