package com.asa.service.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionsVo {
    private Integer id;
    private String question;

    private String answer;

    private Integer itemId;
}
