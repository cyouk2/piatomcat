package com.zgd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.zgd.common.ComRootResult;
import com.zgd.mybatis.config.MyBatisConfig;
import com.zgd.mybatis.dao.TaiNoMapper;
import com.zgd.mybatis.dto.Shop;

@SuppressWarnings("serial")
public class GetShopList extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComRootResult re = new ComRootResult();
		try {
			TaiNoMapper taiNoMapper = sqlSession.getMapper(TaiNoMapper.class);
			List<Shop> list = taiNoMapper.getShopList();
			re.setRoot(list);
		} finally {
			sqlSession.close();
		}

		Gson gson = new Gson();

		re.setSuccess(true);
		re.setMsg("");

		resp.setContentType("text/plain");
		resp.getWriter().println(gson.toJson(re));
	}
}
