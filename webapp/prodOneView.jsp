<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주류상세페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<script>
$(function(){
	let pno = ${prodOne.p_no};
	let objParams = {p_no : pno};
	let values = [];
	$.ajax({
		method : "POST",
		url : "prodOneRev.ko",
		data : objParams,
		cache : false,
		success : function(res) {
			if (res.code == "OK") {
				values = res.prodOneRev;
				console.log("배열 : ", values);
				console.log("배열 : ", values.length);
				if (values.length == 0) {
					$("#revTB").append("<div style='text-align:center;'>등록 된 리뷰가 없습니다.</div>");
				} else {
					$.each(values, function(i, o){
						$("#revTB").append("<table class='dtable'><tr class='revTitle'><td id='revTd1'>" + o.u_nick + "</td><td id='revTd2'>" + o.p_name + "</td><td id='revTd3'>" + o.pr_date + "</td></tr>"
								+ "<tr class='revPad'><td colspan='3'>" + o.pr_content + "</td></tr>"
								+ "<tr class='revPad'><td colspan='3'>" + "<img alt='' src='img/imgRev/" + o.pr_img  + "' style='width:100px;'>" + "</td><tr></table>");
					});
				}
				console.log("성공");
			} else {
				console.log("실패");
			}
		}
	});
});
</script>
<style>
/* Chrome, Safari, Edge 등에서 화살표를 숨기기 */
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* Firefox에서 화살표를 숨기기 */
input[type=number] {
    -moz-appearance: textfield;
}
.product_desc{
	display:flex;
	align-items:center;
	min-height:42px
}

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
table.tableDiv-tb {
	width: 100%;
	text-align: center;
}




table.dtable {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 30px;
}
tr.revTitle {
    background-color: #c99c3c26;
    font-weight: bold;
    font-size: 14px;
}
tr.revTitle td, tr.revPad td, tr.revPad td {
    padding: 10px;
}
td#revTd2, td#revTd3 {
    text-align: right;
}
td#revTd1 {
    border-radius: 10px 0 0 10px;
}
td#revTd2 {
    width: 30%;
}
td#revTd3 {
	width: 30%;
    border-radius: 0 10px 10px 0;
}
div#revTB {
	margin-top: 20px;
	margin-bottom: 50px;
}


@media (max-width: 720px) {
	div.div-wid-mar {
		max-width: 90%;
	}
	#detail2 * {
		max-width: 100%;
	}
	div.div-flex, div.div-img, div.div-cart {
		display:block;
		margin: 0 auto;
		max-width: 100%;
	}
	table.tableDiv-tb {
		font-size: 13px;
	}
}

@media (min-width: 721px) {
	div.div-flex {
		height: 350px;
	}
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
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
				<div style="margin-top:5px;font-weight: bolder;" id="div-p_price">${prodOne.p_price}</div>
			</div>
			<%@ include file="pay.jsp" %>
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
<div class="div-wid-mar" style="margin-top:100px;">
	<span style="font-family: 'Spoqa Han Sans Neo', 'sans-serif';">REVIEW</span>
	<div class="bottom-line"></div>
</div>
<div class="div-wid-mar" id="revTB"></div>
<script>
function priceCommaA(price) {
    let val = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return val;
}

window.onload = function(){
	var httpReq = new XMLHttpRequest();
	httpReq.open("GET", './productDetailpage.ko?p_no=${prodOne.p_no}', false);
	httpReq.onreadystatechange = function(){
		if( httpReq.readyState == 4 && httpReq.status == 200  ) {
			var fileData = httpReq.responseText;
			document.querySelector("#detail2").innerHTML = fileData;
		}
	};
	httpReq.send();
	
	let price = document.getElementById("total").value;
	document.getElementById("total-disabled").value = priceCommaA(price) + '원';
	document.getElementById("div-p_price").innerText = priceCommaA(document.getElementById("div-p_price").innerText) + '원';
};

</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>