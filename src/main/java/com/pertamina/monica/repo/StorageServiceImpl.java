package com.pertamina.monica.repo;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

@Repository("fileSystemStorage")
@Configuration
public class StorageServiceImpl implements StorageService {

	@Value("${app.folder}")
	private String appFolder;
	

	@Override
	public File load(String filename)	throws Exception {
		System.out.println("load from file system");
		
		File file = new File(appFolder + filename);
		if(!file.exists()) {
			file = new File(appFolder + "ImageNotFound.png");
		}
		return file;
	}
	
	
	@Override
	public void copy(String filenameSource, String filenameDestination) throws Exception {
		File fileSource = new File(appFolder + filenameSource);
		if(fileSource.exists()){
			File fileDestination = new File(appFolder + filenameDestination);
			FileCopyUtils.copy(fileSource, fileDestination);
			System.out.println("copy file from "+fileSource.getPath()+" to "+fileDestination.getPath());
		} else {
			System.err.println("gagal copy karena sumber file tidak ada! " + filenameSource);
		}
	}
	
	
	@Override
	public void delete(String filename) throws Exception {
		File file = new File(appFolder + filename);
		if(file.exists()){
//			FileCopyUtils.copy(file, new File(trashFolder + filename));
			FileSystemUtils.deleteRecursively(file);
			System.out.println("delete from file system");
		}
	}

	@Override
	public void store(MultipartFile file, String filename) throws Exception {
		System.out.println("store in file system: " + appFolder);
			
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(appFolder + filename)));
				stream.write(bytes);
				stream.close();
				
			} catch (Exception e) {
					
			}
		} else {
			throw new Exception("Failed store file.");
		}
	}

}
