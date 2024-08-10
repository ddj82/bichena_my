<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if (session.getAttribute("userID") == null) {
%>
<script>
location.href="main.ko";
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>문의보기</title>
</head>
<style>
.containerBox {
	box-sizing: border-box;
	width: 100%;
}

.body_Top {
	width: 50%;
	margin: 0 auto;
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

textarea {
	width: 100%;
	resize: none;
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

</style>
</head>
<body>
	<div class="containerBox">
		<%@ include file="/WEB-INF/admin/adminMain.jsp"%>
		<div class="body_Top">
			<div class="bodyBox">
				<section class="title">문의보기</section>

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
				<c:choose>
					<c:when test="${userID eq 'admin' }">
						<c:choose>
							<c:when test="${qnaView.a_content == null}">
								<form action="qnaAcontent.ko" method="post">
									<input type="hidden" name="q_no" value="${qnaView.q_no}">
									<p id="P_Answer">답변하기</p>
									<textarea class="form-control" rows="10" name="a_content"></textarea>
									<div class="buttonContainer">
										<button type="submit" class="btn btn-primary">확인</button>
										<button type="button" class="btndel btn btn-danger"
											onclick="qnaDelbtn(${qnaView.q_no})">삭제</button>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<textarea class="form-control" rows="10" name="a_content"
									readonly>${qnaView.a_content }</textarea>
								<div class="buttonContainer">
									<button type="button" class="btndel btn btn-danger"
										onclick="qnaDelbtn(${qnaView.q_no})">삭제</button>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:if test="${qnaView.a_content != null}">
							<textarea class="form-control" rows="10" name="a_content"
								readonly>${qnaView.a_content }</textarea>
							<div class="buttonContainer">
								<button type="button" class="btndel btn btn-danger"
									onclick="qnaDelbtn(${qnaView.q_no})">삭제</button>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="footerButtons">
				<button type="button" class="ListBtn" onclick="qnaList()">목록보기</button>
			</div>
		</div>
	</div>

	<script>
    function qnaDelbtn(qno) {
        let con = confirm("정말 삭제하시겠습니까?");
        console.log(con);
        if (con) {
            location.href = 'qnaDelete.ko?q_no=' + qno;
        }
    }
    function qnaList() {
        history.back();
    }
</script>
</body>
</html>
