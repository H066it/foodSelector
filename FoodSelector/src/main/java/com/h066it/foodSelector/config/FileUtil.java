package com.h066it.foodSelector.config;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.h066it.foodSelector.dto.FileDto;

public class FileUtil {
	
	public List<FileDto> saveFiles(List<MultipartFile> files, int maxFId) {
		
		String path = "C:\\Users\\tosh\\git\\foodSelector\\FoodSelector\\src\\main\\resources\\static\\images\\thumbs";
		
		List<FileDto> fileList = new ArrayList<FileDto>();
		
		for(MultipartFile file : files) {
			
			saveFileRepository(file, path, file.getOriginalFilename(), maxFId);
			
			FileDto fDto = new FileDto();

			System.out.println("fileName : " + file.getOriginalFilename());
			fDto.setFileName(file.getOriginalFilename());
			System.out.println("fileSize : " + file.getSize());
			fDto.setFileSize((int)file.getSize());
			
			fileList.add(fDto);
		}
		
		return fileList;
	}
	
	private void saveFileRepository(MultipartFile upFile, String path, String fileName, int maxFId) {
		File fileRepository = new File(path);
		if(!fileRepository.exists()) {	// 폴더 없을시 생성
			fileRepository.mkdirs();
		}
		
		File file = new File(path + "/" + maxFId + "_-_" + fileName);

		try {
			upFile.transferTo(file);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}
	
}
