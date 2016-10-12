package com.zgd.mybatis.dao;

import java.util.List;

import com.zgd.mybatis.dto.PiaDataInfo;
import com.zgd.mybatis.dto.PiaDataLayout;
import com.zgd.mybatis.dto.PraInfo;
import com.zgd.mybatis.dto.TaiInfo;

public interface PiaDataInfoMapper {
	
	public List<PiaDataInfo> getPiaDataInfoList(PraInfo prainfo);

	public List<PiaDataInfo> getPiaDataByDate(PraInfo prainfo);
	
	public List<TaiInfo> getTaiNoInfoOfAllDays();
	
	public List<PiaDataLayout> getPiaDataLayoutList(PraInfo prainfo);
	
	public void insertPiaDataInfo(PiaDataInfo piadatainfo);
	
	public void updatePiaDataInfo(PiaDataInfo piadatainfo);
	
	public void deletePiaDataInfo(PiaDataInfo piadatainfo);
}
