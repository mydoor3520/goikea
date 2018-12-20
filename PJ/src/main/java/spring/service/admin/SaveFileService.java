package spring.service.admin;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class SaveFileService {

	@Autowired private ServletContext application;
	public String saveFile(MultipartFile file){
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();
	    String uploadPath = application.getRealPath("/resources/images/page_contents");
	    // 저장할 File 객체를 생성(껍데기 파일)
	    System.out.println(uploadPath);
	    File saveFile = new File(uploadPath,saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	    	FileCopyUtils.copy(file.getBytes(),saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	}
	
}
