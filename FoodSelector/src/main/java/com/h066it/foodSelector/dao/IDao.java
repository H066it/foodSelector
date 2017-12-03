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
	public ArrayList<ContentDto> list(@Param("firNum") int firNum, @Param("lstNum") int lstNum);
	public void write(@Param("bTitle") String bTitle, @Param("bWriter") String bWriter,
			@Param("bPassword") String bPassword, @Param("bContent") String bContent);
	public ContentDto view(@Param("bId") int bId);
	public void clickCount(@Param("bId") int bId);
	public void update(@Param("bTitle") String bTitle, @Param("bContent") String bContent, @Param("bId") int bId);
	public ContentDto udtPwdChk(@Param("bId") int bId, @Param("bPassword") String bPassword);
	public boolean delete(@Param("bId") int bId, @Param("bPassword") String bPassword);
	
	/* search 관련 */
	public ArrayList<ContentDto> searchCount(@Param("searchType")String searchType, @Param("keyword")String keyword);
	public ArrayList<ContentDto> searchList(@Param("firNum") int firNum, @Param("lstNum") int lstNum,
			@Param("searchType")String searchType, @Param("keyword")String keyword);
	
	/* admin CRUD 관련 */
	public void food_write(@Param("fname") String fname, @Param("ingredients") String ingredients,
			@Param("recipe") String recipe, @Param("tag") String tag);
	public int foodCount();	// 단순 개수 샐때
	public ArrayList<FoodDto> food_tag();	// 태그 가져와서 활용할 때 (이거 하나로 위에꺼 퉁쳐버리고 없애도 됨.)
	
}
