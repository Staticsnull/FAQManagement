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
		
		
		$(function(){
			$('#submit').click(function(){
					var classid = $('#classesSelect').val();
					var title = $('#title').val();
					var content = $('#content').val();
					
					if(classid=='0'){
						$('#classesSelectAlert').text('请选择分类');
						return false;
					}else if(title==''){
						$('#titleAlert').text('请填写标题');
						return false;
					}else if(content==''){
						$('#contentAlert').text('请填写内容');
						return false;
					}
					
					return true;
				});
				//异步加载分类信息
				$.ajax({
					url:'<%=request.getContextPath() %>/getClasses',
					success:function(data){
						for(var i = 0 ; i < data.length ; i++){
							$('#classesSelect').append("<option value="+data[i].id+">"+data[i].cname+"</option>");
						}
						
					}
				});
			
			});
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
					<font size="5">添加常见问题</font>
				</td>
			</tr>
			<tr>
				<td>分类：</td>
				<td style="text-align: left;">
				<select id="classesSelect" name="classid">
					<option value="0">-请选择分类-</option>
				</select>
				<font color="red" id="classesSelectAlert"></font></td>
			</tr>
			<tr>
				<td>标题：</td>
				<td style="text-align: left;"><input type="text" id="title" name="title"/><font id="titleAlert" color="red"></font></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td style="text-align: left;">
					<textarea rows="8" cols="15" id="content" name="content"></textarea><font id="contentAlert" color="red"></font>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" style="text-align: center;">
					<input id="submit" type="submit" value="保存">
					<input type="reset" value="重置" >
					<input type="button" value="返回" onclick="goBack();">
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>