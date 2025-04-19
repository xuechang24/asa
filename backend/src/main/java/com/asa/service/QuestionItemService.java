package com.asa.service;

import com.asa.entity.QuestionItem;
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
public interface QuestionItemService extends IService<QuestionItem> {

    List<QuestionItem> getItems();

    QuestionItem getQuestionItemByItem(String item);
}
