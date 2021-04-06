<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		
        <script language="javascript">
         function huiyuanshezhi(id)
           {
               if(confirm('您确定要把该用户设置成会员用户吗？'))
               {
                   window.location.href="<%=path %>/user?type=huiyuanshezhi&id="+id;
               }
           }
           function huiyuanquxiao(id)
           {
               if(confirm('您确定要取消吗？'))
               {
                   window.location.href="<%=path %>/user?type=huiyuanDel&id="+id;
               }
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/img/tbg.gif">&nbsp;用户会员设置&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="20%">用户名</td>
					<td width="10%">姓名</td>
					<td width="20%">联系方式</td>
					<td width="10%">微信号</td>
					<td width="10%">积分</td>
					<td width="10%">权限</td>
					<td width="20%">设置/取消会员</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						 ${user.zhanghao}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.xingming}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.dianhua}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.weixin}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.jifen}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						 ${user.quanxian}
					</td>
				
					<td bgcolor="#FFFFFF" align="center">
					  <c:if test="${user.quanxian=='普通用户'}">
					<input type="button"  class="submit" value="设置" onclick="huiyuanshezhi(${user.id});" style="width: 50px;"/>
					  </c:if>
					  <c:if test="${user.quanxian=='会员用户'}">
			<input type="button"  class="submit" value="取消" onclick="huiyuanquxiao(${user.id});" style="width: 50px;"/>
					  	  </c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>