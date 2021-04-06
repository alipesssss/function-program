<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
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
	
	<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
	
	<script type="text/javascript">
	        function login()
	        {
	           if(document.getElementById("loginname").value=="")
	           {
	               alert("请输入用户名");
	               return;
	           }
	           if(document.getElementById("loginpw").value=="")
	           {
	               alert("请输入密码");
	               return;
	           }	           
	           document.getElementById("indicator").style.display="block";
			   loginService.login(document.getElementById("loginname").value,document.getElementById("loginpw").value,2,callback);
	        }
	        function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    if(data=="no")
			    {
			        alert("用户名或密码错误");
			    }
			    if(data=="yes")
			    {
			        alert("通过验证,系统登录成功");
			        window.location.reload();
			    }
			    
			}

			function logout()
	        {
			    loginService.logout(callback1);
	        }
	        function callback1(data)
			{
			    alert("退出成功");
	      var url="<%=path %>/qiantai/index.jsp";
                 window.location.href=url;
			}
	</script>
  </head>
  
  <body>

                  <c:if test="${sessionScope.user==null||sessionScope.userType==0||sessionScope.userType==1}">
			      <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
			          <tr>
			            <td align="center" colspan="2" height="10"></td>
			          </tr>
			          <tr>
			            <td align="right" width="31%" height="30" style="font-size: 11px;"><strong>用户名：</strong></td>
			            <td align="left" width="69%"><strong><input type="text" id="loginname" style="width: 100px;" name="loginname"></strong></td>
			          </tr>
			          <tr>
			            <td align="right" height="30" style="font-size: 11px;"><strong>密　码：</strong></td>
			            <td align="left"><strong><input type="password" id="loginpw" style="width: 100px;" name="loginpw"></strong></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="10"><strong></strong><br></td>
			          </tr>
			          <tr>
			            <td align="center" colspan="2" height="30"><strong> 
			               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			               <input type="button" value="登  录" onclick="login()" style="width: 70px;height: 24px;">
			           
			               
			             
						   
			               <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
			            </td>
			          </tr>
			      </table>
		  </c:if>
		    
		     <c:if test="${sessionScope.user!=null&&sessionScope.userType==2}">
		        <br/>
			      欢迎您：${sessionScope.user.xingming}<br/>
			      身份：${sessionScope.user.quanxian}，积分为：${sessionScope.user.jifen}
			     <br/>
			       
			        <a href="<%=path %>/qiantai/dengji/dengjiAdd.jsp">登记领垃圾袋</a> &nbsp;&nbsp;&nbsp;&nbsp;<br/>
			           <a href="<%=path %>/gonggao?type=gonggaoMana">我的新闻</a> &nbsp;&nbsp;&nbsp;&nbsp;<br/>
			              <a href="<%=path %>/goods?type=myduihuan1">商品兑换记录</a> &nbsp;&nbsp;&nbsp;&nbsp;<br/>
			                    <a href="<%=path %>/qiantai/yonghu/yonghuUpdate.jsp">个人信息修改</a> &nbsp;&nbsp;&nbsp;&nbsp;<br/>
			                    <a href="<%=path %>/qiantai/yonghu/Updatemima.jsp">修改登录密码</a> &nbsp;&nbsp;&nbsp;&nbsp;<br/>
			    <a href="#" onclick="logout()">安全退出</a> &nbsp;&nbsp;&nbsp;&nbsp;
			    <br/><br/>
			  </c:if>
  </body>
</html>
