package com.spring.log.comments;

import java.util.List;

import com.spring.log.model.CommentsVO;

public interface CommentsDAO {
	public void insert(CommentsVO v);
	public CommentsVO selectMax(CommentsVO v);
	public List<CommentsVO> selectAll(CommentsVO v);
}
