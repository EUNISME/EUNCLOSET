package com.spring.log.goods;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.log.model.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDAO goodsDao;
	
	@Override
	public List<GoodsVO> selectGoods(GoodsVO v) {
		return goodsDao.selectGoods(v);
	}

	@Override
	public GoodsVO selectMax(GoodsVO v) {
		return goodsDao.selectMax(v);
	}

	@Override
	public List<GoodsVO> selectAll(GoodsVO v) {
		return goodsDao.selectAll(v);
	}

	@Override
	public void insert(GoodsVO v) {
		goodsDao.insert(v);
	}

	@Override
	public GoodsVO selectOne(GoodsVO v) {
		return goodsDao.selectOne(v);
	}

	@Override
	public void update(GoodsVO v) {
		goodsDao.update(v);
	}

	@Override
	public void delete(GoodsVO v) {
		goodsDao.delete(v);
	}

	@Override
	public void insert_basket(GoodsVO v) {
		goodsDao.insert_basket(v);
		
	}

	@Override
	public GoodsVO selectCount(GoodsVO v) {
		return goodsDao.selectCount(v);
	}

	@Override
	public GoodsVO selectTypeCount(GoodsVO v) {
		return goodsDao.selectTypeCount(v);
	}

}
