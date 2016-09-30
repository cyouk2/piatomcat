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
	private int totalOut;
	private int rateN;
	private int bonusCountN;
	private int ballOutputN;
	private String playDateN;
	private int totalOutN;
	private int outMax;

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

	public int getTotalOut() {
		return totalOut;
	}

	public void setTotalOut(int totalOut) {
		this.totalOut = totalOut;
	}

	public int getRateN() {
		return rateN;
	}

	public void setRateN(int rateN) {
		this.rateN = rateN;
	}

	public int getBonusCountN() {
		return bonusCountN;
	}

	public void setBonusCountN(int bonusCountN) {
		this.bonusCountN = bonusCountN;
	}

	public int getBallOutputN() {
		return ballOutputN;
	}

	public void setBallOutputN(int ballOutputN) {
		this.ballOutputN = ballOutputN;
	}

	public String getPlayDateN() {
		return playDateN;
	}

	public void setPlayDateN(String playDateN) {
		this.playDateN = playDateN;
	}

	public int getTotalOutN() {
		return totalOutN;
	}

	public void setTotalOutN(int totalOutN) {
		this.totalOutN = totalOutN;
	}

	public int getOutMax() {
		return outMax;
	}

	public void setOutMax(int outMax) {
		this.outMax = outMax;
	}

}
