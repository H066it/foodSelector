package com.h066it.foodSelector.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.h066it.foodSelector.dto.MemberDto;

@Mapper
public interface SecurityIDao {

	/* login ฐüทร */
	public MemberDto memberIdChk(@Param("id") String username);
	public void signUp(@Param("id") String id, @Param("username") String username, @Param("password") String password);
	public void signUpAuthority(@Param("id") String id);
	public String memberAuthChk(@Param("id") String id);
	
}
