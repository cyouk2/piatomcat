package com.zgd.mybatis.config;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

@SuppressWarnings("serial")
public class MyBatisConfig extends HttpServlet {
	private static SqlSessionFactory sqlSessionFactory;

	public void init() {

		try {
			InputStream inputStream = Resources.getResourceAsStream("com/zgd/mybatis/config/mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public static void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		MyBatisConfig.sqlSessionFactory = sqlSessionFactory;
	}
}
