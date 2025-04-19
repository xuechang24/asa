package com.asa.mapper;

import com.asa.entity.QuestionItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author asa
 * @since 2025-04-14
 */
@Mapper
public interface QuestionItemMapper extends BaseMapper<QuestionItem> {

    QuestionItem getQuestionItemByItem(String item);
}
