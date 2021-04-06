<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'daohang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
     <div class="FooterContainer ">
			<ul>
				<li> 
				垃圾分类信息管理系统 
					<a href="">版权所有：于勇杰</a>&nbsp;&nbsp; |&nbsp;&nbsp;
					<a href="<%=path %>/login.jsp">管理员登录</a>&nbsp;&nbsp; |&nbsp;
		
				</li>
				
			</ul>
	</div>
  </body>
</html>
