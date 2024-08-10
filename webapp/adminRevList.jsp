<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css"/>
<title>Insert title here</title>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
.table>tbody#List>tr>td {
	vertical-align: middle;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container" id="container-MemList">
	<h2 style="margin-bottom:20px; font-weight:bold; font-size: 24px;">후기 목록</h2>
	<div class="divTable">
	<table class="table">
		<thead>
			<tr>
				<th id="rnum-th">번호</th>
				<th>작성자</th>
				<th>상품번호</th>
				<th>상품이름</th>
				<th>별점</th>
				<th>날짜</th>
				<th>후기번호</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody id="List">
		<c:forEach items="${adminRevList }" var="rev">
			<tr>
				<td id="rnum-td">${rev.rnum }</td>
	            <td>${rev.u_nick }</td>
	            <td>${rev.p_no }</td>
	            <td>${rev.p_name }</td>
	            <td style="color:DarkOrange;">
	            	<c:choose>
	            	<c:when test="${rev.pr_star eq '1' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:when test="${rev.pr_star eq '2' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:when test="${rev.pr_star eq '3' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:when test="${rev.pr_star eq '4' }">
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star-empty"></span>
	            	</c:when>
	            	<c:otherwise>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            		<span class="glyphicon glyphicon-star"></span>
	            	</c:otherwise>
	            	</c:choose>
	            </td>
	            <td>${rev.pr_date }</td>
				<td>${rev.pr_no }</td>
	            <td>
	                <button type="button" class="btn btn-primary btn-sm tail" 
	                data-toggle="modal" data-target="#myModal" data-prno="${rev.pr_no }"
	                data-unick="${rev.u_nick }" data-con="${rev.pr_content }">상세보기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="searchDiv">
		<form class="searchForm" action="adminRevList.ko" method="post">
	        <select id="sel1" name="searchCondition">
	            <c:choose>
					<c:when test="${condition == 'pname'}">
						<option value="${conditionMapRev['상품명']}">상품명</option>
						<option value="${conditionMapRev['상품번호']}">상품번호</option>
						<option value="${conditionMapRev['작성자']}">작성자</option>
	                </c:when>
					<c:when test="${condition == 'pno'}">
						<option value="${conditionMapRev['상품번호']}">상품번호</option>
						<option value="${conditionMapRev['상품명']}">상품명</option>
						<option value="${conditionMapRev['작성자']}">작성자</option>
					</c:when>
					<c:when test="${condition == 'unick'}">
						<option value="${conditionMapRev['작성자']}">작성자</option>
						<option value="${conditionMapRev['상품번호']}">상품번호</option>
						<option value="${conditionMapRev['상품명']}">상품명</option>
					</c:when>
					<c:otherwise>
						<option value="${conditionMapRev['상품명']}">상품명</option>
						<option value="${conditionMapRev['상품번호']}">상품번호</option>
						<option value="${conditionMapRev['작성자']}">작성자</option>
					</c:otherwise>
	            </c:choose>
	        </select>
			<c:choose>
				<c:when test="${keyword == ''}">
					<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
				</c:when>
				<c:otherwise>
					<input type="text" name="searchKeyword" value ="${keyword}">
				</c:otherwise>
	        </c:choose>
			<button type="submit" class="btn btn-primary btn-sm">검색</button>
		</form>
	</div>
	
	
	
	<!-- 페이징 처리 -->
	<ul class="pagination list-pagination">
		<c:choose>
			<c:when test="${pagination.currPageNo == 1}">
				<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
				<li class="page-item"><a class="page-link">이전</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
           			 <a class="page-link" href="adminRevList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${keyword}&searchCondition=${condition}">이전</a>
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
           			 	<a class="page-link" href="adminRevList.ko?currPageNo=${page}&searchKeyword=${keyword}&searchCondition=${condition}">${page}</a>
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
           			 	<a class="page-link" href="adminRevList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${keyword}&searchCondition=${condition}">다음</a>
         			</li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>





<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title" id="tail-date"></h3>
            </div>
            <div class="modal-body"></div>
            <div class="modal-none" id="delPrNo" style="display:none;"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="revDel()">삭제</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script>
$('#myModal').on('show.bs.modal', function (event) {
	let button = $(event.relatedTarget); // modal을 열기 위해 클릭한 버튼
	let uNick = button.data('unick');
	let prCon = button.data('con');
	let prNo = button.data('prno');
	let modal = $(this);
	modal.find('.modal-title').text("");
	modal.find('.modal-body').text("");
	modal.find('.modal-none').text("");
	modal.find('.modal-title').text(uNick + "님 리뷰");
	modal.find('.modal-body').text(prCon);
	modal.find('.modal-none').text(prNo);
});
function revDel() {
	let result = confirm("고객 리뷰를 삭제하시겠습니까?");
	let delPrNo = document.getElementById("delPrNo").innerText;
	if (result) {
		let res = confirm("정말 삭제하시겠습니까?");
		if (res) {
	 		location.href="prodRevDelete.ko?pr_no=" + delPrNo;
		}
	}
}
</script>
</body>
</html>