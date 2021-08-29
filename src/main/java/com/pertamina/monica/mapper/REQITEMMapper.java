package com.pertamina.monica.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.pertamina.monica.domain.REQITEM;
import com.pertamina.monica.helper.QueryParameter;

public interface REQITEMMapper {

	/********************************** - Begin Generate - ************************************/
	
	void insert(REQITEM REQITEM);
	
	void update(REQITEM REQITEM);
	
	@Delete("DELETE FROM REQITEM WHERE ${clause}")
	void deleteBatch(QueryParameter param);
	
	@Delete("DELETE FROM REQITEM WHERE KIMAP=#{id}")
	void delete(REQITEM REQITEM);
	
	List<REQITEM> getList(QueryParameter param);
	
	REQITEM getEntity(String id);
	
	long getCount(QueryParameter param);
	
	Long getNewId();
	
	/********************************** - End Generate - ************************************/

}
