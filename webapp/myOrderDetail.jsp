<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.detail-prod {
	width: 1050px;
	margin: 0 auto;
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	margin-top: 40px;
	padding: 15px;
	margin-bottom: 40px;
}
.title {
	border-bottom: 1px solid rgb(238, 238, 238);
	margin-top: 20px;
	align-items: center;
	padding-bottom: 15px;
	font-weight: bold;
}
.detail-content {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 10px;
    padding-bottom: 10px;
    border-bottom: 1px solid rgb(238, 238, 238);
}
.text-content {
	display: flex;
	align-items: center;
}
.text-content div {
	width: 130px;
}
.dtlist {
	display: flex;
	border-bottom: 1px solid rgb(238, 238, 238);
	padding-top: 5px;
	padding-bottom: 5px;
	font-weight: bold;
	padding-left: 175px;
}
.dtlist div {
	margin-right: 90px;
}
.prod-img {
	cursor: pointer;
}
.info {
	display: flex;
	justify-content: space-around;
}
.customer {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	width: 700px;
	margin-top: 10px;
	padding: 10px;
	display: flex;
    flex-wrap: wrap;
    align-content: space-between;
}
.porter {
	border: 1px solid rgb(238, 238, 238);
	border-radius: 10px;
	width: 300px;
	margin-top: 10px;
	padding: 5px;
}
.porter-info {
	display: flex;
	justify-content: space-between;
	padding: 5px;
}
.info-title {
	border-bottom: 1px solid rgb(238, 238, 238);
	padding: 5px;
	font-weight: bold;
}
.porter-title {
	border-bottom: 1px solid rgb(238, 238, 238);
	padding: 5px;
	font-weight: bold;
}
.customer-info {
	display: flex;
	padding: 5px;
}
.cus-tt {
	width: 100px;
}
.porter-total {
	display: flex;
	justify-content: space-between;
	border-top: 1px solid rgb(238, 238, 238);
	padding: 5px;
	font-weight: bold;
}
.wrap {
	width: 100%;
}

.app-info {
	display: none;
}
.btn-div {
	display: flex;
    justify-content: space-around;
}
.submit {
	margin-bottom: 40px;
	width: 300px;
    padding: 5px;
    height: 40px;
    background-color: #005930;
	color: rgb(255, 255, 255);
	border-radius: 5px;
	border: none;
	cursor: pointer;
	font-size: 15px;
	font-weight: bold;
}
/* extra small */
@media screen and (max-width:540px) {
	.detail-prod {
		width: 90%;
	}
	.dtlist {
		display: none;
	}
	.img-size {
		margin-left: 0px;
	}
	.info {
		display: block;
	}
	.customer {
		width: 100%;
	}
	.cus-tt {
		width: 40%;
	}
	.porter {
		width: 100%;
	}
	.app-info {
		width: 65%;
        display: block;
        font-size: 14px;
	}
	.text-content {
		display: none;
	}
	.customer-info {
		justify-content: space-between;
	}
	.addr-info {
		width: 150px;
	}
}
/* small */
@media screen and (min-width:541px) and (max-width:720px) {
	.detail-prod {
		width: 70%;
	}
	.dtlist {
		display: none;
	}
	.img-size {
		margin-left: 0px;
	}
	.info {
		display: block;
	}
	.customer {
		width: 100%;
	}
	.cus-tt {
		width: 40%;
	}
	.porter {
		width: 100%;
	}
	.app-info {
		display: block;
	}
	.text-content {
		display: none;
	}
	.customer-info {
		justify-content: space-between;
	}
	.addr-info {
		width: 200px;
	}
}
/* medium */
@media screen and (min-width:721px) and (max-width:960px) {
	.detail-prod {
		width: 80%;
	}
	.dtlist {
		display: none;
	}
	.img-size {
		margin-left: 0px;
	}
	.info {
		display: block;
	}
	.customer {
		width: 100%;
	}
	.cus-tt {
		width: 30%;
	}
	.porter {
		width: 100%;
	}
	.app-info {
		display: block;
	}
	.text-content {
		display: none;
	}
	.customer-info {
		justify-content: space-between;
	}
}
/* large */
@media screen and (min-width:961px) and (max-width:1140px) {
	.detail-prod {
		width: 95%;
	}
	.customer {
		width: 100%;
	}
	.img-size {
		margin-left: 0px;
	}
	.cus-tt {
		width: 30%;
	}
	.porter {
		width: 100%;
	}
	.customer-info {
		justify-content: space-between;
	}
	.addr-info {
		width: 200px;
	}
	.dtlist {
		padding-left: 130px;
	}
	.dtlist div {
		margin-right: 75px;
	}
	.text-content {
		width: 85%;
	}
}
</style>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="myPageHeader.jsp" %>
<div class="detail-prod">
	<div class="title">주문 상세내역</div>
	<div class="content">
		<div class="dtlist">
			<div>상품명</div>
			<div>상품설명</div>
			<div>개별가격</div>
			<div>구매수량</div>
			<div>총 금액</div>
		</div>
		<c:forEach items="${myOrderDetail }" var="detail">
			<div class="detail-content">
				<div class="img-size">
					<div class="prod-img" onclick="location.href = 'prodOne.ko?p_no=${detail.p_no}';"><img title="img" src="img/${detail.p_img }" style="width:100px; height:100px;"></div>
				</div>
				<div class="text-content">
					<div style="margin-right:8px;">${detail.p_name }</div>
					<div style="margin-right:40px;">${detail.p_desc }</div>
					<div style="margin-right:20px;">${detail.p_price }원</div>
					<div style="margin-right:25px;">수량 ${detail.o_stock }개</div>				
					<div style="margin-right:10px;">${detail.str_total }원</div>
					<c:choose>
					<c:when test="${detail.o_state eq '배송완료' }">
						<c:choose>
							<c:when test="${detail.o_revstate eq '0' }">
								<div style="width: 100px;">
									<button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#myModal' 
									data-pno="${detail.p_no }" data-ono="${detail.o_no }">리뷰작성</button>
								</div>
							</c:when>
							<c:otherwise>
								<div style="width: 100px;">
									<button type="button" class='btn btn-outline-primary btn-sm' onclick="location.href='myRevList.ko';">리뷰목록</button>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<div style="width: 100px;">
							<button type="button" class='btn btn-outline-primary btn-sm' onclick="location.href='prodOne.ko?p_no=${detail.p_no}';">상품보기</button>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
				<div class="app-info">
					<div class="application">${detail.p_name }</div>
					<div class="application"><small>${detail.p_price }원 / 수량 ${detail.o_stock }개 / 총 ${detail.str_total }원</small></div>				
				</div>
			</div>
		</c:forEach>
		<c:forEach items="${myOrderDetail }" var="detail" begin="0" end="0">
		<div class="info">
			<div class="customer">
				<div class="wrap">
					<div class="info-title">
						<div>받는 분 정보</div>
					</div>
					<div class="customer-info">
						<div class="cus-tt">받는 분</div>
						<div>${detail.u_name } / ${detail.u_tel }</div>
					</div>
					<div class="customer-info">
						<div class="cus-tt">주소</div>
						<div class="addr-info">${detail.o_addr }</div>
					</div>
					<div class="customer-info">
						<div class="cus-tt">주문번호</div>
						<div>${detail.o_no }</div>
					</div>
				</div>
				<c:if test="${detail.o_state eq '상품 준비중'}">
					<div>
						<button type="button" value="${detail.o_no }" class="btn btn-outline-warning btn-sm cancel_module">결제취소</button>		
					</div>
				</c:if>				
			</div>
			
			<div class="porter">
				<div class="porter-title">
					<div>계산서</div>
				</div>
				<div class="porter-info" style="font-weight:bold;">
					<div class="cus-tt">총 주문 금액</div>
					<div>${prodTotal}원</div>
				</div>
				<div class="porter-info">
					<div class="cus-tt">상품 금액</div>
					<div>${prodTotal}원</div>
				</div>
				<div class="porter-info">
					<div class="cus-tt">배송비</div>
					<div>0원</div>				
				</div>
				<div class="porter-info" style="font-weight:bold; border-top:1px solid rgb(238, 238, 238);">
					<div class="cus-tt">총 할인 금액</div>
					<div>${dcTotal }원</div>
				</div>
				<div class="porter-info">
					<div class="cus-tt">등급 할인</div>
					<div>${dcTotal }원</div>				
				</div>
				<div class="porter-info">
					<div class="cus-tt">상품 할인</div>
					<div>0원</div>				
				</div>
				<div class="porter-info">
					<div class="cus-tt">쿠폰 할인</div>
					<div>0원</div>				
				</div>
				<div class="porter-total">
					<div class="cus-tt">총 결제 금액</div>
					<div>${allTotal}원</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
<div class="btn-div">
	<input type="button" value="이전" id="submit" class="submit btn-primary" onclick="history.back()">
</div>

<div class="modal" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">리뷰작성</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form action="prodRevInsert.ko" method="post" enctype="multipart/form-data" id="prodRevInsert">
			<div class="modal-body">
					<input type="hidden" name="u_no" value="${userNO }">
					<input type="hidden" name="o_no" value="" class="ono">
					<input type="hidden" name="p_no" value="" class="pno">
					<br>
					<span>별점 : 
						<span id="star-fill" style="color:DarkOrange;">
							<span onclick="starFill(1);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(2);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(3);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(4);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
							<span onclick="starFill(5);">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
								  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
								</svg>
							</span>
						</span>
					</span>
					<input type="radio" name="pr_star" id="star1" value="1" style="display:none;">
					<input type="radio" name="pr_star" id="star2" value="2" style="display:none;">
					<input type="radio" name="pr_star" id="star3" value="3" style="display:none;">
					<input type="radio" name="pr_star" id="star4" value="4" style="display:none;">
					<input type="radio" name="pr_star" id="star5" value="5" style="display:none;">
					<br><br>
					<textarea rows="8" name="pr_content"></textarea>
					<br><br>
					<div><img id="preview" src="" alt="" style=""></div>
					<label for="file" class="btn btn-outline-secondary btn-sm">첨부파일</label>
					<input type="file" id="file" name="uploadFile" class="btn btn-outline-secondary btn-sm" style="display:none;">
					<br>
			</div>
			<div class="modal-footer">
				<button class="btn btn-outline-primary" type="submit">등록</button>
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
			</div>
			</form>
		</div>
	</div>
</div>

<script>
$('#myModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // modal을 열기 위해 클릭한 버튼
	var oNo = button.data('ono');
	var pNo = button.data('pno');
	var modal = $(this);
	modal.find('.ono').val(oNo); // modal-body 내의 input 요소에 값 설정
	modal.find('.pno').val(pNo); // modal-body 내의 input 요소에 값 설정
});

// Modal이 닫힐 때 실행되는 함수
$('#myModal').on('hidden.bs.modal', function () {
    $('#prodRevInsert')[0].reset();
	let fill = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>';
	let fillNone = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>';
	let spanTag1 = '<span onclick="starFill(1);">';
	let spanTag2 = '<span onclick="starFill(2);">';
	let spanTag3 = '<span onclick="starFill(3);">';
	let spanTag4 = '<span onclick="starFill(4);">';
	let spanTag5 = '<span onclick="starFill(5);">';
	let spanEnd = '</span> ';
    let starFill = document.getElementById("star-fill");
    starFill.innerHTML = spanTag1 + fillNone + spanEnd + spanTag2 + fillNone + spanEnd + spanTag3 + fillNone + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
    document.getElementById('preview').style = "display:none;";
});

function starFill(star) {
	let fill = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>';
	let fillNone = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>';
	let spanTag1 = '<span onclick="starFill(1);">';
	let spanTag2 = '<span onclick="starFill(2);">';
	let spanTag3 = '<span onclick="starFill(3);">';
	let spanTag4 = '<span onclick="starFill(4);">';
	let spanTag5 = '<span onclick="starFill(5);">';
	let spanEnd = '</span> ';
	let starFill = document.getElementById("star-fill");
	let radio = document.querySelectorAll('input[type="radio"][name="pr_star"]');
	
	if (star === 1) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fillNone + spanEnd + spanTag3 + fillNone + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else if (star === 2) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fillNone + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else if (star === 3) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fill + spanEnd + spanTag4 + fillNone + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else if (star === 4) {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fill + spanEnd + spanTag4 + fill + spanEnd + spanTag5 + fillNone + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	} else {
		starFill.innerHTML = spanTag1 + fill + spanEnd + spanTag2 + fill + spanEnd + spanTag3 + fill + spanEnd + spanTag4 + fill + spanEnd + spanTag5 + fill + spanEnd;
		radio.forEach(function(radioBtn) {
	        if (radioBtn.value == star) {
	        	radioBtn.checked = true;
	        }
	    });
	}
};

document.getElementById("file").addEventListener('change', function(event){
    var fileInput = document.getElementById('file');
    // 파일이 선택되었는지 확인합니다.
    if (fileInput.files.length > 0) {
        // 파일 입력 요소에서 선택된 파일 가져오기
        var file = event.target.files[0];

        // FileReader 객체 생성
        var reader = new FileReader();

        // 파일을 읽은 후 실행될 함수 정의
        reader.onload = function(event) {
            // 이미지를 표시할 img 요소 가져오기
            var imgElement = document.getElementById('preview');

            // FileReader가 읽은 데이터를 img 요소의 src 속성에 설정하여 이미지 표시
            imgElement.src = event.target.result;
            imgElement.style = "width:200px;";
        };

        // 파일을 읽기
        reader.readAsDataURL(file);
    }
});
</script>
<script>
$(".cancel_module").click(function () {
	let result = confirm('취소하시겠습니까?');
	if(result){
		$.ajax({
			url : "cancle.ko",
			data : {"mid": $(".cancel_module").val()},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1){
					alert("결제가 취소되었습니다.");
					location.href = "myPage.ko";
				}
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	}
});
</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>