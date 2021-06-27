package com.spring.log.basket;

import java.util.List;

import com.spring.log.model.BasketVO;

public interface BasketService {
	public void insert(BasketVO v);
	public void  delete(String goodsname);	
	public List<BasketVO> selectBasketAll(BasketVO v);
}
