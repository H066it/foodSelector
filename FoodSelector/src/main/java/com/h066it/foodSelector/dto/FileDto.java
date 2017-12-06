package com.h066it.foodSelector.dto;

import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileDto {

	private int fileId;
	
	@NotNull
	private String fileName;
	
	private String mergedName;
	
	@NotNull
	private int fileSize;
	
}
