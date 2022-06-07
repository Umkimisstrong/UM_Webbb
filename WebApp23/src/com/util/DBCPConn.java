/*  ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶
 	DBCPConn.java
 	- 데이터베이스 커넥션 풀 에 대한 커넥션 클래스
◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ */
package com.util;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPConn
{
	private static Connection conn = null;
	
	// getConnection()
	public static Connection getConnection()
	{
		if (conn==null)
		{
			try
			{
				// ○ 이름과 객체를 바인딩
				//--  컨텍스트 (Context)를 얻어내는 가장 쉬운 방법은
				//    『javax.naming.InitialContext』 클래스의
				//    인스턴스를 생성하는 것!
				//     → new InitialContext();
			  	Context ctx = new InitialContext();												// ⓐ Context USB 하나 만들기
				
			  	// ※ javax.naming.InitialContext 의 메소드
			  	//    - bind(String str, Object obj)
			  	//           : 서비스할 객체를 특정 이름으로 등록한다.
			  	//    - rebind(String str, Object obj)
			  	//           : 서비스할 객체를 특정 이름으로 다시 등록한다.
			  	//    - list(String str)
			  	//           : 특정 이름으로 서비스하는 객체 정보를 반환한다.
			  	//    - unbinding(String str)
			  	//           : 등록된 객체를 메모리에서 해제한다.
			  	
			  	//    - ♠ Object lookup(String str)  ♠ 체크!
			  	//           : 서비스중인 객체 정보를 얻어온다.
			  	
			  	// ① 고정된 구문... 확인
			  	//    ▶ 배치 기술서 web.xml 로 부터 환경 설정을 얻어오겠다는 코딩
			  	//       ∵ 다른 형태로 변경 불가함
				Context evt = (Context)ctx.lookup("java:/comp/env");							// ⓑ 현재쓰이고있는 Context 값을 지닌 USB로 속성변경
				 
				
				// ② 위의 구문을 통해 얻어낸 Context 객체 evt 로하여금 jdbc/myOracle 이라는 컨텍스트를 lookup 해서 DataSource의 ds 객체를 생성
 				DataSource ds= (DataSource)evt.lookup("jdbc/myOracle");							// ⓒ 속성 변경된 USB를 DataSource의 형태로 속성변경
 				
 				
 				// ③ 위의 구문을 통해 얻어낸 DataSource ds 객체로 하여금 getConnection() 메소드를 통해 conn 에 대입
 				conn = ds.getConnection();														// ⓓ 속성변경 된 DataSource USB에 들어있는 getConnection() 메소드 호출 및 대입
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return conn;
		
	}
	
	
	// close()
	public static void close() 
	{
		if (conn!=null)
		{
			try
			{
				if (!conn.isClosed())
					conn.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		conn=null;
	}
}
