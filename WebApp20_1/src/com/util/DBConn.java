/*

*/
package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn
{
	private static Connection dbConn;
	
	public static Connection getConnection()
	{
		if (dbConn==null)
		{
			try
			{
				String url = "jdbc:oracle:thin:@211.238.142.170:1521:xe";
				///String url = "jdbc:oracle:thin:@강의장ip:1521:xe"; 강의장 ip로 바꿀껏 211.238.142.170
				String user = "scott";
				String pwd = "tiger";
				
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				dbConn = DriverManager.getConnection(url, user, pwd);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return dbConn;
	}
	
	public static Connection getConnection(String url, String user, String pwd)
	{
		if (dbConn==null)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				dbConn = DriverManager.getConnection(url, user, pwd);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return dbConn;
	}
	
	public static void close()
	{
		if (dbConn!=null)
		{
			try
			{
				if(!dbConn.isClosed())
					dbConn.close();
					
					
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		dbConn = null;
	}
	
}


