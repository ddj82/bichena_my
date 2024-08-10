<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f9fa;
    color: #212529;
}

.rev-table {
    border-collapse: collapse;
    width: 100%;
    padding : 0;
    background-color: #ffffff;
    box-shadow: 0 0 5px rgba(0,0,0,0.1);
}
.container, #revContentTB {
	margin-top : 20px;
	width : 1070px !important;
}
#revContentTB {
	max-width: 100% !important;
}
.revOrder {
	text-align : center;
}

img {
    width: 100px;
    height: auto;
    border-radius: 10px;
}

textarea { 
    border: 2px solid #ccc; 
    border-radius: 10px; 
    padding: 10px; 
    width: 100%; 
    box-sizing: border-box; 
} 

button {
    background-color: #007bff;
    border: none;
    padding: 8px 16px;
    font-size: 16px;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}

th, td {
    padding: 12px 15px;
    border-bottom: 2px solid #f1f1f1;
}

th {
	width : 200px;
	text-align : center !important;
    background-color: #f0f0f0;
}
.revContent table#revContentTB td {
	text-align: center;
}

#revContent {
	margin-top: 50px;
}

@media (max-width: 576px) {
	div.container, #revContentTB {
		max-width: 100%;
	}
	#revContent table.rev-table th {
		width: 30%;
	}
	.revContent table#revContentTB td.table-css,
	.revContent table#revContentTB th.table-css {
		display: none;
	}
	
}

@media (max-width: 770px) {
	.revContent table#revContentTB td.css-state,
	.revContent table#revContentTB th.css-state {
		display: none;
	}
}

@media (max-width: 1200px) {
	.revContent table#revContentTB {
		max-width: 100%;
	}
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<%@ include file="myPageHeader.jsp" %>
<div class="container">
	<button type="button" onclick="location.href='myRevList.ko';" class="btn btn-outline-primary btn-sm">나의 리뷰</button> 
	<button type="button" onclick="myRevIstOrder();" class="btn btn-outline-primary btn-sm">작성 가능한 리뷰</button>
	<div id="revContent">
		<c:choose>
			<c:when test="${myRevList.size() eq 0 }">
				<div style="text-align:center;">작성 된 리뷰가 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${myRevList }" var="rev">
					<table class="rev-table">
						<tr>
							<th class="my-rev-th">상품이름</th>
							<td class="my-rev-td">${rev.p_name }</td>
						</tr>
						<tr>
							<th class="my-rev-th">내용</th>
							<td class="my-rev-td">${rev.pr_content }</td>
						</tr>
						<tr>
							<th class="my-rev-th">별점</th>
							<td class="my-rev-td" style="color:DarkOrange;">
				            	<c:choose>
				            	<c:when test="${rev.pr_star eq '1' }">
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            	</c:when>
				            	<c:when test="${rev.pr_star eq '2' }">
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            	</c:when>
				            	<c:when test="${rev.pr_star eq '3' }">
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            	</c:when>
				            	<c:when test="${rev.pr_star eq '4' }">
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/>
									</svg>
				            	</c:when>
				            	<c:otherwise>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
				            	</c:otherwise>
				            	</c:choose>
				            </td>
						</tr>
						<tr>
							<th class="my-rev-th">날짜</th>
							<td class="my-rev-td">${rev.pr_date }</td>
						</tr>
						<tr>
							<th class="my-rev-th">첨부파일</th>
							<c:choose>
								<c:when test="${rev.pr_img ne null }">
								<!-- 05/15 -->
									<td class="my-rev-td"><img alt="" src="img/imgRev/${rev.pr_img }" style="width:100px;"></td>
								</c:when>
								<c:otherwise>
									<td class="my-rev-td">없음</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td colspan="2" style="text-align:right;">
							<!-- 05/15 -->
								<button type="button" class="btn btn-outline-danger btn-sm" style="margin:5px 0; margin-right:20px;" 
								onclick="revDel('${rev.pr_no }', '${rev.p_no }', '${rev.o_no }')">삭제하기</button>
							</td>
						</tr>
					</table>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="revContent">
		<table id="revContentTB"></table>
	</div>
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
					<div><img id="preview" src="" alt="" style="display:none;"></div>
					<label for="file" class="btn btn-outline-secondary btn-sm">첨부파일</label>
					<input type="file" id="file" name="uploadFile" class="btn btn-outline-secondary btn-sm" style="display:none;">
					<br>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary" onclick="revInsert()">등록</button>
					<button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
function myRevIstOrder(){
	let values = [];
	$.ajax({
		method : "GET",
		url : "myRevIstOrder.ko",
		cache : false,
		success : function(res) {
			if (res.code == "OK") {
				values = res.myRevIstOrder;
				console.log(values);
					$("#revContent").text("");
				if (values.length == 0) {
					$("#revContent").html('<div style="text-align:center;">작성 가능한 리뷰가 없습니다.</div>');
				} else {
					$("#revContentTB").html("<tr><th>주문번호</th><th>상품이름</th><th>주문날짜</th><th>상태</th><th>리뷰작성</th></tr>");
					$.each(values, function(i, o){
						$("#revContentTB").append(
							"<tr>" + 
							"<td id='orderNo'>" + o.o_no + "</td>" + 
							"<td>" + o.p_name + "</td>" + 
							"<td>" + o.o_date + "</td>" + 
							"<td>" + o.o_state + "</td>" + 
							"<td>" + 
							"<button type='button' class='btn btn-outline-primary btn-sm' data-toggle='modal' data-target='#myModal' data-ono='" + o.o_no + "' data-pno='" + o.p_no + "'>리뷰작성</button>" + 
							"</td></tr>"	
						);
					});
				} 
				console.log("성공");
			} else {
				console.log("실패");
			}
		}
	});
};

function revInsert() {
	let chk = 0;
	let radio = document.querySelectorAll('input[type="radio"][name="pr_star"]');
	radio.forEach(function(radioBtn) {
        if (radioBtn.checked == true) {
        	chk++;
        }
    });
	if (chk == 0) {
		alert("별점을 선택해주세요.");
	} else {
		document.getElementById("prodRevInsert").submit();
	}
}

$('#myModal').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget); // modal을 열기 위해 클릭한 버튼
	var oNo = button.data('ono');
	var pNo = button.data('pno');
	var modal = $(this);
	modal.find('.ono').val(oNo); // modal-body 내의 input 요소에 값 설정
	modal.find('.pno').val(pNo); // modal-body 내의 input 요소에 값 설정
});

//Modal이 닫힐 때 실행되는 함수
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
            imgElement.style = "display:inline; width:200px;";
        };

        // 파일을 읽기
        reader.readAsDataURL(file);
    }
});

<!-- 05/15 -->
function revDel(prNo, pNo, oNo) {
	let result = confirm("리뷰를 삭제하시겠습니까?");
	if (result) {
		location.href="prodRevDelete.ko?pr_no=" + prNo + "&p_no=" + pNo + "&o_no=" + oNo;
	}
}
</script>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>