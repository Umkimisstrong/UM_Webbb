package com.test;

public class GuestDTO
{
	private String userName;
	private String subject;
	private String content;
	
	// 변수명은 앞 두글자 소문자로 작성하자
	
	// 변수명은
	// HTML form 태그에서 name 속성으로 지정해서 사용하자..
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}

		
}
