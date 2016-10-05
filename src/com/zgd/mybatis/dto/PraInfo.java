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
