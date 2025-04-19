package com.asa.service.impl;

import com.asa.entity.Files;
import com.asa.mapper.FilesMapper;
import com.asa.service.FilesService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.luhuiguo.fastdfs.domain.StorePath;
import com.luhuiguo.fastdfs.service.FastFileStorageClient;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author asa
 * @since 2025-04-11
 */
@Service
public class FilesServiceImpl extends ServiceImpl<FilesMapper, Files> implements FilesService {
    @Autowired
    public FastFileStorageClient storageClient;

    @Value("${fdfsport}")
    private String fdfsport;

    @Autowired
    private FilesMapper filesMapper;

    @Override
    public String uploadStorageFile(MultipartFile file) {
        InputStream inputStream = null;
        String httpPath = null;
        try {
            //        上传图片到storage
            inputStream = file.getInputStream();
            long size = file.getSize();
            String originalFilename = file.getOriginalFilename();

            //最后一项extName是后缀名
            StorePath path = storageClient.uploadFile(null,inputStream,size,originalFilename.split("\\.")[1]);

            String storagePath = path.getFullPath();
            httpPath = fdfsport+"/"+storagePath;
//        返回的是图片地址 group1/M00/00/00/wKgKZWTZ4FGAGLlSAADRB1qXeNM8.3.jpg
//        使用ip:nginx端口/group1/M00/00/00/wKgKZWTZ4FGAGLlSAADRB1qXeNM8.3.jpg就可以访问到上传的图片
//        保存图片信息进入mysql
            System.out.println(httpPath);
            Files mysqlFile = new Files();
            mysqlFile.setFilename(originalFilename);
            mysqlFile.setStoragePath(httpPath);

            filesMapper.insert(mysqlFile);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            IOUtils.closeQuietly(inputStream);
        }

        return httpPath;
    }

    @Override
    public Files getMysqlFileById(int id){
        Files myFile = filesMapper.selectById(id);
        return myFile;
    }

    //    对fdfs的操作
    @Override
    public void deleteStorageFile(String memberPath){
        storageClient.deleteFile("group1", memberPath);
    }

    @Override
    public int deleteMysqlFileById(int id){
        int i = filesMapper.deleteById(id);
        return i;
    }

    @Override
    public void downloadStorageFile(String memberPath, String localSaveLocation)throws Exception{
        byte[] group1s = storageClient.downloadFile("group1", memberPath);
        OutputStream outputStream=new FileOutputStream(new File(localSaveLocation));
        outputStream.write(group1s);
        outputStream.flush();
        outputStream.close();
    }

    @Override
    public List<Files> getAllFiles() {
        QueryWrapper<Files> queryWrapper = new QueryWrapper<>();
        queryWrapper.select().orderByDesc("id");

        return filesMapper.selectList(queryWrapper);
    }
}
