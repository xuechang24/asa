package com.asa.controller;


import com.asa.common.utils.Result;
import com.asa.common.validator.group.AddGroup;
import com.asa.entity.QuestionItem;
import com.asa.entity.Questions;
import com.asa.service.QuestionItemService;
import com.asa.service.QuestionsService;
import com.asa.service.vo.QuestionsVo;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
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
@RequestMapping("/questions")
@Api(tags = "测试questions")
public class QuestionsController {


    @Autowired
    QuestionsService questionsService;

    @ApiOperation(value = "测试添加question")
    @PostMapping("addQuestion")
    public Result addQuestion(@Validated({AddGroup.class}) @RequestBody QuestionsVo questionsVo){

        System.out.println(questionsVo.getQuestion());
        System.out.println(questionsVo.getAnswer());
        System.out.println(questionsVo.getItemId());

        Questions questions = new Questions();
        questions.setQuestion(questionsVo.getQuestion());
        questions.setAnswer(questionsVo.getAnswer());
        questions.setItemId(questionsVo.getItemId());

        if(questionsService.save(questions)) {
            return Result.ok().message("问题添加成功");
        }
        return Result.error().message("问题添加失败");

    }

    @ApiOperation(value = "测试根据itemId查询questions")
    @GetMapping("/getQuestionsByItemId")
    public Result getQuestionsByItemId(@RequestParam(name = "itemId") int itemId){
        List<Questions> questionsList =questionsService.getQuestionsByItemId(itemId);
        if(questionsList != null){
            return Result.ok().data("data",questionsList);
        }else{
            return Result.error().message("查询失败");
        }
    }

    @ApiOperation(value = "测试更新question")
    @PutMapping("/updateQuestion")
    public Result updateQuestion(@RequestBody QuestionsVo questionsVo){

        UpdateWrapper<Questions> updateWrapper = new UpdateWrapper<>();
//        updateWrapper.eq("id", questionsVo.getId());
        // Lambda表达式
        updateWrapper.lambda().set(Questions::getQuestion, questionsVo.getQuestion())
                .set(Questions::getAnswer, questionsVo.getAnswer())
                .eq(Questions::getId, questionsVo.getId());

        boolean result = questionsService.update(updateWrapper);
        if(result){
            return Result.ok().message("更新成功");
        }else{
            return Result.error().message("更新失败");
        }
    }


    @DeleteMapping("/deleteQuestionById")
    public Result deleteQuestionById(@RequestParam(name = "id") int id){

        int i = questionsService.deleteQuestionById(id);
        if(i==1){
            return Result.ok().message("删除成功");
        }else{
            return Result.error().message("删除失败");
        }
    }
}

