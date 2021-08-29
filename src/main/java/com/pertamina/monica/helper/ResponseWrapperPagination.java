package com.pertamina.monica.helper;

public class ResponseWrapperPagination extends ResponseWrapper {
	
	private Pagination pagination = new Pagination();
	
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	

}
