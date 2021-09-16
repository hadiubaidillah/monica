package com.pertamina.monica.domain;

public class REQITEMIMAGE {

	public static final String COLUMN_ID = "ID";
	public static final String COLUMN_REQITEM = "REQITEM";
	public static final String COLUMN_NAME = "NAME";
	public static final String COLUMN_IMAGE = "IMAGE";
	
	private Long ID;
	private Long REQITEM;
	private String NAME;
	private String IMAGE;
	
	public REQITEMIMAGE() {
	
	}
	
	public REQITEMIMAGE(Long iD, Long rEQITEM, String nAME, String iMAGE) {
		ID = iD;
		REQITEM = rEQITEM;
		NAME = nAME;
		IMAGE = iMAGE;
	}

	public Long getID() {
		return ID;
	}

	public void setID(Long iD) {
		ID = iD;
	}

	public Long getREQITEM() {
		return REQITEM;
	}

	public void setREQITEM(Long rEQITEM) {
		REQITEM = rEQITEM;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getIMAGE() {
		return IMAGE;
	}

	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}
}
