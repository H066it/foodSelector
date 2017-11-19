package com.h066it.foodSelector.service;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.h066it.foodSelector.dao.SecurityIDao;
import com.h066it.foodSelector.dto.MemberDto;

@Service
public class SecurityServiceModel implements UserDetailsService, SecurityIDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TransactionTemplate template; 
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberDto dto = memberIdChk(username);
				
		if(dto == null) {
			throw new UsernameNotFoundException("warn : username was not found!");
		}
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
	    roles.add(new SimpleGrantedAuthority(memberAuthChk(username)));
	    
		UserDetails user = new User(dto.getId(), dto.getPassword(), roles);

		return user;
	}

	@Override
	public MemberDto memberIdChk(String username) {

		SecurityIDao dao = sqlSession.getMapper(SecurityIDao.class);
		
		return dao.memberIdChk(username);
	}

	@Override
	public void signUp(String id, String username, String password) {

		SecurityIDao dao = sqlSession.getMapper(SecurityIDao.class);
		
		template.execute(new TransactionCallbackWithoutResult() {
			
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				dao.signUp(id, username, password);
				signUpAuthority(id);
			}
		});
	}

	@Override
	public void signUpAuthority(String id) {

		SecurityIDao dao = sqlSession.getMapper(SecurityIDao.class);
		
		dao.signUpAuthority(id);
	}

	@Override
	public String memberAuthChk(String id) {
		
		SecurityIDao dao = sqlSession.getMapper(SecurityIDao.class);
		
		return dao.memberAuthChk(id);
	}
	
}
