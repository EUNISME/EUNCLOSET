package com.spring.log.goods;

import java.util.List;

import com.spring.log.model.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> selectGoods(GoodsVO v);
	public GoodsVO selectMax(GoodsVO v);
	public GoodsVO selectOne(GoodsVO v);
	public GoodsVO selectCount(GoodsVO v);
	public GoodsVO selectTypeCount(GoodsVO v);
	public List<GoodsVO> selectAll(GoodsVO v);
	public void insert(GoodsVO v);
	public void update(GoodsVO v);
	public void delete(GoodsVO v);
	public void insert_basket(GoodsVO v);
}
