package com.asa.service.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FilesVo {
    private Integer id;

    private String filename;

    private String storagePath;
}
