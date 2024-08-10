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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css"/>
<title>문의사항</title>
<style>
table th {
    text-align: center;
}
table {
	text-align: center;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container" id="container-MemList">
	<h2 style="margin-bottom:20px; font-weight:bold; font-size: 24px;">QNA 목록</h2>
	<div class="divTable">
	<nav id="searchNav">
	</nav>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>리뷰번호</th>
				<th>상태</th>
			</tr>
	    </thead>
	    <tbody>
		<c:forEach items="${qnaList }" var="qna">
			<tr onclick="location.href = 'adminQnaView.ko?q_no=${qna.q_no }';" style="cursor: pointer">
				<td>${qna.rnum }</td>
				<td>${qna.q_cate }</td>
				<td>${qna.q_title }</td>
				<td>${qna.q_writer }</td>
				<td>${qna.q_date }</td>
				<td>${qna.q_no }</td>
				<td>${qna.q_state }</td>
			</tr>
		</c:forEach>
	    </tbody>
	</table>
	<div class="searchDiv">
		<form class="searchForm" action="adminQnaList.ko" method="post">
	        <select id="sel1" name="searchCondition">
	            <c:choose>
	                <c:when test="${condition == 'q_cate'}">
						<option value="${conditionMapQNA['카테고리']}">카테고리</option>
						<option value="${conditionMapQNA['상태']}">상태</option>
						<option value="${conditionMapQNA['제목']}">제목</option>
						<option value="${conditionMapQNA['작성자']}">작성자</option>
	                </c:when>
	               <c:when test="${condition == 'q_state'}">
						<option value="${conditionMapQNA['상태']}">상태</option>
						<option value="${conditionMapQNA['카테고리']}">카테고리</option>
						<option value="${conditionMapQNA['제목']}">제목</option>
						<option value="${conditionMapQNA['작성자']}">작성자</option>
	                </c:when>
	               <c:when test="${condition == 'q_title'}">
						<option value="${conditionMapQNA['제목']}">제목</option>
						<option value="${conditionMapQNA['카테고리']}">카테고리</option>
						<option value="${conditionMapQNA['상태']}">상태</option>
						<option value="${conditionMapQNA['작성자']}">작성자</option>
	                </c:when>
	               <c:when test="${condition == 'q_writer'}">
						<option value="${conditionMapQNA['작성자']}">작성자</option>
						<option value="${conditionMapQNA['카테고리']}">카테고리</option>
						<option value="${conditionMapQNA['상태']}">상태</option>
						<option value="${conditionMapQNA['제목']}">제목</option>
	                </c:when>
	                <c:otherwise>
						<option value="${conditionMapQNA['카테고리']}">카테고리</option>
						<option value="${conditionMapQNA['상태']}">상태</option>
						<option value="${conditionMapQNA['제목']}">제목</option>
						<option value="${conditionMapQNA['작성자']}">작성자</option>
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
           			 <a class="page-link" href="adminQnaList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${keyword}&searchCondition=${condition}">이전</a>
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
           			 	<a class="page-link" href="adminQnaList.ko?currPageNo=${page}&searchKeyword=${keyword}&searchCondition=${condition}">${page}</a>
         			</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when test="${pagination.currPageNo == pagination.pageCnt}">
				<!-- 현재 페이지가 마지막 페이지인 경우 -->
				<li class="page-item"><a class="page-link">다음</a></li>
			</c:when>
			<c:otherwise>
				<!-- 다음 페이지로 이동하는 링크 -->
					<li class="page-item">
           			 	<a class="page-link" href="adminQnaList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${keyword}&searchCondition=${condition}">다음</a>
         			</li>
			</c:otherwise>
		</c:choose>
	</ul>
	</div>
</div>
</body>
</html>