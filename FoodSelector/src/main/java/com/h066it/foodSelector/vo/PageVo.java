package com.h066it.foodSelector.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVo {

	private int displayNum = 10;	// 한 페이지당 보이는 게시글 개수
	private int totalNum;	// 전체 게시글 수
	private int totalPageNum; // 전체 페이지 수
	private int firNum, lstNum;	// 한 페이지 내 시작, 끝 게시글 번호
	private int firPageNum, lstPageNum;	// 전체의 시작, 끝 페이지 번호
	private int page = 1;	// 지금 페이지 (1은 테스트용)
	
	public void calPage(int total) {
		setTotalNum(total);
		setTotalPageNum((int)Math.ceil((float)total/displayNum));
		System.out.println("totalPageNum : " + totalPageNum);

		getPage();							// 지금 페이지 설정
		if(getPage() < 1) setPage(1);
		if(getPage() > getTotalPageNum()) setPage(getTotalPageNum());
		System.out.println("page : " + page);
				
		setFirPageNum(1);					// 10개중 첫번째 페이지 번호
		if(page > 10) setFirPageNum((page -1 )/ 10 * 10 + 1);
		System.out.println("firPageNum : " + firPageNum);
		
		setLstPageNum(firPageNum + 9);		// 10개중 마지막 페이지 번호
		if(lstPageNum > totalPageNum) setLstPageNum(totalPageNum);
		System.out.println("lstPageNum : " + lstPageNum);
		
		setFirNum(1 + (getPage() - 1)*getDisplayNum());	// 페이지 내 첫 번호
		if(firNum > totalNum) setFirNum(totalNum);
		System.out.println("firNum :" + firNum);
		setLstNum(page*getDisplayNum());				// 페이지 내 마지막 번호
		if(lstNum > totalNum) setLstNum(totalNum);
		System.out.println("lstNum :" + lstNum);
	}
	
}
