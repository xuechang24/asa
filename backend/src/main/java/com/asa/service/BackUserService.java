package com.asa.service;

import com.asa.entity.BackUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author asa
 * @since 2025-04-08
 */
public interface BackUserService extends IService<BackUser> {

    BackUser getUserByName(String name);

}
