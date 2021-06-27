package com.spring.log.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.log.model.BasketVO;

@Service
public class BasketServiceImpl implements BasketService{
	@Autowired
	private BasketDAO basketDAO;

	@Override
	public void insert(BasketVO v) {
		basketDAO.insert(v);
	}

	@Override
	public List<BasketVO> selectBasketAll(BasketVO v) {
		return basketDAO.selectBasketAll(v);
	}

	@Override
	public void delete(String goodsname) {
		basketDAO.delete(goodsname);
	}

	
}
