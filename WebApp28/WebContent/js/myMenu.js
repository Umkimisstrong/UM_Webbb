/**
 * myMenu.js
 */
/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/
/*
 	Test034.html 파일에
 	script 속성으로 src = js/myMenu.js 해줘야됌 
 */
function myMenu(status)
{
	//alert("함수 호출 확인~!!");
	var menu = document.getElementById("menuTable");
	if (status==1)
	{
		//alert("1번 확인");
		// 메뉴테이블 객체의 스타일의 디스플레이를 블럭단위로 렌더링 해라..
		menu.style.display = "block";
	}
	else
	{
		//alert("2번 확인");
		// 메뉴테이블 객체의 스타일의 디스플레이를 감춰라..
		menu.style.display = "none";
	}
	
	
}