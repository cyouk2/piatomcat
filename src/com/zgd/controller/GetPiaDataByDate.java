package com.zgd.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.zgd.mybatis.dto.PiaDataInfo;
import com.zgd.mybatis.dto.PraInfo;

@SuppressWarnings("serial")
public class GetPiaDataByDate extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String playDate = CommonUtil.ObejctToString(req.getParameter("playDate"));
		String sortKind = CommonUtil.ObejctToString(req.getParameter("sortKind"));
		String month = CommonUtil.ObejctToString(req.getParameter("month"));
		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComRootResult re = new ComRootResult();
		PraInfo param = new PraInfo();
		param.setPlayDate(CommonUtil.ObejctToInt(playDate));
		param.setSortKind(sortKind);
		param.setMonth(month);
		try {
			PiaDataInfoMapper piaDataInfoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			List<PiaDataInfo> list = piaDataInfoMapper.getPiaDataByDate(param);
			if (list != null && list.size() > 0) {
				re.setRoot(list);
			} else {
				re.setRoot(new ArrayList<PiaDataInfo>());
			}

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
