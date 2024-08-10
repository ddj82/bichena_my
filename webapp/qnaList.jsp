qnaView.jsp<%@ page import="org.springframework.ui.Model" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
/* 유저 페이징처리 스타일 통일사항 */
.list-pagination {
	display: flex;
	justify-content: center;
	margin-bottom: 60px;
	margin-top: 20px;
}
page-link:hover {
    z-index: 2;
    color: #005930!important!important;
    text-decoration: none!important;
    background-color: #e9ecef!important;
    border-color: #dee2e6!important;
    border-radios: 5px!important;
}
.page-link:focus {
    box-shadow: 0 0 0 .2rem rgb(23 147 9 / 25%)!important;
    color: #005930!important;
    border-radius: 5px!important;
}

.page-link {
    padding: .5rem .75rem!important;
    margin-left: -1px;
    line-height: 1.25!important;
    color: #005930!important;
    background-color: #fff!important;
    border: none!important;
}

.page-item.active .page-link {
    background-color: #005930!important;
    border-color: #005930!important;
    border-radius: 5px!important;
    color:white!important;
}
.findMem{
	text-align: center;
	margin-top: 30px;
	display: right;
}

.container2 {
	text-align: right;
	margin-top: 40px;
}
table.table.table-hover {
	margin-top: 20px;
}

@media (max-width: 576px) {
	table.table.table-hover tr th.css-none,
	table.table.table-hover tr td.css-none {
		display:none;
	}
	
	table.table.table-hover th {
		font-size: 15px;
	}
	table.table.table-hover td {
		font-size: 14px;
	}
}
</style>
<script>
function qnaView(uid, qno, sid) {
	if (uid == sid) {
		location.href = 'qnaView.ko?q_no=' + qno;
	} else if (sid == 'admin') {
		location.href = 'adminQnaView.ko?q_no=' + qno;
	} else {
		alert('작성자만 조회 가능합니다.');
	}
}
</script>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container container2">
	<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href = 'qnaList.ko';">목록</button>
	<c:if test="${userID ne null }">
		<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href = 'qnaListMy.ko';">나의 문의</button>
	</c:if>
	<table class="table table-hover">
		<thead>
			<tr>
				<th class="css-none">번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th class="css-none">작성자</th>
				<th>날짜</th>
				<th>상태</th>
			</tr>
	    </thead>
	    <tbody>
			<c:choose>
				<c:when test="${qnaList.size() eq 0}">
					<tr>
						<td colspan="6">
							<div style="text-align:center; margin-top: 30px;">등록 된 리뷰가 없습니다.</div>
						</td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach items="${qnaList }" var="qna">
						<tr onclick="qnaView('${qna.q_writer }', ${qna.q_no }, '${userID }')" style="cursor: pointer">
							<td class="css-none">${qna.q_no }</td>
							<td>${qna.q_cate }</td>
							<td>${qna.q_title }</td>
							<td class="css-none">${qna.q_writer }</td>
							<td>${qna.q_date }</td>
							<td>${qna.q_state }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	    </tbody>
	</table>
	<c:if test="${userID != null && userID != 'admin' }">
		<button type="button" class="btn btn-outline-primary" onclick="location.href = 'qnaInsertbtn.ko';">문의하기</button>
	</c:if>
	<br>
	<br>
	
	<!-- 페이징 처리 -->
	<c:choose>
		<c:when test="${paginationMy eq null }">
			<ul class="pagination list-pagination">
				<c:choose>
					<c:when test="${pagination.currPageNo == 1}">
						<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
						<li class="page-item"><a class="page-link">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
		           			 <a class="page-link" href="qnaList.ko?currPageNo=${pagination.currPageNo - 1}">이전</a>
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
		           			 	<a class="page-link" href="qnaList.ko?currPageNo=${page}">${page}</a>
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
		           			 	<a class="page-link" href="qnaList.ko?currPageNo=${pagination.currPageNo + 1}">다음</a>
		         			</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:when>
		
		<c:otherwise>
			<ul class="pagination list-pagination">
				<c:choose>
					<c:when test="${paginationMy.currPageNo == 1}">
						<!-- 현재 페이지가 첫 번째 페이지인 경우 -->
						<li class="page-item"><a class="page-link">이전</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
		           			 <a class="page-link" href="qnaListMy.ko?currPageNo=${paginationMy.currPageNo - 1}">이전</a>
		         		</li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${paginationMy.startPage}" end="${paginationMy.endPage}" var="page">
					<c:choose>
						<c:when test="${page eq paginationMy.currPageNo}">
							<li class="page-item active"><a class="page-link">${page}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
		           			 	<a class="page-link" href="qnaListMy.ko?currPageNo=${page}">${page}</a>
		         			</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		
				<c:choose>
					<c:when test="${paginationMy.currPageNo == paginationMy.pageCnt}">
						<!-- 현재 페이지가 마지막 페이지인 경우 -->
						<li class="page-item"><a class="page-link">다음</a></li>
					</c:when>
					<c:otherwise>
						<!-- 다음 페이지로 이동하는 링크 -->
							<li class="page-item">
		           			 	<a class="page-link" href="qnaListMy.ko?currPageNo=${paginationMy.currPageNo + 1}">다음</a>
		         			</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:otherwise>
	</c:choose>
</div>	
<%@ include file="../../common/footer.jsp"%>
</body>
</html>