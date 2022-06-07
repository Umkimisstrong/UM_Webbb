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
<title>네이버 쇼핑 api</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
<style type="text/css">
	.image{
		width: 100px;
		height: 100px;
	
	}
	.price{
		color: red;
		font-weight: bold;
	}
	.caption{
		color: red;
		font-size: small;
		font-weight: bold;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
		{
			$("#loadBtn").click(function()
			{
				var name = $("#name").val();
				
				$.get("search.do", {name : name}, function(args)
				{
					var searchXml = $.parseXML(args);
					var txt = "";
					var priceArr 
					var arr = []; 
					$(searchXml).find('item').each(function(index)
					{
						var name = $(this).find('title').text();
						var price = $(this).find('lprice').text();
						var image = $(this).find('image').text();
						
						txt += "<img class='image' src='" + image +"' >"+"<p>" + name + " 최소가 : [" + price + "]</p><br>";
						arr[index] = parseInt(price);	
					});
					
					var tprice = 0;
					
					for (var i = 0; i < arr.length; i++)
					{
						tprice += arr[i];
					}
					
					var bprice = (tprice / arr.length) * 0.7;
					
					if (arr.length==0)
					{
						$("#result").html("<p>검색결과가 없습니다.ㅠ</p>");
					} else
					{
						var txt2 = "<p class='price'>추천중고가격은 : " + bprice + " 입니다</p>" 
						 + "<p class='caption'>이 가격은 단지 참고용이며 절대적이지 않습니다.</p>";
						$("#result").html(txt2 + txt);
					}
					
				});
				
			});
			
			$("#clearBtn").click(function()
			{
				$("#result").empty();
			});
			
		});
</script>



</head>
<body>


<div class="head">
	<p>네이버 쇼핑 검색 api</p>
	<hr>
</div> 

<div class="body">
	<input type="text" id="name" > 
	<br>
	<button id="loadBtn" class="btn">검색하기</button>
	<button type="button" id="clearBtn" class="btn">지우기</button>
</div>

<div id="result">


</div>


</body>
</html>