<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<script type="text/javascript" src="<%=request.getContextPath() %>/statics/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		$(function(){
			$('#searchBtn').click(function(){
					var keyword = $('#keyword').val();
					window.location.href = "<%=request.getContextPath() %>/listFaqs?keyword="+keyword;
				});
			});
		</script>
	</head>
	
	<body>
		<h1 style="text-align: center;">常见问题检索</h1>
		
		<div align="left">
			请输入查询关键字:<input type="text" id="keyword" value="${result.keyword}" size="20">
			<button id="searchBtn">查询</button>
			 <a href="<%=request.getContextPath() %>/toAddFaqs">添加常见问题</a>
		</div>
		<table border="1" cellspacing="0" style="text-align: center;width:100%">
			<tr>
				<td colspan="5" height="50px;" style="text-align: center;">
					<font size="5">检索结果</font>
					<c:if test="${result.list.size() < 1}">
							<p><font size="5">没有找到和"${result.keyword }"相关的内容</font></p>
							<p><font size="5">请修改关键字后重试</font></p>
					
					</c:if>
				</td>
			</tr>
		<c:if test="${result.list.size() > 0}">
			<tr style="background: #ffffff;">
				<th>编号</th>
				<th>标题</th>
				<th>分类</th>
				<th>创建时间</th>
			</tr> 
		 <c:forEach items="${result.list}" var="gs" varStatus="st">
        	<tr style="background: ${st.index % 2 == 0?'#cccccc;':''}">
	            <td>${gs.id}</td>
	            <td><a href="<%=request.getContextPath() %>/toShowFaq?id=${gs.id}">${gs.title}</a></td>
	            <td>${gs.type}</td>
	            <td>${gs.createdate}</td>
       		</tr>
       		</c:forEach>
       		<tr>
       			<td colspan="5">
       				<c:if test="${not empty result.status}">
       					<c:choose>
       						<c:when test="${result.status eq '0' }">
       							<font color="red">保存失败！</font>
       						</c:when>
       						<c:otherwise>
       							<font color="red">保存成功！</font>
       						</c:otherwise>
       						
       					</c:choose>
       				</c:if>
       				
       				
       				<div style="float: right;">
       				
       					<table>
       					<tr>
       						<td><a href="<%=request.getContextPath() %>/listFaqs?pageIndex=0&keyword=${result.keyword}">首页</a></td>
       						<td><a href="<%=request.getContextPath() %>/listFaqs?pageIndex=${result.pageIndex-1}&keyword=${result.keyword}">上页</a></td>
       						<td><a href="<%=request.getContextPath() %>/listFaqs?pageIndex=${(result.pageIndex+1) eq result.pageCount?(result.pageIndex):(result.pageIndex+1)}&keyword=${result.keyword}">下页</a></td>
       						<td><a href="<%=request.getContextPath() %>/listFaqs?pageIndex=${result.pageCount-1}&keyword=${result.keyword}">末页</a></td> 
       						<td>第${result.pageIndex+1 }页/共${result.pageCount }页</td>
       					</tr>
       					</table>
       				</div>
       			</td>
       		</tr>
       		</c:if>
		</table>
	</body>
</html>