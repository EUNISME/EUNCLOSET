package com.spring.log.basket;

import java.util.List;

import com.spring.log.model.BasketVO;

public interface BasketDAO {
	public void insert(BasketVO v);
	public void  delete(String goodsname);
	public List<BasketVO> selectBasketAll(BasketVO v);
}
