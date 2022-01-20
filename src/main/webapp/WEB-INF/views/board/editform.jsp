<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.my.myapp.bean.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	BoardVO vo = (BoardVO)request.getAttribute("boardVO");
%>
<body>
	<form method="post" action="../editok">
		<input type="hidden" name="id" value = "<%=vo.getId()%>"/>
		<table id="edit">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value = "<%=vo.getName()%>"/></td>
			</tr>
			<tr>
				<td>salary</td>
				<td><input type="text" name="salary" value = "<%=vo.getSalary()%>" /></td>
			</tr>
			<tr>
				<td>designation</td>
				<td><input type="text" name="designation" value = "<%=vo.getDesignation()%>"/></td>
			</tr>
		</table>
		<button type="button" onclick="history.back()">취소하기</button>
		<button type="submit">수정하기</button>
	</form>
</body>
</html>