<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.my.myapp.bean.BoardVO" %>
<%@page import="java.util.List" %>
<jsp:useBean id="dao" class="com.my.myapp.dao.BoardDAO"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하시겠습니까?");
		if(a) location.href='deleteok/' + id;
	}
</script>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
%>
<body>
	<table>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.id}</td>
				<td>${u.name}</td>
				<td>${u.salary}</td>
				<td>${u.designation}</td>
				<td><a href="editform/${u.id}">글수정</a></td>
				<td><a href="javascript:delete_ok('${u.id}')">글삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/><button type="button" onclick="location.href='add'">새글쓰기</button>
</body>
</html>