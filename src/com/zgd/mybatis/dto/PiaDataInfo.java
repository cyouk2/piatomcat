package com.zgd.mybatis.dto;

import java.io.Serializable;

public class PiaDataInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3637708191719106674L;

	private int playDate;
	private int taiNo;
	private int rate;
	private int bonusCount;
	private int ballOutput;
	
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

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getBonusCount() {
		return bonusCount;
	}

	public void setBonusCount(int bonusCount) {
		this.bonusCount = bonusCount;
	}

	public int getBallOutput() {
		return ballOutput;
	}

	public void setBallOutput(int ballOutput) {
		this.ballOutput = ballOutput;
	}

}
