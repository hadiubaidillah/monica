package com.pertamina.monica.domain;

import java.util.ArrayList;
import java.util.List;

public class REQUSER {

	public static final String COLUMN_ID = "ID";
	public static final String COLUMN_NAME = "NAME";
	
	private Long ID;
	private String NAME;
	
	public REQUSER() {
	
	}

	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}
	
	
	
}
