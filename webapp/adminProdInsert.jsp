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
<title>주류추가</title>
<style>
div.djmain {
	width: 1140px;
	margin: 0 auto;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/admin/adminMain.jsp" %>
<div class="djmain">
<%@ include file="/prodInsertEditer.jsp" %>
</div>
</body>
</html>