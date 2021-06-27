package com.spring.log.basket;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.log.model.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(BasketVO v) {
		mybatis.insert("basket-mapping.insert_sql", v);
	}

	@Override
	public List<BasketVO> selectBasketAll(BasketVO v) {
		return mybatis.selectList("basket-mapping.select_sql", v);
	}

	@Override
	public void delete(String goodsname) {
		mybatis.delete("basket-mapping.delect_sql", goodsname);
	}
}
