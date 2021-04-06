<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
      <div class="SquarelyGreenContainer">
		<div class="top">
			<div class="bgbtop-center">
				<span><a href="">用户中心</a></span>
				<div class="WinRight"></div>
			</div>
		</div>
		<div class="Slot">
		    <jsp:include flush="true" page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
		</div>
	 </div>
	
	 <div class="SquarelyGreenContainer">
		<div class="top">
			<div class="bgbtop-center">
				<span><a href="">日历表</a></span>
				<div class="WinRight"></div>
			</div>
		</div>
		<div class="Slot">
		    <jsp:include flush="true" page="/qiantai/rili/rili.jsp"></jsp:include>
		</div>
	 </div>
  </body>
</html>
