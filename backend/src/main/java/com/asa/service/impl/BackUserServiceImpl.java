package com.asa.service.impl;

import com.asa.entity.BackUser;
import com.asa.mapper.BackUserMapper;
import com.asa.service.BackUserService;
import com.asa.service.vo.BackUserVo;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author asa
 * @since 2025-04-08
 */
@Service
public class BackUserServiceImpl extends ServiceImpl<BackUserMapper, BackUser> implements BackUserService {

    @Autowired
    BackUserMapper backUserMapper;

    @Override
    public BackUser getUserByName(String name) {

        return backUserMapper.getUserByName(name);
    }
}
