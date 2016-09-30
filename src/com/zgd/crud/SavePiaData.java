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

@SuppressWarnings("serial")
public class SavePiaData extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String playDate = req.getParameter("playDate");
		String taiNo = req.getParameter("taiNo");
		String bonusCount = req.getParameter("bonusCount");
		String ballOutput = req.getParameter("ballOutput");
		String rate = req.getParameter("rate");
		
		SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
		ComResult re = new ComResult();
		PiaDataInfo param = new PiaDataInfo();
		param.setPlayDate(CommonUtil.ObejctToInt(playDate));
		param.setTaiNo(CommonUtil.ObejctToInt(taiNo));
		param.setRate(CommonUtil.ObejctToInt(rate));
		param.setBonusCount(CommonUtil.ObejctToInt(bonusCount));
		param.setBallOutput(CommonUtil.ObejctToInt(ballOutput));
		try {
			PiaDataInfoMapper piaDataInfoMapper = sqlSession.getMapper(PiaDataInfoMapper.class);
			List<PiaDataInfo> result = piaDataInfoMapper.getPiaDataInfoList(param);
			if(result != null && result.size() > 0){
				piaDataInfoMapper.updatePiaDataInfo(param);
				re.setMsg("台番：" + taiNo + ";日付：" + playDate + "の情報を更新しました。");
			
			}else{
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
