/**
 * ajax.js 
 */


var ajax = null;

// AJAX 객체(XMLHttpRequest) 생성 함수
function createAjax()
{
	/*
	// ActiveXObject 지원하는 브라우저라면..
	if (window.ActiveXObject)	// ▣ Internet Explorer 7 이전
	{
		// 이와 같은 방식으로 XMLHttpRequest 객체를 생성해서 반환해라.
		//       ActiveXObject 객체 → XMLHttpRequest 객체의 대리 객체
		return new ActiveXObject("Msxml2.XMLHTTP");
	}
	else						// ◈ 그 외 브라우저이면
	{
		if (window.XMLHttpRequest)	// ◈ ● 그 외 브라우저 중 XMLHttpRequest 지원 브라우저라면
		{
			// 이와 같은 방식으로 새로운(new) XMLHttpRequest객체를 생성 해서 반환해라.
			return new XMLHttpRequest();
		}
		else						// ◈ ○ AJAX 를 지원하지 않는 브라우저라면
		{
			// null 을 반환해라
			return null;
		}
	}
	*/
	if (window.XMLHttpRequest)
	{
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		//return new ActiveXObect("Msxml2.XMLHTTP");       // 뭘써도상관없음
		return new ActiveXObject("Microsoft.XMLHTTP");    // 뭘써도상관없음
	}
	else
	{
		return null;
	}
		
}