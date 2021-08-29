package com.pertamina.monica.helper;

public class QueryParameter {

	private String clause = "1";
	private String id = null;
	private String order;
	private String group;
	private Integer page = 10;
	private Integer limit = 10;
	private Integer offset = 0;

	public QueryParameter() {
		
	}

	public QueryParameter(String clause, Integer limit, Integer offset) {
		this.clause = " " + clause + " ";
		this.limit = limit;
		this.offset = offset;
	}

	public QueryParameter(String clause) {
		this.clause = " " + clause + " ";
	}
	public String getClause() {
		return clause;
	}

	public QueryParameter setClause(String clause) {
		this.clause = clause;
		return this;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Integer getPage() {
		return page;
	}

	public QueryParameter setPage(Integer page) {
		this.page = page;
		return this;
	}

	public Integer getLimit() {
		return limit;
	}

	public QueryParameter setLimit(Integer limit) {
		this.limit = limit;
		return this;
	}

	public Integer getOffset() {
		return offset;
	}

	public QueryParameter setOffset(Integer offset) {
		this.offset = offset;
		return this;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getId() {
		return id;
	}

	public QueryParameter setId(String id) {
		this.id = id;
		return this;
	}

}
