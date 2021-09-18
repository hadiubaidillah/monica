package com.pertamina.monica.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.pertamina.monica.domain.REQUSER;
import com.pertamina.monica.helper.QueryParameter;

public interface REQUSERMapper {

	/********************************** - Begin Generate - ************************************/
	
	void insert(REQUSER REQUSER);
	
	void update(REQUSER REQUSER);
	
	@Delete("DELETE FROM REQUSER WHERE ${clause}")
	void deleteBatch(QueryParameter param);
	
	@Delete("DELETE FROM REQUSER WHERE ID=#{ID}")
	void delete(REQUSER REQUSER);
	
	List<REQUSER> getList(QueryParameter param);
	
	REQUSER getEntity(String id);
	
	long getCount(QueryParameter param);
	
	String getNewId();
	
	/********************************** - End Generate - ************************************/

}
