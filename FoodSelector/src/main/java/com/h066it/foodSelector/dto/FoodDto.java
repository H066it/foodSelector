package com.h066it.foodSelector.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class FoodDto {

	@Id
	@GeneratedValue
	private int fId;
	
	@Column(unique = true)
	@NotNull
	private String name;
	
	@NotNull
	private String ingredients;
	
	@NotNull
	private String recipe;
	
	private String tag;
}
