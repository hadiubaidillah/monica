package com.pertamina.monica.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.pertamina.monica.domain.REQITEMIMAGE;
import com.pertamina.monica.helper.QueryParameter;

public interface REQITEMIMAGEMapper {

	/********************************** - Begin Generate - ************************************/
	
	void insert(REQITEMIMAGE REQITEMIMAGE);
	
	void update(REQITEMIMAGE REQITEMIMAGE);
	
	@Delete("DELETE FROM REQITEMIMAGE WHERE ${clause}")
	void deleteBatch(QueryParameter param);
	
	@Delete("DELETE FROM REQITEMIMAGE WHERE ID=#{ID}")
	void delete(REQITEMIMAGE REQITEMIMAGE);
	
	List<REQITEMIMAGE> getList(QueryParameter param);
	
	REQITEMIMAGE getEntity(String id);
	
	long getCount(QueryParameter param);
	
	String getNewId();
	
	/********************************** - End Generate - ************************************/

}
