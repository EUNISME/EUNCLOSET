package com.spring.log.comments;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.log.model.CommentsVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(CommentsVO v) {
		mybatis.insert("comments-mapping.insert_sql", v);
	}

	@Override
	public List<CommentsVO> selectAll(CommentsVO v) {
		return mybatis.selectList("comments-mapping.selectcomments_sql", v);
	}

	@Override
	public CommentsVO selectMax(CommentsVO v) {
		return mybatis.selectOne("comments-mapping.selectmax_sql");
	}

}
