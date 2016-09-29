package com.zgd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.zgd.common.ComRootResult;
import com.zgd.common.CommonUtil;
import com.zgd.mybatis.config.MyBatisConfig;
import com.zgd.mybatis.dao.TaiNoMapper;
import com.zgd.mybatis.dto.TaiNo;

@SuppressWarnings("serial")
public class GetTaiNoList extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		List<Map<String,Object>> lists = new ArrayList<Map<String,Object>>();
		try {
			TaiNoMapper taiNoMapper = sqlSession.getMapper(TaiNoMapper.class);
			List<TaiNo> list = taiNoMapper.getTaiNoList();
			for (TaiNo en : list) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("taiNo", CommonUtil.ObejctToString(en.getTaiNo()));
				lists.add(map);
			}
		} finally {
			sqlSession.close();
		}

		
		Gson gson = new Gson();
		ComRootResult re = new ComRootResult();
		re.setSuccess(true);
		re.setMsg("");
		re.setRoot(lists);
		resp.setContentType("text/plain");
		resp.getWriter().println(gson.toJson(re));
	}
}
