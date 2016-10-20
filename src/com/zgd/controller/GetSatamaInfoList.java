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
import com.zgd.mybatis.dao.PiaDataInfoMapper;
import com.zgd.mybatis.dto.PiaDataLayout;

@SuppressWarnings("serial")
public class GetSatamaInfoList extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComRootResult re = new ComRootResult();
		try {
			PiaDataInfoMapper taiNoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			List<PiaDataLayout> list = taiNoMapper.getSatamaInfoList();
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
