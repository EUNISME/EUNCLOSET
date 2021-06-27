package com.spring.log.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.log.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void insert(MemberVO v) {
		mybatis.insert("member-mapping.insert_sql", v);
	}

	@Override
	public MemberVO selectMax(MemberVO v) {
		return mybatis.selectOne("member-mapping.selectmax_sql");
	}

	@Override
	public int selectId(String id) {
		return mybatis.selectOne("member-mapping.selectid_sql", id);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO v) {
		return mybatis.selectList("member-mapping.selectall_sql", v);
	}

	@Override
	public MemberVO selectOne(MemberVO v) {
		return mybatis.selectOne("member-mapping.selectone_sql", v);
	}

	@Override
	public void delete(MemberVO v) {
		
		
	}

	@Override
	public MemberVO login(MemberVO v) {
		return mybatis.selectOne("member-mapping.login_sql", v);	
	}

	@Override
	public MemberVO selectCount(MemberVO v) {
		return mybatis.selectOne("member-mapping.selectcount_sql", v);
	}

	@Override
	public void update(MemberVO v) {
		mybatis.insert("member-mapping.update_sql", v);
	}

}
