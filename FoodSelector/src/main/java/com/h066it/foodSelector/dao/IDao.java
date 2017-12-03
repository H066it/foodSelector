package com.h066it.foodSelector.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.dto.FoodDto;

@Mapper
public interface IDao {

	/* modal info ���� */
	public FoodDto foodInfo(@Param("fId") int fId);

	/* CRUD ���� */
	public ArrayList<ContentDto> count();
	public ArrayList<ContentDto> list(@Param("firNum") int firNum, @Param("lstNum") int lstNum);
	public void write(@Param("bTitle") String bTitle, @Param("bWriter") String bWriter,
			@Param("bPassword") String bPassword, @Param("bContent") String bContent);
	public ContentDto view(@Param("bId") int bId);
	public void clickCount(@Param("bId") int bId);
	public void update(@Param("bTitle") String bTitle, @Param("bContent") String bContent, @Param("bId") int bId);
	public ContentDto udtPwdChk(@Param("bId") int bId, @Param("bPassword") String bPassword);
	public boolean delete(@Param("bId") int bId, @Param("bPassword") String bPassword);
	
	/* search ���� */
	public ArrayList<ContentDto> searchCount(@Param("searchType")String searchType, @Param("keyword")String keyword);
	public ArrayList<ContentDto> searchList(@Param("firNum") int firNum, @Param("lstNum") int lstNum,
			@Param("searchType")String searchType, @Param("keyword")String keyword);
	
	/* admin CRUD ���� */
	public void food_write(@Param("fname") String fname, @Param("ingredients") String ingredients,
			@Param("recipe") String recipe, @Param("tag") String tag);
	public int foodCount();	// �ܼ� ���� ����
	public ArrayList<FoodDto> food_tag();	// �±� �����ͼ� Ȱ���� �� (�̰� �ϳ��� ������ ���Ĺ����� ���ֵ� ��.)
	
}
