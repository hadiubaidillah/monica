package com.pertamina.monica.domain;

public class REQITEM {

	public static final String COLUMN_LINENUM = "LINENUM";
	public static final String COLUMN_COMPANY = "COMPANY";
	public static final String COLUMN_REQUESTEDBY = "REQUESTEDBY";
	public static final String COLUMN_REQUESTTYPE = "REQUESTTYPE";
	public static final String COLUMN_OLDITEMNUM = "OLDITEMNUM";
	public static final String COLUMN_MAINGROUP = "MAINGROUP";
	public static final String COLUMN_NOUNMODIFIER = "NOUNMODIFIER";
	public static final String COLUMN_CODING = "CODING";
	public static final String COLUMN_SHORTTEXT = "SHORTTEXT";
	public static final String COLUMN_ISSPAREPART = "ISSPAREPART";
	public static final String COLUMN_POTEXT = "POTEXT";
	public static final String COLUMN_PURCHASINGGROUP = "PURCHASINGGROUP";
	public static final String COLUMN_MANUFACTURER = "MANUFACTURER";
	public static final String COLUMN_PARTNUMBER = "PARTNUMBER";
	public static final String COLUMN_UOM = "UOM";
	public static final String COLUMN_MATTYPE = "MATTYPE";
	public static final String COLUMN_PROFITCENTER = "PROFITCENTER";
	public static final String COLUMN_LABOFFICE = "LABOFFICE";
	public static final String COLUMN_STATUS = "STATUS";
	public static final String COLUMN_GAMBAR = "GAMBAR";
	
	private Long LINENUM;
	private String COMPANY;
	private String REQUESTEDBY;
	private String REQUESTTYPE;
	private String OLDITEMNUM;
	private String MAINGROUP;
	private String NOUNMODIFIER;
	private String CODING;
	private String SHORTTEXT;
	private String ISSPAREPART;
	private String POTEXT;
	private String PURCHASINGGROUP;
	private String MANUFACTURER;
	private String PARTNUMBER;
	private String UOM;
	private String MATTYPE;
	private String PROFITCENTER;
	private String LABOFFICE;
	private String STATUS;
	private String GAMBAR;
	
	public REQITEM() {
	
	}
	
	public REQITEM(Long LINENUM) {
		this.LINENUM = LINENUM;
	}

	public Long getLINENUM() {
		return LINENUM;
	}

	public void setLINENUM(Long lINENUM) {
		LINENUM = lINENUM;
	}

	public String getCOMPANY() {
		return COMPANY;
	}

	public void setCOMPANY(String cOMPANY) {
		COMPANY = cOMPANY;
	}

	public String getREQUESTEDBY() {
		return REQUESTEDBY;
	}

	public void setREQUESTEDBY(String rEQUESTEDBY) {
		REQUESTEDBY = rEQUESTEDBY;
	}

	public String getREQUESTTYPE() {
		return REQUESTTYPE;
	}

	public void setREQUESTTYPE(String rEQUESTTYPE) {
		REQUESTTYPE = rEQUESTTYPE;
	}

	public String getOLDITEMNUM() {
		return OLDITEMNUM;
	}

	public void setOLDITEMNUM(String oLDITEMNUM) {
		OLDITEMNUM = oLDITEMNUM;
	}

	public String getMAINGROUP() {
		return MAINGROUP;
	}

	public void setMAINGROUP(String mAINGROUP) {
		MAINGROUP = mAINGROUP;
	}

	public String getNOUNMODIFIER() {
		return NOUNMODIFIER;
	}

	public void setNOUNMODIFIER(String nOUNMODIFIER) {
		NOUNMODIFIER = nOUNMODIFIER;
	}

	public String getCODING() {
		return CODING;
	}

	public void setCODING(String cODING) {
		CODING = cODING;
	}

	public String getSHORTTEXT() {
		return SHORTTEXT;
	}

	public void setSHORTTEXT(String sHORTTEXT) {
		SHORTTEXT = sHORTTEXT;
	}

	public String getISSPAREPART() {
		return ISSPAREPART;
	}

	public void setISSPAREPART(String iSSPAREPART) {
		ISSPAREPART = iSSPAREPART;
	}

	public String getPOTEXT() {
		return POTEXT;
	}

	public void setPOTEXT(String pOTEXT) {
		POTEXT = pOTEXT;
	}

	public String getPURCHASINGGROUP() {
		return PURCHASINGGROUP;
	}

	public void setPURCHASINGGROUP(String pURCHASINGGROUP) {
		PURCHASINGGROUP = pURCHASINGGROUP;
	}

	public String getMANUFACTURER() {
		return MANUFACTURER;
	}

	public void setMANUFACTURER(String mANUFACTURER) {
		MANUFACTURER = mANUFACTURER;
	}

	public String getPARTNUMBER() {
		return PARTNUMBER;
	}

	public void setPARTNUMBER(String pARTNUMBER) {
		PARTNUMBER = pARTNUMBER;
	}

	public String getUOM() {
		return UOM;
	}

	public void setUOM(String uOM) {
		UOM = uOM;
	}

	public String getMATTYPE() {
		return MATTYPE;
	}

	public void setMATTYPE(String mATTYPE) {
		MATTYPE = mATTYPE;
	}

	public String getPROFITCENTER() {
		return PROFITCENTER;
	}

	public void setPROFITCENTER(String pROFITCENTER) {
		PROFITCENTER = pROFITCENTER;
	}

	public String getLABOFFICE() {
		return LABOFFICE;
	}

	public void setLABOFFICE(String lABOFFICE) {
		LABOFFICE = lABOFFICE;
	}

	public String getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}

	public String getGAMBAR() {
		return GAMBAR;
	}

	public void setGAMBAR(String gAMBAR) {
		GAMBAR = gAMBAR;
	}
	
}
