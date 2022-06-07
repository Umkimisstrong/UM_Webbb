/**
 * ajax.js
 */

var ajax = null;

// AJAX 객체 (XMLHttpRequest 객체) 생성 함수 

function createAjax()
{
	/*
	// 과거 이렇게 쓴 구문들이 많다...
	// ActiveXObject 를 지원하는 브라우저라면... 
	if(window.ActiveXObject)	// 인터넷 익스플로러 7 이전...
	{
		return new ActiveXObject("Msxml2.XMLHTTP"); 
		// 이와 같은 방법으로 XMLHttpRequest 객체를 생성해서 반환하라...
		// (ActiveXObject 객체 → XMLHttpRequest 객체 대신...)
		
	}
	else	// 나머지 요즘 브라우저들..
	{
		if (window.XMLHttpRequest) // XMLHttpRequest 를 지원하는 브라우저라면..
		{
			return new XMLHttpRequest();
			// XMLHttpRequest 객체를 생성해서 반환하라...
		}
		else 	// 아무것도 지원안하는 브라우저.. AJAX 를 지원안하는 브라우저...
		{
			return null;	// 널 반환..
		}
		
	}
	*/
	
	if (window.XMLHttpRequest) // 지금은 이 브라우저들이 메인인 브라우저 이기때문에..
	{
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject)
	{
		//return new ActiveXObject("Msxml2.XMLHTTP");
		return new ActiveXObject("Microsoft.XMLHTTP");
		
	}
	else
	{
		return null;
	}
	
}