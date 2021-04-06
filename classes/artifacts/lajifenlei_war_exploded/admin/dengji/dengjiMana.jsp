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
          function quxiao(id)
           {
               if(confirm('您确定取消吗？'))
               {
                   window.location.href="<%=path %>/user?type=quxiao&id="+id;
               }
           }
           function gonggaoDetail(id)
           {
                 var url="<%=path %>/gonggao?type=gonggaoDetail&id="+id;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
            function jifen(id)
           {
                 var url="<%=path %>/admin/gonggao/jifenAdd.jsp?id="+id;
                 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="6" background="<%=path %>/img/tbg.gif">登记信息管理;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">用户姓名</td>
					<td width="20%">联系电话</td>
					<td width="20%">微信号</td>
					<td width="20%">联系地址</td>
				    <td width="20%">登记领取时间</td>
					<td width="10%">取消</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
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
						 ${user.dizhi}
					</td>
					 <td bgcolor="#FFFFFF" align="center">
						 ${user.quanxian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
					 	<input type="button" value="取消" onclick="quxiao(${user.id})" value="取消"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
