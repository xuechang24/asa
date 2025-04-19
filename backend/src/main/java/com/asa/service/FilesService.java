package com.asa.service;

import com.asa.entity.Files;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author asa
 * @since 2025-04-11
 */
public interface FilesService extends IService<Files> {

    String uploadStorageFile(MultipartFile file);

    public Files getMysqlFileById(int id);

    public void deleteStorageFile(String memberPath);

    public int deleteMysqlFileById(int id);

    public void downloadStorageFile(String memberPath, String localSaveLocation)throws Exception;

    public List<Files> getAllFiles();
}
