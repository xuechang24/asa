package com.asa.service.impl;

import com.asa.entity.Files;
import com.asa.entity.Questions;
import com.asa.mapper.QuestionsMapper;
import com.asa.service.QuestionsService;
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
public class QuestionsServiceImpl extends ServiceImpl<QuestionsMapper, Questions> implements QuestionsService {

    @Autowired
    QuestionsMapper questionsMapper;

    @Override
    public List<Questions> getQuestionsByItemId(int itemId) {
        QueryWrapper<Questions> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("item_id", itemId);

        return questionsMapper.selectList(queryWrapper);
    }

    @Override
    public int deleteQuestionById(int id) {
        int i = questionsMapper.deleteById(id);
        return i;
    }

}
