<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="<%=cp%>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		// id 중복확인 체크
		alert("id중복확인하자");
		
		// id 얻어내기
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id="+id;
		
		// AJAX 객체 생성(→ XMLHttpRequest 객체 생성)
		ajax = createAjax();
		
		//환경 설정(   open(방식, url, 비동기)   )
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
			{
				// 업무 처리(→ 외부로 추출)
				callBack();
			}
		}
		
		ajax.send("");
		
	}
	
	// 아이디 중복 검사의 결과(1 or 0) 을통보받아
	// 사용자에게 메세지 출력 → sapn → result
	function callBack()
	{
		// 외부로 추출된 업무처리내용 구성(responseText / responseXML)
		alert("업무 처리용 callback 함수 호출~!");
		
		var result = ajax.responseText;
		var msg = "";
		var id = document.getElementById("id");
		
		result = parseInt(result);
		
		if (result == 1)
		{
			alert("중복");
			msg = "중복된 아이디입니다.";
			document.getElementById("result").innerHTML = msg;
			document.getElementById("result").style.color = "red";
			id.focus();
			return;
			
		}
		else
		{
			alert("중복아님");
			msg = "사용가능한 아이디입니다.";
			document.getElementById("result").innerHTML = msg;
			document.getElementById("result").style.color = "blue";
		}
		
	}
	
	function search()
	{
		alert("검색");
		
		var addr = document.getElementById("addr").value;
		
		var url = "test04.do?addr="+addr;
		
		ajax = createAjax();
		
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4 && ajax.status==200)
			{
				// 업무 수행
				callBack2();
			}
		}
		ajax.send("");
	}
	
	
	// 추출된 수행 업무
	// 우편번호 검색 결과를 통보받아서 사용자에게 안내해 줄 수 있도록 처리
	function callBack2()
	{
		alert("callBack2 검색업무 수행");
		
		// XML 문서 전체의 참조 객체.(흔히 XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트(루트 엘리먼트)
		// 현재는 <list> 엘리먼트
		var root = doc.documentElement;
		
		// 모든 『<item>』 엘리먼트 반환받기
		var itemList = root.getElementsByTagName("item");
		// ▲ 배열 형태로 받음
		
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if (itemList.length ==0)
		{
			// 찾지 못함
			document.getElementById("addrResult").innerHTML = "<option>주소를 입력하세요</option>";
		}
		else
		{
			// 찾음
			document.getElementById("addrResult").innerHTML = "<option value='0'>주소를 선택하세요</option>";
		}
		
		
		// 검색 결과가 존재할 경우.. 반복문을 순환하며 각 데이터 가져오기
		for (var i = 0; i < itemList.length; i++)	//-- 수신한 아이템의 갯수만큼 반복 순환
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 태그가 가지는 텍스트는
			//    태그의 첫 번째 자식......
			//    텍스트 노드의 값은
			//    nodeValue 로 가져온다.
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			// select box 에 옵션 추가
			document.getElementById("addrResult").innerHTML
			+= "<option value='" + zipcodeText + "/" + addressText  + "'>["
			   + zipcodeText + "] " + addressText + "</option>";
		}
	}
	
	// 주소를 선택했을 때 (선택값의 변화가 생길 때 기능하는 함수)
	function selectZipCode(sel)
	{
		alert("주소선택중");
		
		alert(sel.value);
		
		if (sel.value != "0")
		{
			//06253 / 서울특별시 강남구 강남대로 298 (역삼동, 푸르덴셜타워)
			document.getElementById("addr1").value = sel.value.split("/")[0];
			document.getElementById("addr2").value = sel.value.split("/")[1];
			document.getElementById("addr3").focus();
			
		}
	}
	
</script>



</head>
<body>

<div>
	<h1>회원 가입</h1>
	<p>우편번호 검색</p>
	<hr />
</div>



<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control"/>
			<input type="button" value="중복검사" class="control" onclick="check()"/>
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" id="name" class="control" />
		</td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="addr" style="color: black;" class="control" placeholder="동 입력"
			            />
			<input type="button" value="검색하기" class="control" onclick="search()"/>
			
			<br />
			<select name="" id="addrResult" class="control" onchange="selectZipCode(this)">
				<option value="">주소를 입력하세요.</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="control" readonly="readonly"
			       style="width: 200px;"  />
			       <br />
			<input type="text" id="addr2" class="control" readonly="readonly"
			       style="width: 600px;"  />
			       <br />
			<input type="text" id="addr3" class="control" placeholder="상세주소를 입력하세요"
			       style="width: 600px; color: black;"  />  
		</td>
	</tr>
</table>











</body>
</html>