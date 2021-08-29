package com.pertamina.monica.helper;

public enum FileTypeSupport {
	DOCUMENT("DOCUMENT", new String[]{"pdf","doc","docx","xls","xlsx","ppt","pptx"}),
	IMAGE("IMAGE", new String[]{"jpg", "jpeg", "png"})
	;

	private final String text;
	private final String[] extensions;

	private FileTypeSupport(final String text, final String[] extensions) {
		this.text = text;
		this.extensions = extensions;
	}
	
	public String[] extensions() {
		return this.extensions;
	}

	@Override
	public String toString() {
		return text;
	}
}
