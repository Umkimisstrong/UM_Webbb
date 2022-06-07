package com.test;

public class Calc
{
	private int su1;
	private String op;
	private int su2;
	
	public int getSu1()
	{
		return su1;
	}
	public void setSu1(int su1)
	{
		this.su1 = su1;
	}
	public String getOp()
	{
		return op;
	}
	public void setOp(String op)
	{
		this.op = op;
	}
	public int getSu2()
	{
		return su2;
	}
	public void setSu2(int su2)
	{
		this.su2 = su2;
	}
	
	public String result()
	{
		String result = "";
		
		int s = 0;
		if (op != null)
		{
			if(op.equals("+"))
				s = su1 + su2;
			else if(op.equals("-"))
				s = su1 - su2;
			else if(op.equals("*"))
				s = su1 * su2;
			else if(op.equals("/"))
				s = su1 / su2;
			
			result = String.format("%d %s %d = %d", su1, op, su2, s);
			
		}
		
		
		return result;
	}
}
