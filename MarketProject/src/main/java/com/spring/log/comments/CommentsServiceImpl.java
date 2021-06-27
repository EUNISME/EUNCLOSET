package com.spring.log.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.log.model.CommentsVO;

@Service
public class CommentsServiceImpl implements CommentsService{

	@Autowired
	private CommentsDAO commentsDAO;
	
	@Override
	public void insert(CommentsVO v) {
		commentsDAO.insert(v);
	}

	@Override
	public List<CommentsVO> selectAll(CommentsVO v) {
		return commentsDAO.selectAll(v);
	}

	@Override
	public CommentsVO selectMax(CommentsVO v) {
		return commentsDAO.selectMax(v);
	}


}
