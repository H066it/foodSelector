package com.h066it.foodSelector.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodDto {

	private int fId;
	
	@NotNull
	@Size(min = 1, max = 300)
	private String fname;
	
	@NotNull
	@Size(min = 1, max = 1000)
	private String ingredients;
	
	@NotNull
	@Size(min = 1, max = 10000000)
	private String recipe;
	
	@NotNull
	private String tag;
}
