/* ==================
 	MyUtil.java
 	- 게시판 페이징 처리
================== */

// check!!
// 지금 같이 확인해보고자 하는 페이징 처리 기법은
// 다양한 방법들 중 한가지(그나마 쉬운 것을 골라..) 이다.
// 학습을 마친 이후에... 꼭~~~!! 추가적으로 개념을 정리하고
// 확장시키고, 다른 방법들도 찾아보고 공부해야 한다.

package com.util;

public class MyUtil
{
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물) 의 수
	// dataCount : 전체 데이터 (게시물) 수
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		pageCount = dataCount/numPerPage;
		
		// 나누어 떨어지지 않는 경우....
		if (dataCount%numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}
	// 한 페이지에 10개의 게시물 출력
	// 총 32개의 게시물을 페이지로 구성하기 위해서는
	// 『32 / 10』의 연산을 수행하여 결과 3을 얻을 수 잇다.
	// → pageCount = dataCount/numPerpage;
	// 그런데, 나머지 2개의 게시물을 출력해 주기 위해서는
	// 페이지 하나가 더 필요하다.
	// → pageCount++;
	
	// ■ 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl)
	{
		// <a href="어디"> 1 </a>
		// <a href="어디"> 2 </a>
		// <a href="어디"> 8 </a>
		//            :
		// <a href="어디"> 다음 </a>
		// <a href="어디"> 이전 </a>        
		// <a href="어디"> 11 </a>
		// <a href="어디"> 18 </a>

		
		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		
		int numPerBlock = 10;
		// 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
		
		int currentPageSetup;
		// 현재 페이지( 이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문.. )
		
		int page;
		int n;
		// 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		// (얼마만큼 이동해야 하는지..)
		
		// 페이징 처리가 별도로 필요하지 않은 경우
		// -- 데이터가 존재하지 않거나 데이터의 수가
		//    1페이지도 못채우는 경우는 별도로 페이징 처리를 할 필요가 없다.
		if (currentPage == 0)
		{
			return "";
		}		
		
		// 페이지 요청을 처리하는 과정에서
		// URL 경로의 패턴에 대한 처리
		/*
		  - (게시판에 페이지 번호를 최초로 클릭하는 경우는 주소값에 『?』가 붙고)클라이언트 요청의 형태 → List.jsp 인 경우 → (가공) → List.jsp + 『?』 + pageNum=1
		  - (뭔가를 검색했을때.. 주소값에 『?제목=study』가 들어간 경우를 말함)클라이언트 요청의 형태 → List.jsp?subject=study 인 경우 → (가공) → List.jsp?subject=study + 『&』 + pageNum=1
		    
		 */
		// 링크를 설정할 URL 에 대한 선 가공 처리 ~ !!!
		
		if (listUrl.indexOf("?") != -1) // 링크를 설정할 URL 에 『?』가 들어있으면...
		{
			listUrl = listUrl + "&";	// listUrl += "&";
		}
		else	// 링크를 설정할 URL에 『?』가 없으면
		{
			listUrl = listUrl + "?";
		}
		// 예를 들어 검색값이 존재하면, 이미 request 값에 searchKey 값과 searchValue 값이 들어있는 상황이므로
		// 『&』를 붙여서 속성값을 추가해 주어야 한다.
		
		// currentPageSetup = 표시할 첫 페이지 - 1
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		// -- 만약 현재 페이지가 5페이지이고(currentPage=5)
		//    리스트 하단에 보여줄 페이지 갯수가 10이면(numPerBlock=10)
		//     『5 / 10 = 0』  『* 10』 (10을 곱해도) 0임
		//    하지만, 현재 페이지가 11페이지라면(currentPage=11)
		//    『11/10 = 1』 이며, 여기에 (* 10) 을 곱하면 10이다.
		//     그럼 currentPageSetup = 10 이 되는것임..
		
		if (currentPage % numPerBlock == 0 )
		{
			currentPageSetup = currentPageSetup - numPerBlock;
			// currentPageSetup -= numPerBlock;
		}
		// 만약 위 처리에서...(라인99)
		// 현재 페이지가 20 페이지였다면 (currentPage = 20)
		// 『20 / 10 = 2』 이며.. 여기에 * 10 (10을 곱해서) 20이 되는데
		// 이와 같은 상황이라면.. 다시 10을 빼서 10으로 만들어주기 위한 구문.
		
		// 처음     이전                            다음 마지막
		// |◀      ◀ 1  2  3  4  5  6  7  8  9  10 ▶    ▶|
		
	
		
		// 1. 페이지(처음으로)
		if ( (totalPage > numPerBlock) && (currentPageSetup > 0) )
		{
			strList.append(" <a href=' " + listUrl + "pageNum=1'>1</a>");
		}
		// listUrl 은 위에서(라인 87) 이미 전처리가 끝난 상황이기 때문에
		// ...? 상태 또는 ..?..&인 상태이다.
		// 이로 인해 결과는 『?pageNum=1 이거나 &pageNum=1』 가 되는 상황
		
		
		// 2. Prev(이전)
		n = currentPage - numPerBlock;
		// -- n : 해당 페이지만큼 앞으로 가기 위한 변수
		
		if((totalPage>numPerBlock) && (currentPageSetup)>0)
		{
			strList.append(" <a href='" + listUrl + "pageNum="+ n + "'>Prev</a>");
			
		}
		// currentPageSetup 이 0보다 큰 경우는\
		// 현재 페이지가 11 이상일 경우
		// Prev(이전) 를 붙이기 위한 구문
		// Prev 를 클릭할 경우
		// n 변수 페이지로 이동하는데
		// 12 에서 Prev 할 경우 2페이지가 되고
		// 22에서 Prev 할 경우 12페이지가 될 수 있도록 처리하는 방식.
		
		
		// 3. 각 페이지 바로가기
		page = currentPageSetup + 1;
		
		while ((page<=totalPage) && (page<=currentPageSetup+numPerBlock)   )
		{
			if (page==currentPage)// 현재페이지
			{
				strList.append(" <span style='color:orange; font-weight:bold;'>" + page + "</sapn>");
			}
			else
			{
				strList.append(" <a href='" + listUrl + "pageNum=" + page + "'>" + page + "</a>");
			}
			
			page++;
		}
		
		
		// 4. Next(다음)
		n = currentPage + numPerBlock;
		if ( (totalPage-currentPageSetup) > numPerBlock )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Next</a>");
		}
		
		// 5. 마지막 페이지
		if ((totalPage>numPerBlock) && (currentPageSetup+numPerBlock)<totalPage  )
		{
			strList.append(" <a href='" + listUrl + "pageNum=" + totalPage + "'>" + totalPage + "</a>");
		}
		
		
		
		return strList.toString();
	}// end
	
	
	
	
	
	
	
	
	
	
	
}

