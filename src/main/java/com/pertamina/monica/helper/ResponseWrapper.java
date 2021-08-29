package com.pertamina.monica.helper;

import org.springframework.http.HttpStatus;

public class ResponseWrapper {
	
	private int code = HttpStatus.OK.value();
	private String message = HttpStatus.OK.getReasonPhrase();
	private Object data;
	private String image;

	public ResponseWrapper() {}

	public ResponseWrapper(Object data) {
		this.data = data;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
