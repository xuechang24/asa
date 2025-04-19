package com.asa.controller;


import com.asa.common.utils.Result;
import com.asa.entity.Files;
import com.asa.service.FilesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author asa
 * @since 2025-04-11
 */
@CrossOrigin
@RestController
@RequestMapping("/files")
public class FilesController {
    @Autowired
    private FilesService filesService;

    @PostMapping("/upload")
    public Result upload(@RequestParam("file") MultipartFile file) throws Exception {
        String httpPath = filesService.uploadStorageFile(file);
        System.out.println(httpPath);
        return Result.ok().data("message",httpPath);
    }

    @GetMapping("/all")
    public Result getAllFiles(){
        List<Files> files = filesService.getAllFiles();
        return Result.ok().data("message",files);
    }

    @PostMapping("/download/{id}")
    public Result download(@PathVariable("id") int id)throws Exception{
        Files myFile = filesService.getMysqlFileById(id);
        String path = myFile.getStoragePath();
        String memberPath = path.split("/group1/")[1];
        //      .需要进行转义
        String fileName = myFile.getFilename();
        String localSaveLocation = "C:/Users/Administrator/Desktop/" + fileName;

        filesService.downloadStorageFile(memberPath, localSaveLocation);

        return Result.ok().data("message","下载成功！");
    }

    @GetMapping("/deleteFileById")
    public Result deleteFileById(@RequestParam(name = "id") int id){
        Files myFile = filesService.getMysqlFileById(id);
        String path = myFile.getStoragePath();
        String memberPath = path.split("/group1/")[1];

        //删除服务器上图片
        filesService.deleteStorageFile(memberPath);
        //删除mysql上记录
        filesService.deleteMysqlFileById(id);

        return Result.ok().data("message","delete success!");
    }
}

