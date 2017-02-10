package com.zgd.mybatis.dto;

import java.io.Serializable;

public class TaiInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3637708191719106674L;

	private String shop;
	private String playdate;
	private String taino;
	private int lineno;
	private int ballin;
	private int bonus;
	private int big16r;
	private int middle8r;
	private int small4r;
	private int starttotal;

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getPlaydate() {
		return playdate;
	}

	public void setPlaydate(String playdate) {
		this.playdate = playdate;
	}

	public String getTaino() {
		return taino;
	}

	public void setTaino(String taino) {
		this.taino = taino;
	}

	public int getLineno() {
		return lineno;
	}

	public void setLineno(int lineno) {
		this.lineno = lineno;
	}

	public int getBallin() {
		return ballin;
	}

	public void setBallin(int ballin) {
		this.ballin = ballin;
	}

	public int getBonus() {
		return bonus;
	}

	public void setBonus(int bonus) {
		this.bonus = bonus;
	}

	public int getBig16r() {
		return big16r;
	}

	public void setBig16r(int big16r) {
		this.big16r = big16r;
	}

	public int getMiddle8r() {
		return middle8r;
	}

	public void setMiddle8r(int middle8r) {
		this.middle8r = middle8r;
	}

	public int getSmall4r() {
		return small4r;
	}

	public void setSmall4r(int small4r) {
		this.small4r = small4r;
	}

	public int getStarttotal() {
		return starttotal;
	}

	public void setStarttotal(int starttotal) {
		this.starttotal = starttotal;
	}

}
