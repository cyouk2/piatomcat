package com.zgd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.zgd.common.ComRootResult;
import com.zgd.common.CommonUtil;
import com.zgd.mybatis.config.MyBatisConfig;
import com.zgd.mybatis.dao.TaiNoMapper;
import com.zgd.mybatis.dto.PraInfo;
import com.zgd.mybatis.dto.TaiInfo;

@SuppressWarnings("serial")
public class GetTaiInfoList extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String shop = CommonUtil.ObejctToString(req.getParameter("shop"));
		String taino = CommonUtil.ObejctToString(req.getParameter("taino"));
		String playdate = CommonUtil.ObejctToString(req.getParameter("playdate"));
		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComRootResult re = new ComRootResult();
		try {
			TaiNoMapper taiNoMapper = sqlSession.getMapper(TaiNoMapper.class);
			PraInfo prainfo = new PraInfo();
			prainfo.setShop(shop);
			prainfo.setPlaydate(playdate);
			prainfo.setTaino(taino);
			List<TaiInfo> list = taiNoMapper.getTaiInfoList(prainfo);
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

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		doGet(req, resp);
	}

}
