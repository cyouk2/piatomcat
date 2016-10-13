package com.zgd.mybatis.dto;

import java.io.Serializable;

public class PraInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7477913153535706614L;
	private int playDate;
	private int taiNo;
	private String sortKind;
	private String month;
	private String dataKind;
	private int limit;
	private int offset;

	public String getDataKind() {
		return dataKind;
	}

	public void setDataKind(String dataKind) {
		this.dataKind = dataKind;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getPlayDate() {
		return playDate;
	}

	public void setPlayDate(int playDate) {
		this.playDate = playDate;
	}

	public int getTaiNo() {
		return taiNo;
	}

	public void setTaiNo(int taiNo) {
		this.taiNo = taiNo;
	}

	public String getSortKind() {
		return sortKind;
	}

	public void setSortKind(String sortKind) {
		this.sortKind = sortKind;
	}

}
