package com.zgd.mybatis.dao;

import java.util.List;

import com.zgd.mybatis.dto.PiaDataInfo;

public interface PiaDataInfoMapper {
	
	public List<PiaDataInfo> getPiaDataInfoList(PiaDataInfo piadatainfo);

	public PiaDataInfo getPiaDataInfo(PiaDataInfo piadatainfo);
	  
//	public void insertPiaDataInfo(PiaDataInfo piadatainfo);
//	
//	public void updatePiaDataInfo(PiaDataInfo piadatainfo);
//	
//	public void deletePiaDataInfo(PiaDataInfo piadatainfo);
}
