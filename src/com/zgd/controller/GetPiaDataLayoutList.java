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
import com.zgd.mybatis.dao.PiaDataInfoMapper;
import com.zgd.mybatis.dto.PiaDataLayout;
import com.zgd.mybatis.dto.PraInfo;

@SuppressWarnings("serial")
public class GetPiaDataLayoutList extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String layoutkind = CommonUtil.ObejctToString(req.getParameter("layoutkind"));
		String month = CommonUtil.ObejctToString(req.getParameter("month"));
		int limitSize = CommonUtil.ObejctToInt(req.getParameter("limitSize"));
		int offsetSize = CommonUtil.ObejctToInt(req.getParameter("offsetSize"));
		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComRootResult re = new ComRootResult();
		try {
			PiaDataInfoMapper taiNoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			PraInfo prainfo = new PraInfo();
			prainfo.setDataKind(layoutkind);
			prainfo.setLimit(limitSize);
			prainfo.setOffset(offsetSize);
			prainfo.setMonth(month);
			List<PiaDataLayout> list = taiNoMapper.getPiaDataLayoutList(prainfo);
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
