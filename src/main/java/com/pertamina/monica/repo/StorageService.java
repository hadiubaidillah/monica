package com.pertamina.monica.repo;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

	public void store(MultipartFile file, String filename) throws Exception;
	public File load(String filename) throws Exception;
	public void delete(String filename) throws Exception;
	public void copy(String filenameSource, String filenameDestination) throws Exception;
	
}
