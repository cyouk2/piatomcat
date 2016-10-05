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
public class GetPiaDataForChart extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String taiNo = req.getParameter("taiNo");
		String playDate = req.getParameter("playDate");
		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComRootResult re = new ComRootResult();
		PraInfo param = new PraInfo();
		param.setTaiNo(CommonUtil.ObejctToInt(taiNo));
		if (!CommonUtil.IsNullOrEmpty(playDate)) {
			param.setPlayDate(CommonUtil.ObejctToInt(playDate));
		}
		List<PiaDataInfo> list2 = new ArrayList<PiaDataInfo>();
		try {
			PiaDataInfoMapper piaDataInfoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			List<PiaDataInfo> list = piaDataInfoMapper.getPiaDataInfoList(param);
			int outMax = 0;
			for (PiaDataInfo en : list) {
				int s = en.getTotalOutN();
				if (s < outMax) {
					outMax = s;
				}
				en.setOutMaxN(outMax);
				en.setOutMax(outMax * 100);
				list2.add(en);
			}
			re.setRoot(list2);
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
