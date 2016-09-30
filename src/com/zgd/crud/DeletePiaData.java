package com.zgd.crud;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.google.gson.Gson;
import com.zgd.common.ComResult;
import com.zgd.common.CommonUtil;
import com.zgd.mybatis.config.MyBatisConfig;
import com.zgd.mybatis.dao.PiaDataInfoMapper;
import com.zgd.mybatis.dto.PiaDataInfo;

@SuppressWarnings("serial")
public class DeletePiaData extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String playDate = req.getParameter("playDate");
		String taiNo = req.getParameter("taiNo");
		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComResult re = new ComResult();
		PiaDataInfo param = new PiaDataInfo();
		param.setPlayDate(CommonUtil.ObejctToInt(playDate));
		param.setTaiNo(CommonUtil.ObejctToInt(taiNo));
		
		try {
			PiaDataInfoMapper piaDataInfoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			piaDataInfoMapper.deletePiaDataInfo(param);
			re.setSuccess(true);
			re.setMsg("データを削除しました。");
		} catch (Exception e) {
			
			re.setSuccess(false);
			re.setMsg("削除処理は失敗しました。");
		} finally {
			Gson gson = new Gson();
			resp.setContentType("text/html; charset=UTF-8");
			resp.getWriter().println(gson.toJson(re));
		}
	}
}
