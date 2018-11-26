package com.lixin.library.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class FileUtil {
    public static int upload(MultipartFile file,String downPath){

        File dest = new File(downPath);
        //判断文件父目录是否存在
        if(!dest.getParentFile().exists()){
            dest.getParentFile().mkdir();
        }
        try {
            //保存文件
            file.transferTo(dest);
            return 1;
        } catch (IllegalStateException e) {
            e.printStackTrace();
            return 0;
        } catch (IOException e) {
            e.printStackTrace();
            return 0;
        }
    }

}

