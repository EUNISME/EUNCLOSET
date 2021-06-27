package com.spring.log.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.log.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public void insert(MemberVO v) {
		memberDao.insert(v);
	}

	@Override
	public MemberVO selectMax(MemberVO v) {
		return memberDao.selectMax(v);
	}

	@Override
	public int selectId(String id) {
		return memberDao.selectId(id);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO v) {
		return memberDao.selectAll(v);
	}

	@Override
	public MemberVO selectOne(MemberVO v) {
		return memberDao.selectOne(v);
	}

	@Override
	public void delete(MemberVO v) {
		memberDao.delete(v);		
	}

	@Override
	public MemberVO login(MemberVO v) {
		return memberDao.login(v);
	}

	@Override
	public MemberVO selectCount(MemberVO v) {
		return memberDao.selectCount(v);
	}

	@Override
	public void update(MemberVO v) {
		memberDao.update(v);
	}

}
