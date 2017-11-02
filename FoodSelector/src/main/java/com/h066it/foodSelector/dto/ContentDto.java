package com.h066it.foodSelector.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ContentDto {

	private int bId;
	
	@NotNull
	@Size(min = 1, max = 100)
	private String bWriter;
	
	@NotNull
	@Size(min = 1, max = 100)
	private String bPassword;
	
	@NotNull
	@Size(min = 1, max = 300)
	private String bTitle;
	
	@NotNull
	@Size(min = 1, max = 1000)
	private String bContent;
	
	private Date bDate;
	
	private int bCount;
	
}
