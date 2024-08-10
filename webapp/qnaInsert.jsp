<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<style>
.containerBox {
	box-sizing: border-box;
	margin: 0 auto;
	width: 40%;
}

.body_Top {
	width: 100%;
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

textarea.q_content {
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

table.QnA_box td.css-td input,
table.QnA_box td.css-td textarea.q_content {
	width: 100%;
}

select:focus-visible {
	outline:none;
}

@media (max-width: 576px) {
	div.containerBox {
		width: 90% !important;
	}
}

@media (min-width: 577px) and (max-width: 770px) {
	div.containerBox {
		width: 60%;
	}
}
@media (min-width: 771px) and (max-width: 1000px) {
	div.containerBox {
		width: 50%;
	}
}
</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="containerBox">
	<div class="body_Top">
		<form action="qnaInsert.ko" method="post" enctype="multipart/form-data">
			<div class="bodyBox">
				<section class="title">문의하기</section>
					<input type="hidden" name="q_writer" value="${userID }">
					<table class="QnA_box">
						<tr>
							<td>카테고리</td>
							<td>
								<select name="q_cate" style="border:none;">
									<option value="">선택</option>
									<option value="회원/정보관리">회원/정보관리</option>
									<option value="주문/결제">주문/결제</option>
									<option value="배송">배송</option>
									<option value="반품/환불/교환">반품/환불/교환</option>
									<option value="영수증/증빙서류">영수증/증빙서류</option>
									<option value="상품">상품</option>
									<option value="기타">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="left">제목</td>
							<td class="css-td">
								<input type="text" name="q_title">
							</td>
						</tr>
						<tr class="contentBox">
							<td colspan="2">문의내용</td>
						</tr>
						<tr class="contentBox">
							<td class="css-td" colspan="2">
								<textarea class="q_content" rows="10" name="q_content"></textarea>
							</td>
						</tr>
					</table>
			</div>
			<div class="footerButtons">
				<button type="submit" class="btn btn-outline-primary btn-sm" style="margin-right:10px;">작성</button>
				<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='qnaList.ko';">취소</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>