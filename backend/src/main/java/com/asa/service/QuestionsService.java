package com.asa.service;

import com.asa.entity.Questions;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author asa
 * @since 2025-04-14
 */
public interface QuestionsService extends IService<Questions> {

    List<Questions> getQuestionsByItemId(int itemId);


    int deleteQuestionById(int id);

}
