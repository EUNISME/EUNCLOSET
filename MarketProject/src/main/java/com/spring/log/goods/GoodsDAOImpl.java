package com.spring.log.goods;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.log.model.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<GoodsVO> selectGoods(GoodsVO v) {
		return mybatis.selectList("goods-mapping.selectgoods_sql", v);
	}

	@Override
	public GoodsVO selectMax(GoodsVO v) {
		return mybatis.selectOne("goods-mapping.selectmax_sql");
	}

	@Override
	public List<GoodsVO> selectAll(GoodsVO v) {
		return mybatis.selectList("goods-mapping.selectall_sql", v);
	}

	@Override
	public void insert(GoodsVO v) {
		mybatis.insert("goods-mapping.insert_sql", v);	
	}

	@Override
	public GoodsVO selectOne(GoodsVO v) {
		return mybatis.selectOne("goods-mapping.selectone_sql", v);
	}

	@Override
	public void update(GoodsVO v) {
		mybatis.update("goods-mapping.update_sql", v);
	}

	@Override
	public void delete(GoodsVO v) {
		mybatis.delete("goods-mapping.delete_sql", v);
	}

	@Override
	public void insert_basket(GoodsVO v) {
		mybatis.insert("goods-mapping.insertbasket_sql", v);	
		
	}

	@Override
	public GoodsVO selectCount(GoodsVO v) {
		return mybatis.selectOne("goods-mapping.selectcount_sql", v);
	}

	@Override
	public GoodsVO selectTypeCount(GoodsVO v) {
		return mybatis.selectOne("goods-mapping.selecttypecount_sql", v);
	}

}
