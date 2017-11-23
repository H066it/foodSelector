package com.h066it.foodSelector.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.dto.FoodDto;

@Mapper
public interface IDao {

	/* modal info 관련 */
	public FoodDto foodInfo(@Param("fId") int fId);

	/* CRUD 관련 */
	public ArrayList<ContentDto> count();
	public void write(@Param("bTitle") String bTitle, @Param("bWriter") String bWriter,
			@Param("bPassword") String bPassword, @Param("bContent") String bContent);
	public ContentDto view(@Param("bId") int bId);
	public void update(@Param("bTitle") String bTitle, @Param("bContent") String bContent, @Param("bId") int bId);
	public boolean delete(@Param("bId") int bId, @Param("bPassword") String bPassword);
	public ContentDto udtPwdChk(@Param("bId") int bId, @Param("bPassword") String bPassword);
	public ArrayList<ContentDto> list(@Param("firNum") int firNum, @Param("lstNum") int lstNum);
	public void clickCount(@Param("bId") int bId);
	
}
