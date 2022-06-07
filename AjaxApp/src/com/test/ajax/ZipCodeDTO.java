/*
  ZipCodeDTO.java
*/

package com.test.ajax;

public class ZipCodeDTO
{
	// 주요 속성 구성
	private String zipCode;
	private String address;
	
	
	// 기본 생성자 추가 구성
	public ZipCodeDTO()
	{
		this("", "");
	}
	
	
	public ZipCodeDTO(String zipCode, String address)
	{
		this.zipCode = zipCode;
		this.address = address;
	}
	
	public String getZipCode()
	{
		return zipCode;
	}
	
	public void setZipCode(String zipCode)
	{
		this.zipCode = zipCode;
	}
	
	public String getAddress()
	{
		return address;
	}
	
	public void setAddress(String address)
	{
		this.address = address;
	}
}
