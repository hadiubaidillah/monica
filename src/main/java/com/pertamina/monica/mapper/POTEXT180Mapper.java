package com.pertamina.monica.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.pertamina.monica.domain.POTEXT180;
import com.pertamina.monica.helper.QueryParameter;

public interface POTEXT180Mapper {

	/********************************** - Begin Generate - ************************************/
	
	void insert(POTEXT180 POTEXT180);
	
	void update(POTEXT180 POTEXT180);
	
	@Delete("DELETE FROM POTEXT180 WHERE ${clause}")
	void deleteBatch(QueryParameter param);
	
	@Delete("DELETE FROM POTEXT180 WHERE KIMAP=#{id}")
	void delete(POTEXT180 POTEXT180);
	
	List<POTEXT180> getList(QueryParameter param);
	
	POTEXT180 getEntity(String id);
	
	long getCount(QueryParameter param);
	
	String getNewId();
	
	/********************************** - End Generate - ************************************/

}
