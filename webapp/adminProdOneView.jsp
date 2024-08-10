<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("userID") == null) {%>
<script>
location.href="main.ko";
</script>
<%}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* 썸네일,리모콘,설명 (상세jsp 위) */
div.div-wid-mar {
	width: 700px;
	margin: 0 auto;
}
div.div-flex {
	margin: 0 auto;
	text-align: left;
	display: flex;
	justify-content: center;
	max-width: 700px;
}
div.div-img {
	text-align: center;
	width: 370px;
}
img.img-main {
	padding: 10px;
	width: 100%;
}
div.div-cart {
	text-align: left;
	padding: 10px;
	width: 350px;
}
div.div-col {
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-top: 30px;
	display: flex;
}
div.tableDiv {
	width: 100%;
}
table.tableDiv-tb, table {
	width: 100%;
	text-align: center;
	border: none;
}
tr th, td {
	text-align: center;
}
</style>
<script>
$(function(){
	let pno = ${prodOne.p_no};
	let objParams = {p_no : pno};
	let values = []; //ArrayList 값을 받을 변수를 선언
	$.ajax({
		method : "POST",
		url : "prodOneRev.ko",
		data : objParams,
		cache : false,
		success : function(res) {
			if (res.code == "OK") { //controller에서 넘겨준 성공여부 코드
				values = res.prodOneRev; //java에서 정의한 ArrayList명을 적어준다.
				console.log("배열 : ", values);
				$.each(values, function(i, o){
					$("#revTB").append("<table class='dtable'><tr><td>" + o.u_nick + "</td><td>" + o.p_name + "</td><td>" + o.pr_date + "</td></tr>"
							+ "<tr><td>" + o.pr_content + "</td><td>"
							+ "<tr><td>" + "<img alt='' src='img/imgQna/" + o.pr_img  + "' style='width:100px;'>" + "</td><td></table>");
				});
				console.log("성공");
			} else {
				console.log("실패");
			}
		}
	});
});
</script>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="div-wid-mar">
	<div class="div-flex">
		<div class="div-img">
			<img class="img-main" src="img/${prodOne.p_img }" title="img" alt="img">
		</div>
		<div class="div-cart">
			<div class="clear">
				<div class="product_desc"><small>${prodOne.p_desc}</small></div>
				<div style="margin-top:10px;font-weight: bolder;font-size:20px;">${prodOne.p_name}</div>
				<div style="margin-top:10px;"><small>판매가격</small></div>
				<div style="margin-top:5px;font-weight: bolder;">${prodOne.p_price}원</div>
			</div>
		</div>
	</div>
	
	<div class="div-wid-mar div-col">
		<div class="tableDiv">
			<table class="tableDiv-tb">
				<tr>
					<th>주류종류</th><td>${prodOne.p_type}</td>
				</tr>
				<tr>
					<th>도수</th><td>${prodOne.p_dgr}%</td>
				</tr>
				<tr>
					<th>용량</th><td>${prodOne.p_cap}ml</td>
				</tr>											
				<tr>
					<th>재고</th><td>${prodOne.p_stock}</td>
				</tr>
				<tr>
					<th>제조사</th><td>${prodOne.p_made}</td>
				</tr>
			</table>
		</div>
		<br><br><br> 
		<div class="tableDiv">
			<table class="tableDiv-tb">
				<tr>
					<th>단맛</th>
					<td>${prodOne.p_sw}</td>
				</tr>
				<tr>
					<th>신맛</th>
					<td>${prodOne.p_su}</td>
				</tr>
				<tr>
					<th>탄산</th>
					<td>${prodOne.p_sp}</td>
				</tr>
				<tr>
					<th>원료</th><td>${prodOne.p_mat}</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<div class="div-wid-mar" id="detail2">${pageContext.request.contextPath }/WEB-INF/product/${prodOne.editfile }</div>
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<div id="revTB"></div>
<br>
<br>
<br> 
<br>
<script>
window.onload = function(){
	var httpReq = new XMLHttpRequest();
	httpReq.open("GET", './productDetailpage.ko?p_no=${prodOne.p_no}', false);
	httpReq.onreadystatechange = function(){
		if( httpReq.readyState == 4 && httpReq.status == 200  ) {
			var fileData = httpReq.responseText;
			console.log('fileData: ',fileData);
			document.querySelector("#detail2").innerHTML = fileData;
		}
	};
	httpReq.send();
};
</script>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<div class="main">
	<table id="revTB" style="width:70%">
	</table>
</div>
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
<br>
<br>
<br> 
</body>
</html>