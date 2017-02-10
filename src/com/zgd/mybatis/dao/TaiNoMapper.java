package com.zgd.mybatis.dao;

import java.util.List;

import com.zgd.mybatis.dto.PraInfo;
import com.zgd.mybatis.dto.Shop;
import com.zgd.mybatis.dto.TaiInfo;
import com.zgd.mybatis.dto.TaiNo;

public interface TaiNoMapper {
	
	public List<TaiNo> getTaiNoList(PraInfo praInfo);
	
	public List<Shop> getShopList();
	
	public List<TaiInfo> getTaiInfoList(PraInfo praInfo);
}
