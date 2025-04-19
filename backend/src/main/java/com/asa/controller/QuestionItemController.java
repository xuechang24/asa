package com.asa.controller;


import com.asa.common.utils.Result;
import com.asa.common.validator.group.AddGroup;
import com.asa.entity.Files;
import com.asa.entity.QuestionItem;
import com.asa.service.QuestionItemService;
import com.asa.service.vo.QuestionItemVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author asa
 * @since 2025-04-14
 */
@CrossOrigin
@RestController
@RequestMapping("/questionItem")
@Api(tags = "测试questionItem")
public class QuestionItemController {

    @Autowired
    QuestionItemService questionItemService;

    @ApiOperation(value = "测试添加类别")
    @PostMapping("/addItem")
    public Result addQuestionItem(@Validated({AddGroup.class}) @RequestBody QuestionItemVo questionItemVo){

        QuestionItem questionItem = new QuestionItem();
        questionItem.setItem(questionItemVo.getItem());

        if(questionItemService.save(questionItem)) {
            return Result.ok().message("类别添加成功");
        }else{
            return Result.error().message("类别添加失败");
        }
    }

    @GetMapping("/items")
    public Result getQuestionItems(){
        List<QuestionItem> items = questionItemService.getItems();
        if(items!=null){
            return Result.ok().data("data",items);
        }else{
            return Result.error().data("data", null);
        }
    }

    @GetMapping("/getQuestionItemByItem")
    public Result getQuestionItemByItem(@RequestParam(name="item") String item){
        QuestionItem questionItem = questionItemService.getQuestionItemByItem(item);
        if(questionItem!=null){
            return  Result.ok().data("data",questionItem);
        }else{
            return Result.error().data("data", null);
        }
    }
}

