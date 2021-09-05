package com.pertamina.monica.helper;

public class ResponseWrapperPagination extends ResponseWrapperList {
	
	private Pagination pagination = new Pagination();
	
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	

}
