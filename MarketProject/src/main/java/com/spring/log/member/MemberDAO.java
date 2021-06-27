package com.spring.log.member;

import java.util.List;

import com.spring.log.model.MemberVO;

public interface MemberDAO {
	public void insert(MemberVO v);
	public void delete(MemberVO v);
	public void update(MemberVO v);
	public MemberVO selectMax(MemberVO v);
	public MemberVO login(MemberVO v);
	public int selectId(String id);
	public List<MemberVO> selectAll(MemberVO v);
	public MemberVO selectOne(MemberVO v);
	public MemberVO selectCount(MemberVO v);
}
