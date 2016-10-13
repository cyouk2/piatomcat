package com.zgd.mybatis.dto;

import java.io.Serializable;

public class TaiInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3637708191719106674L;

	private int playDate;
	private String playDateN;
	private int totalOut;
	private int totalOutBefore;
	private int a;
	private int b;
	private int c;
	private int d;
	
	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public int getC() {
		return c;
	}

	public void setC(int c) {
		this.c = c;
	}

	public int getD() {
		return d;
	}

	public void setD(int d) {
		this.d = d;
	}

	public String getPlayDateN() {
		return playDateN;
	}

	public void setPlayDateN(String playDateN) {
		this.playDateN = playDateN;
	}

	public int getPlayDate() {
		return playDate;
	}

	public void setPlayDate(int playDate) {
		this.playDate = playDate;
	}

	public int getTotalOut() {
		return totalOut;
	}

	public void setTotalOut(int totalOut) {
		this.totalOut = totalOut;
	}

	public int getTotalOutBefore() {
		return totalOutBefore;
	}

	public void setTotalOutBefore(int totalOutBefore) {
		this.totalOutBefore = totalOutBefore;
	}

}
