<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의보기</title>
<style>
.containerBox {
	box-sizing: border-box;
	width: 100%;
}

.body_Top {
	width: 50%;
	margin: 0 auto;
	margin-bottom: 50px;
}

.bodyBox {
	width: 100%;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	padding: 0 20px 20px 20px;
	position: relative;
}

.QnA_box {
	width: 100%;
	border-collapse: collapse;
}

.QnA_box td {
	padding: 10px;
	vertical-align: top;
	word-break: break-all;
	overflow-wrap: break-word;
}

.title {
	width: calc(100% + 40px);
	line-height: 1.3;
	color: #333;
	font-size: 24px;
	background-color: #f9f9f9;
	word-break: break-all;
	font-weight: bold;
	padding: 25px 20px;
	margin-top: 50px;
	padding-left: 20px;
	padding-right: 20px;
	margin-left: -20px;
}

.left {
	width: 90px;
	padding-right: 20px;
}

.contentBox {
	margin-top: 35px;
	padding: 20px;
}

textarea.a_content {
	width: 100%;
	resize: none;
	height: 150px;
}
textarea.form-control[readonly] {
	background-color: white;
}

.buttonContainer {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

.buttonContainer button {
	margin-left: 10px;
}

#P_Answer {
	margin: 0 10 10px !important;
	font-size: 16px;
}

.ListBtn {
	background-color: #005930;
	color: white;
	border-radius: 4px;
	padding: 6px 12px;
	border: 1px solid transparent;
}

.footerButtons {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}
@media (max-width: 576px) {
	div.body_Top {
		width: 90% !important;
	}
	textarea.a_content {
	    height: 100px;
	    font-size: 14px;
	}
	
}

@media (max-width: 1000px) {
	div.body_Top {
		width: 70%;
	}
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="containerBox">
	<div class="body_Top">
		<div class="bodyBox">
			<section class="title">문의내역</section>

			<table class="QnA_box">
				<tr>
					<td class="left">카테고리</td>
					<td>${qnaView.q_cate }</td>
				</tr>
				<tr>
					<td class="left">제목</td>
					<td>${qnaView.q_title }</td>
				</tr>
				<tr>
					<td class="left">작성자</td>
					<td>${qnaView.q_writer }</td>
				</tr>
				<tr>
					<td class="left">날짜</td>
					<td>${qnaView.q_date }</td>
				</tr>
				<tr class="contentBox">
					<td>내용</td>
					<td>${qnaView.q_content }</td>
				</tr>
			</table>
			<br>
			<c:if test="${qnaView.a_content != null}">
				<textarea class="a_content" rows="10" name="a_content" readonly>${qnaView.a_content }</textarea>
			</c:if>
			<br>
		</div>
		<div class="footerButtons">
			<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='qnaList.ko';" style="margin-right:10px;">목록보기</button>
			<c:if test="${qnaView.a_content == null}">
				<button type="button" class="btn btn-outline-danger btn-sm" onclick="qnaDelbtn(${qnaView.q_no })">삭제</button>
			</c:if>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
<script>
	function qnaDelbtn(qno) {
		let con = confirm("정말 삭제하시겠습니까?");
		console.log(con);
		if (con) {
			location.href = 'qnaDelete.ko?q_no=' + qno;
		}
	}
</script>
</body>
</html>