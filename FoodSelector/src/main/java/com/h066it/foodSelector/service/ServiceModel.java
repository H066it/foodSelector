package com.h066it.foodSelector.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.h066it.foodSelector.dao.IDao;
import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.dto.FoodDto;

@Service
public class ServiceModel implements IDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public FoodDto foodInfo(int fId) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.foodInfo(fId);
	}

	/* CRUD ฐüทร */
	
	@Override
	public ArrayList<ContentDto> count() {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.count();
	}
	
	@Override
	public void write(String bTitle, String bWriter, String bPassword, String bContent) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.write(bTitle, bWriter, bPassword, bContent);
		
	}

	@Override
	public ContentDto view(int bId) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.view(bId);
	}

	@Override
	public void update(String bTitle, String bContent, int bId) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.update(bTitle, bContent, bId);
		
	}

	@Override
	public boolean delete(int bId, String bPassword) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.delete(bId, bPassword);
		
	}

	@Override
	public ContentDto udtPwdChk(int bId, String bPassword) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.udtPwdChk(bId, bPassword);
	}

	@Override
	public ArrayList<ContentDto> list(int firNum, int lstNum) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.list(firNum, lstNum);
	}

	@Override
	public void clickCount(int bId) {

		IDao dao = sqlSession.getMapper(IDao.class);

		dao.clickCount(bId);
		
	}

	
}
