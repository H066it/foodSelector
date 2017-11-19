package com.h066it.foodSelector.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDto {

	@NotNull
	@Size(min = 1, max = 100)
	private String id;
	
	@NotNull
	@Size(min = 1, max = 100)
	private String username;
	
	@NotNull
	@Size(min = 1, max = 100)
	private String password;
	
	private Date signUpDate;
	
}
