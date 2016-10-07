package com.zgd.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CommonUtil {

	public static boolean IsNullOrEmpty(Object obj) {

		if (obj == null)
			return true;
		if ("".equals(String.valueOf(obj).trim()))
			return true;
		return false;
	}

	public static String ObejctToString(Object obj) {

		if (obj == null)
			return "";
		if ("".equals(String.valueOf(obj).trim()))
			return "";
		return String.valueOf(obj).trim();
	}

	public static int ObejctToInt(Object obj) {
		int a = 0;
		if (obj == null)
			return a;
		try {
			a = Integer.parseInt(String.valueOf(obj).trim());
		} catch (Exception e) {
			return 0;
		}
		return a;
	}

	public static int getMonth(String playDate) {

		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		try {
			date = df.parse(playDate);
		} catch (ParseException e) {
		}
		Calendar datetime = Calendar.getInstance();
		datetime.setTime(date);
		return datetime.get(Calendar.MONTH);
	}
}
