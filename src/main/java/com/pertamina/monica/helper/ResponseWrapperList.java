package com.pertamina.monica.helper;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResponseWrapperList extends ResponseWrapper {

	private long count;
	private boolean nextMore = false;
	private String nextPage = "";
	private int nextPageNumber = 2;

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	@JsonProperty("next_more")
	public boolean isNextMore() {
		return nextMore;
	}

	public void setNextMore(boolean nextMore) {
		this.nextMore = nextMore;
	}

	@JsonProperty("next_page")
	public String getNextPage() {
		return nextPage;
	}

	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}

	@JsonProperty("next_page_number")
	public int getNextPageNumber() {
		return nextPageNumber;
	}

	public void setNextPageNumber(int nextPageNumber) {
		this.nextPageNumber = nextPageNumber;
	}

}
