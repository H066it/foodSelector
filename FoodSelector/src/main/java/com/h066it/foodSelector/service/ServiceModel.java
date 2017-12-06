package com.h066it.foodSelector.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.h066it.foodSelector.dao.IDao;
import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.dto.FileDto;
import com.h066it.foodSelector.dto.FoodDto;

@Service
public class ServiceModel implements IDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TransactionTemplate template;
	
	@Override
	public FoodDto foodInfo(int fId) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.foodInfo(fId);
	}

	/* CRUD 관련 */
	
	@Override
	public ArrayList<ContentDto> count() {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.count();
	}
	
	@Override
	public ArrayList<ContentDto> list(int firNum, int lstNum) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.list(firNum, lstNum);
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
	public void clickCount(int bId) {

		IDao dao = sqlSession.getMapper(IDao.class);

		dao.clickCount(bId);
		
	}

	@Override
	public void update(String bTitle, String bContent, int bId) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.update(bTitle, bContent, bId);
		
	}
	
	@Override
	public ContentDto udtPwdChk(int bId, String bPassword) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.udtPwdChk(bId, bPassword);
	}

	@Override
	public boolean delete(int bId, String bPassword) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.delete(bId, bPassword);		
	}

	/* search 관련 */
	
	@Override
	public ArrayList<ContentDto> searchCount(String searchType, String keyword) {
		
		IDao dao = sqlSession.getMapper(IDao.class);

		return dao.searchCount(searchType, keyword);
	}

	@Override
	public ArrayList<ContentDto> searchList(int firNum, int lstNum, String searchType, String keyword) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.searchList(firNum, lstNum, searchType, keyword);
	}

	/* admin CRUD 관련 */	
	
	@Override
	public void food_write(String fname, String ingredients, String recipe, String tag) {

		IDao dao = sqlSession.getMapper(IDao.class);

		dao.food_write(fname, ingredients, recipe, tag);
		
	}

	@Override
	public int foodCount() {

		IDao dao = sqlSession.getMapper(IDao.class);

		return dao.foodCount();
	}

	@Override
	public ArrayList<FoodDto> food_tag() {

		IDao dao = sqlSession.getMapper(IDao.class);

		return dao.food_tag();
	}

	@Override
	public void food_writeWithFiles(FoodDto dto, List<FileDto> files) {

		template.execute(new TransactionCallbackWithoutResult() {
			
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {

				food_write(dto.getFname(), dto.getIngredients(), dto.getRecipe(), dto.getTag());
				
				if(!files.isEmpty()) {
					for(FileDto file : files) {
						System.out.println("food_writeWithFiles");
						System.out.println("file.getFileName() : " + file.getFileName());
						System.out.println("file.getFileSize() : " + file.getFileSize());
						
						file_write(file.getFileName(), file.getFileSize());
					}
				}
				
			}
		});
	}

	@Override
	public void file_write(String fileName, int fileSize) {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.file_write(fileName, fileSize);
	}

	@Override
	public int food_fIdChk() {

		IDao dao = sqlSession.getMapper(IDao.class);
		
		return dao.food_fIdChk();
	}

	@Override
	public ArrayList<FileDto> fileList() {

		IDao dao = sqlSession.getMapper(IDao.class);

		return dao.fileList();
	}
	
}
