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
table.table>tbody>tr>td, table.table>tbody>tr>th, table th {
    text-align: center;
    vertical-align: middle;
}
table {
    text-align: center;
}
table#table1, table#table2, 
table.table#form>tbody>tr>td, 
table.table#table2>tbody>tr>td, 
table.table#form1>tbody>tr>td {
    text-align: justify;
}
table.table.table0>tbody>tr>td, 
table.table.table0>tbody>tr>td, 
table.table.table0>tbody>tr>th {
    border: none;
}
table.table#table2>tbody>tr>td, 
table.table#table2>tbody>tr>td, 
table.table#table2>tbody>tr>th {
    width: 25%;
}
table.table#form>tbody>tr>td>label {
    width: 30%;
}
table.table#form>tbody>tr>td>input,
table.table#form>tbody>tr>td>textarea {
    width: 60%;
}
table.table#form>tbody>tr>td#td-rowspan5, 
table.table#form>tbody>tr>td#td-rowspan2 {
    width: 40%;
}
/* 파일 선택 버튼의 기본 스타일 숨기기 */
input[type="file"]#p_img {
    display: none;
}
/* 파일 선택 버튼을 가리키는 레이블 스타일링 */
.custom-file-label {
    cursor: pointer;
}
#footer {
    text-align: right;
    padding-right: 15px;
}
</style>
<script>
</script>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="container" id="container-MemList">
	<h2 style="margin-bottom:20px; font-weight:bold; font-size: 24px;">상품 목록</h2>
	<div class="divTable">
	<div id="footer">
		<button type="button" class="btn btn-success" onclick="location.href='adminProdInsertBtn.ko';">주류등록</button>
	</div>
	<table class="table table-striped">
		<thead>
			<tr>
				<th id="rnum-th">번호</th>
				<th>상품사진</th>
				<th>주류종류</th>
				<th>상품명</th>
				<th>상품번호</th>
				<th>가격</th>
				<th>재고</th>
				<th>상세보기</th>
				<th>수정하기</th>
				<th>삭제하기</th>
			</tr>
		</thead>
		<tbody id="myList">
		<c:forEach items="${adminProdList }" var="prodlist">
			<tr>
				<td id="rnum-td">${prodlist.rnum }</td>
	            <td>
	            	<img src="img/${prodlist.p_img }" title="img" alt="img" style="width:80px;">
	            </td>
	            <td>${prodlist.p_type }</td>
	            <td>${prodlist.p_name }</td>
				<td>${prodlist.p_no }</td>
	            <td>${prodlist.p_price }</td>
	            <td>${prodlist.p_stock }</td>
	            <td>
	                <button type="button" class="btn btn-primary btn-sm" onclick="prodDetail('${prodlist.p_no }')">상세보기</button>
	            </td>
	            <td>
	                <button type="button" class="btn btn-success btn-sm" onclick="prodUpdate('${prodlist.p_no }')">수정하기</button>
	            </td>
	            <td>
	                <button type="button" class="btn btn-danger btn-sm" onclick="prodDelete('${prodlist.p_no }')">삭제하기</button>
	            </td>
	        </tr>
		</c:forEach>
		</tbody>
	</table>
	
	    <div class="searchDiv">
		    <form class="searchForm" action="adminProdList.ko" method="post">
		        <select id="sel1" name="searchCondition" style="display: inline-block !important; margin-right: 10px;">
		            <c:choose>
		                <c:when test="${searchCondition == 'pname'}">
		                    <option value="${conditionMapProd['상품명']}">상품명</option>
		                    <option value="${conditionMapProd['제조사']}">제조사</option>
		                    <option value="${conditionMapProd['상품번호']}">상품번호</option>
		                    <option value="${conditionMapProd['주종']}">주종</option>
		                </c:when>
		                <c:when test="${searchCondition == 'pmade'}">
		                    <option value="${conditionMapProd['제조사']}">제조사</option>
		                    <option value="${conditionMapProd['상품명']}">상품명</option>
		                    <option value="${conditionMapProd['상품번호']}">상품번호</option>
		                    <option value="${conditionMapProd['주종']}">주종</option>
		                </c:when>
		                <c:when test="${searchCondition == 'pno'}">
		                    <option value="${conditionMapProd['상품번호']}">상품번호</option>
		                    <option value="${conditionMapProd['상품명']}">상품명</option>
		                    <option value="${conditionMapProd['제조사']}">제조사</option>
		                    <option value="${conditionMapProd['주종']}">주종</option>
		                </c:when>
		                <c:when test="${searchCondition == 'ptype'}">
		                    <option value="${conditionMapProd['주종']}">주종</option>
		                    <option value="${conditionMapProd['상품명']}">상품명</option>
		                    <option value="${conditionMapProd['제조사']}">제조사</option>
		                    <option value="${conditionMapProd['상품번호']}">상품번호</option>
		                </c:when>
		                <c:otherwise>
		                    <option value="${conditionMapProd['상품명']}">상품명</option>
		                    <option value="${conditionMapProd['제조사']}">제조사</option>
		                    <option value="${conditionMapProd['상품번호']}">상품번호</option>
		                    <option value="${conditionMapProd['주종']}">주종</option>
		                </c:otherwise>
		            </c:choose>
		        </select>
		        <c:choose>
		           <c:when test="${searchKeyword == '' or searchKeyword == null}">
		              <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
		           </c:when>
		           <c:otherwise>
		              <input type="text" name="searchKeyword" value ="${searchKeyword}">
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
	           			 <a class="page-link" href="adminProdList.ko?currPageNo=${pagination.currPageNo - 1}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}">이전</a>
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
	           			 	<a class="page-link" href="adminProdList.ko?currPageNo=${page}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}">${page}</a>
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
		 				<a class="page-link" href="adminProdList.ko?currPageNo=${pagination.currPageNo + 1}&searchKeyword=${searchKeyword}&searchCondition=${searchCondition}">다음</a>
         			</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
<script>
function prodDetail(pno){
	location.href = 'adminProdDetail.ko?p_no=' + pno;
}
function prodUpdate(pno){
	location.href = 'adminProdUpdateSet.ko?p_no=' + pno;
}
function prodDelete(pno){
	let result = confirm("해당 상품을 삭제하시겠습니까?");
	if (result) {
		location.href = 'adminProdDelete.ko?p_no=' + pno;
	}
}
function fileUploadBtn() {
    $(".custom-file-label").click();
};

$("#p_img").change(function(event){
    var fileInput = document.getElementById('p_img');
    // 파일이 선택되었는지 확인합니다.
    if (fileInput.files.length > 0) {
        // 파일이 선택된 경우, 파일 이름을 가져와서 표시합니다.
        console.log(fileInput.files[0]);
        var fileName = fileInput.files[0].name;
        console.log(fileName);
        document.getElementById("div-filename").innerText = fileName;

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
            console.log(imgElement.src);
        };

        // 파일을 읽기
        reader.readAsDataURL(file);
    }
});
</script>
</body>
</html>