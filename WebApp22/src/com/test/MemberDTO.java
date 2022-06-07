package com.test;

public class MemberDTO
{
	private String name, tel, addr;

	
	public MemberDTO()
	{
		
		
	}
	
	// 매개변수 2개 사용자 정의 생성자
	public MemberDTO(String name, String tel, String addr)
	{
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}
	
	
	
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	
	
	
}
