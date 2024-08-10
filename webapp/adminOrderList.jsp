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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css"/>
<title>Insert title here</title>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
.table.table-hover>thead>tr>td {
	vertical-align: middle;
}
.table.table-bordered>thead>tr>td {
	border-bottom: none;
}
.table.table-bordered>thead>tr>td#td-title {
	vertical-align: middle;
	width: 15%;
	font-size: 1.4rem;
	background-color: #f5f5f5;
}
table.table.table-order>tbody#myList>tr>td {
	vertical-align: middle;
}
table.table.table-order>tbody#myList>tr>td#td-detail {
	text-align: right;
	line-height: 1.8;
}

button.btn.btn-danger.btn-sm.del[disabled] {
	opacity: 1;
}
div#myModal>div.modal-dialog>div.modal-content tr.tr.detail-tr>td,
div#myModal>div.modal-dialog>div.modal-content tr.tr.detail-tr>th {
	text-align: left;
	padding: 7px;
}
div#myModal>div.modal-dialog>div.modal-content table,
div#myModal>div.modal-dialog>div.modal-content tr.tr.detail-tr {
	width: 100%;
}
/* 디테일모달>컬럼td,th */
div#myModal>div.modal-dialog>div.modal-content tr>.td.col-td {
	width: 20%;
}
/* 검색버튼 */
form.searchForm {
	display: block;
}
button.btn-form-submit {
	margin-top: 0;
	margin-bottom: 20px;
	width: 100px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container" id="container-MemList">
	<h2 style="margin-bottom:20px; font-weight:bold; font-size: 24px;">전체 주문 목록</h2>
	<div class="divTable">
	
	
		<form class="searchForm" action="adminOrderList.ko" method="get">
		    <table class="table table-bordered">
		        <thead>
		            <tr>
		                <td id="td-title">주문 번호</td>
		                <td>
		                    <div class="col-xs-4">
		                        <input class="form-control" name="o_no" type="text" placeholder="주문번호">
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td id="td-title">주문자 이름</td>
		                <td>
		                    <div class="col-xs-4">
		                        <input class="form-control" name="u_name" type="text" placeholder="주문자이름">
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td id="td-title">주문 날짜</td>
		                <td>
		                    <div class="col-xs-4">
		                        <input class="form-control" name="o_date" type="text" placeholder="주문 날짜 yyyy-mm-dd">
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td id="td-title">주문 상태</td>
		                <td>
		                    <div style="text-align:left;padding-left: 15px;">
		                        <label class="checkbox-inline"><input class="cBox" type="checkbox" name="o_state" value="상품 준비중">상품 준비중</label>
		                        <label class="checkbox-inline"><input class="cBox" type="checkbox" name="o_state" value="배송중">배송중</label>
		                        <label class="checkbox-inline"><input class="cBox" type="checkbox" name="o_state" value="배송완료">배송완료</label>
		                        <label class="checkbox-inline"><input class="cBox" type="checkbox" name="o_state" value="취소">취소</label>
		                    </div>
		                </td>
		            </tr>
		        </thead>
		    </table>
		    <button type="submit" class="btn btn-primary btn-sm btn-form-submit">검색</button>
		</form>
	
	
	<table class="table table-order">
		<thead>
			<tr>
				<th id="rnum-th">번호</th>
				<th>주문번호</th>
				<th>주문날짜</th>
				<th>주문자이름</th>
				<th>주문상태</th>
				<th>주문취소</th>
				<th>주문 총금액</th>
				<th>주문 상세보기</th>
			</tr>
		</thead>
		<tbody id="myList">
		<c:forEach items="${adminOrderRepeat }" var="order">
			<tr>
				<td id="rnum-td">${order.rnum }</td>
				<td class="o_no">${order.o_no }</td>
	            <td class="o_date">${order.o_date }</td>
	            <td class="u_name">${order.u_name }</td>
	            <td class="o_state">${order.o_state }</td>
	            
	            <c:choose>
	            	<c:when test="${order.o_state eq '상품 준비중'}">
			            <td>
			                <button type="button" class="btn btn-danger btn-sm del" onclick="cancelModule('${order.o_no }')">주문취소</button>
			            </td>	            	
	            	</c:when>
	            	<c:otherwise>
	            		<td>
			                <button type="button" class="btn btn-default btn-sm del" disabled>주문취소</button>	            		
	            		</td>
	            	</c:otherwise>
	            </c:choose>
	      		
	      		<td>${order.o_total } 원</td>
	      		
	      		<td id="td-detail">
		            <c:forEach items="${adminOrderList }" var="orderList">
		            	<c:if test="${order.o_no eq orderList.o_no }">
				            ${orderList.p_name } / ${orderList.o_stock }개
				            <button type="button" class="btn btn-primary btn-xs tail" data-toggle="modal" 
				            data-target="#myModal" onclick="orderDetail('${orderList.o_no }','${orderList.p_no }')">상세보기</button><br>  	
		            	</c:if>
		            </c:forEach>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 처리 -->
   	<ul class="pagination list-pagination">
      <c:choose>
         <c:when test="${pagination.currPageNo == 1}">
            <!-- 현재 페이지가 첫 번째 페이지인 경우 -->
            <li class="page-item"><a class="page-link">이전</a></li>
         </c:when>
         <c:otherwise>
            <li class="page-item">
                     <a class="page-link" href="adminOrderList.ko?currPageNo=${pagination.currPageNo - 1}&o_no=${param.o_no}&u_name=${param.u_name}&o_date=${param.o_date}&o_state=${param.o_state}" class="btn btn-primary btn-xs">이전</a>
               </li>
         </c:otherwise>
      </c:choose>
      <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="page">
         <c:choose>
            <c:when test="${page eq pagination.currPageNo}">
               <li class="page-item active"><a class="page-link">${page}</a></li>
            </c:when>
            <c:otherwise>
               <li class="page-item">
                        <a class="page-link" href="adminOrderList.ko?currPageNo=${page}&o_no=${param.o_no}&u_name=${param.u_name}&o_date=${param.o_date}&o_state=${param.o_state}" class="">${page}</a>
                  </li>
            </c:otherwise>
         </c:choose>
      </c:forEach>

      <c:choose>
         <c:when test="${pagination.currPageNo == pagination.pageCnt or pagination.pageCnt <= 1}">
            <!-- 현재 페이지가 마지막 페이지인 경우 -->
            <li class="page-item"><a class="page-link">다음</a></li>
         </c:when>
         <c:otherwise>
            <!-- 다음 페이지로 이동하는 링크 -->
               <li class="page-item">
                        <a class="page-link" href="adminOrderList.ko?currPageNo=${pagination.currPageNo + 1}&o_no=${param.o_no}&u_name=${param.u_name}&o_date=${param.o_date}&o_state=${param.o_state}" class="btn btn-primary btn-xs">다음</a>
                  </li>
         </c:otherwise>
      </c:choose>
	</ul>
	</div>
</div>
<script>

function cancelModule(val){
	let result = confirm('취소하시겠습니까?');
	if(result){
		$.ajax({
			url : "cancle.ko",
			data : {"mid": val},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1){
					alert("취소 완료");
					location.href = "adminOrderList.ko";
				}
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	}	
}

function orderDetail(ono,pno){
	let objParams = {
		o_no : ono,
		p_no : pno
	};
	$.ajax({
		type : "GET",
		url : "adminOrderDetail.ko",
		data : objParams,
		cache : false,
		success : function(val) {
			let str = "상품 준비중";
			$("#tail-date").text("");
			$("#tail-no-name-tel").text("");
			$("#tail-state").text("");
			$("#tail-prod").text("");
			$("#tail-user").text("");
			$("#tail-pay").text("");
			
			$("#tail-date").append(val.o_date);
			$("#tail-no-name-tel").append("<p>주문번호 : " + val.o_no + "</p>" + "<div>" + val.u_name + " | " + val.u_tel + "</div>");
			$("#tail-state").append(val.o_state);
			$("#tail-prod").append("<tr class='tr detail-tr'><td class='td col-td'>상품사진 : </td><td><img src='img/"+ val.p_img +"' width='100px' height='100px'/></td></tr><tr class='tr detail-tr'><td class='td col-td'>상품명 : </td><td>"+ val.p_name +"</td></tr><tr class='tr detail-tr'><td class='td col-td'>수량 : </td><td>"+ val.o_stock +"개</td></tr><tr class='tr detail-tr'><td class='td col-td'>가격 : </td><td>"+ val.p_price +"원</td></tr>");
			
			
			$("#tail-user").append("<tr class='tr detail-tr'><td class='td col-td'>받는분 : </td><td> " + val.u_name + " | " + val.u_tel + "</td></tr><tr class='tr detail-tr'><td class='td col-td'>주소 : </td><td>" + val.o_addr + "</td></tr>");
			
			
			$("#tail-pay").append("<tr class='tr detail-tr'><th class='td col-td'>금액 : &nbsp;</th><th>" + val.o_total + "원</th></tr>");
		}
	});	
}
</script>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title" id="tail-date"></h3>
                <br>
                <div id="tail-no-name-tel"></div>
            </div>
               <br>
            <div class="modal-header">
                <h4 class="modal-title" id="tail-state"></h4>
            </div>
            <div class="modal-header">
                <table id="tail-prod"></table>
            </div>
               <br>
            <div class="modal-header">
                <h4 class="modal-title">받는 분 정보</h4>
            </div>
            <div class="modal-body">
                <table id="tail-user"></table>
            </div>
            <div class="modal-header">
                <br>
                <h4 class="modal-title">계산서</h4>
            </div>
            <div class="modal-body">
                <table id="tail-pay"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>