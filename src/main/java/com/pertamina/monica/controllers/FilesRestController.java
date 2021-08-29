package com.pertamina.monica.controllers;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.pertamina.monica.helper.FileTypeSupport;
import com.pertamina.monica.repo.StorageService;


@RestController
@RequestMapping("/files")
public class FilesRestController {
	
	@Autowired
	@Qualifier("fileSystemStorage")
	protected StorageService fileSystemService;
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public void loadFile(
			@PathVariable String id,
			@RequestParam("filename") String filename,
			@RequestParam("preview") Optional<String> preview,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		System.out.println(id);
		
			String ext = FilenameUtils.getExtension(filename);
			String type = "application";
			if(Arrays.asList(FileTypeSupport.IMAGE.extensions()).contains(ext)) {
				type="image";
				if(preview.isPresent()) {
					id = "small_"+id;
				}
			}else {
				if(preview.isPresent() || filename.contains(".pdf")) {
					response.setHeader("Content-Disposition", "filename=\""+filename.replaceAll("[^a-zA-Z0-9 .-]", "")+"\"");
				}else {
					response.setHeader("Content-Disposition", "attachment; filename=\""+filename.replaceAll("[^a-zA-Z0-9 .-]", "")+"\"");
				}
			}
			response.setContentType(type+"/"+ext);
			
			File file = fileSystemService.load(id + "." + ext);
			FileInputStream fileInputStream = new FileInputStream(file);
			OutputStream responseOutputStream = response.getOutputStream();
			int bytes;
			while ((bytes = fileInputStream.read()) != -1) {
				responseOutputStream.write(bytes);
			}
			fileInputStream.close();
		
		
	}
}
