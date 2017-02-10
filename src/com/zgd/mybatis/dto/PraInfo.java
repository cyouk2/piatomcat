package com.zgd.mybatis.dto;

import java.io.Serializable;

public class PraInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7477913153535706614L;
	private String playdate;
	private String taino;
	private String shop;

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

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

}
