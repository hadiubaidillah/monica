package com.pertamina.monica.helper;

public class Pagination {
	
	private int rowcount = 20;
	private int activepage = 1;
	private long recordcount = 1000;
	
	public Pagination() {
		
	}
	
	public Pagination(int rowcount, int activepage, long recordcount) {
		this.rowcount = rowcount;
		this.activepage = activepage;
		this.recordcount = recordcount;
	}
	
	public int getPagecount() {
		return Double.valueOf(Math.ceil((double)recordcount/rowcount)).intValue();
	}
	public int getRowcount() {
		return rowcount;
	}
	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}
	public int getActivepage() {
		return activepage;
	}
	public void setActivepage(int activepage) {
		this.activepage = activepage;
	}
	public long getRecordcount() {
		return recordcount;
	}
	public void setRecordcount(long recordcount) {
		this.recordcount = recordcount;
	}
	public int getIndex() {
		return (getActivepage()-1)*rowcount;
	}
}
