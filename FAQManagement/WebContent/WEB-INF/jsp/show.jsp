<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<html>
	<head>
		 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		 <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		function goBack(){
	 		window.history.go(-1);  //返回上一页
	 	}
		</script>
	</head>
	
	<body>
		<form action="<%=request.getContextPath()%>/addFaq" method="post">
		<table  style="text-align: center;margin:auto;">
			<tr>
				<td colspan="2" style="text-align: right">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<font size="8">常见问题描述</font>
				</td>
			</tr>
			<tr>
				<td>分类：</td>
				<td style="text-align: left;"> ${result.type }</td>
			</tr>
			<tr>
				<td>标题：</td>
				<td style="text-align: left;">${result.title }</td>
			</tr>
			<tr>
				<td>内容：</td>
				<td style="text-align: left;">
					<textarea rows="8" cols="15" id="content" name="content">${result.content }</textarea><font id="contentAlert" color="red"></font>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="button" value="返回" onclick="goBack();">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>