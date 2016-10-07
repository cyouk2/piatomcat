package com.zgd.crud;

import java.io.IOException;
import java.util.List;

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
import com.zgd.mybatis.dto.PraInfo;

@SuppressWarnings("serial")
public class SavePiaData extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int playDate = CommonUtil.ObejctToInt(req.getParameter("playDate"));
		int taiNo = CommonUtil.ObejctToInt(req.getParameter("taiNo"));
		int bonusCount = CommonUtil.ObejctToInt(req.getParameter("bonusCount"));
		int ballOutput = CommonUtil.ObejctToInt(req.getParameter("ballOutput"));
		int rate = CommonUtil.ObejctToInt(req.getParameter("rate"));

		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComResult re = new ComResult();
		PiaDataInfo param = new PiaDataInfo();
		param.setPlayDate(playDate);
		param.setTaiNo(taiNo);
		param.setRate(rate);
		param.setBonusCount(bonusCount);
		param.setBallOutput(ballOutput);
		param.setMonth(CommonUtil.ObejctToInt(playDate));
		if (taiNo >= 557 && taiNo <= 584) {
			param.setKind(1);
		}else{
			param.setKind(2);
		}
		PraInfo param1 = new PraInfo();
		param1.setPlayDate(playDate);
		param1.setTaiNo(taiNo);

		try {
			PiaDataInfoMapper piaDataInfoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			List<PiaDataInfo> result = piaDataInfoMapper.getPiaDataInfoList(param1);
			if (result != null && result.size() > 0) {
				piaDataInfoMapper.updatePiaDataInfo(param);
				re.setMsg("台番：" + taiNo + ";日付：" + playDate + "の情報を更新しました。");

			} else {
				piaDataInfoMapper.insertPiaDataInfo(param);
				re.setMsg("台番：" + taiNo + ";日付：" + playDate + "の情報を保存しました。");
			}
		} catch (Exception w) {
			re.setMsg("保存処理にはエラーが発生しました。");
		} finally {
			sqlSession.close();
		}
		re.setSuccess(true);
		Gson gson = new Gson();
		resp.setContentType("text/html; charset=UTF-8");
		resp.getWriter().println(gson.toJson(re));
	}
}
