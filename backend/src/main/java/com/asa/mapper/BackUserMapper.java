package com.asa.mapper;

import com.asa.entity.BackUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author asa
 * @since 2025-04-08
 */
@Mapper
public interface BackUserMapper extends BaseMapper<BackUser> {

    BackUser getUserByName(String name);

}
