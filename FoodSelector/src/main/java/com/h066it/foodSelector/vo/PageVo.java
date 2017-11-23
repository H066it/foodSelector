package com.h066it.foodSelector.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageVo {

	private int displayNum = 10;	// �� �������� ���̴� �Խñ� ����
	private int totalNum;	// ��ü �Խñ� ��
	private int totalPageNum; // ��ü ������ ��
	private int firNum, lstNum;	// �� ������ �� ����, �� �Խñ� ��ȣ
	private int firPageNum, lstPageNum;	// ��ü�� ����, �� ������ ��ȣ
	private int page = 1;	// ���� ������ (1�� �׽�Ʈ��)
	
	public void calPage(int total) {
		setTotalNum(total);
		setTotalPageNum((int)Math.ceil((float)total/displayNum));
		System.out.println("totalPageNum : " + totalPageNum);

		getPage();							// ���� ������ ����
		if(getPage() < 1) setPage(1);
		if(getPage() > getTotalPageNum()) setPage(getTotalPageNum());
		System.out.println("page : " + page);
				
		setFirPageNum(1);					// 10���� ù��° ������ ��ȣ
		if(page > 10) setFirPageNum((page -1 )/ 10 * 10 + 1);
		System.out.println("firPageNum : " + firPageNum);
		
		setLstPageNum(firPageNum + 9);		// 10���� ������ ������ ��ȣ
		if(lstPageNum > totalPageNum) setLstPageNum(totalPageNum);
		System.out.println("lstPageNum : " + lstPageNum);
		
		setFirNum(1 + (getPage() - 1)*getDisplayNum());	// ������ �� ù ��ȣ
		if(firNum > totalNum) setFirNum(totalNum);
		System.out.println("firNum :" + firNum);
		setLstNum(page*getDisplayNum());				// ������ �� ������ ��ȣ
		if(lstNum > totalNum) setLstNum(totalNum);
		System.out.println("lstNum :" + lstNum);
	}
	
}
