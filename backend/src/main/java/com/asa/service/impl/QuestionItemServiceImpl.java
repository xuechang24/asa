package com.asa.service.impl;

import com.asa.entity.Files;
import com.asa.entity.QuestionItem;
import com.asa.mapper.QuestionItemMapper;
import com.asa.service.QuestionItemService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author asa
 * @since 2025-04-14
 */
@Service
public class QuestionItemServiceImpl extends ServiceImpl<QuestionItemMapper, QuestionItem> implements QuestionItemService {

    @Autowired
    QuestionItemMapper questionItemMapper;

    @Override
    public List<QuestionItem> getItems() {
        QueryWrapper<QuestionItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.select().orderByDesc("item_id");
        return questionItemMapper.selectList(queryWrapper);

    }

    @Override
    public QuestionItem getQuestionItemByItem(String item) {
        QueryWrapper<QuestionItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("item", item);

        return questionItemMapper.selectOne(queryWrapper);
    }
}
