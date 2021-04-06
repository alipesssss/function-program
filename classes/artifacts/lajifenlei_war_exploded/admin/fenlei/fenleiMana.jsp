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
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
        <script language="javascript">
           function fenleiDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/fenlei?type=fenleiDel&id="+id;
               }
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="42" background="<%=path %>/img/tbg.gif">&nbsp;垃圾分类知识管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="35%">垃圾分类</td>
					<td width="30%">修改</td>
					<td width="30%">删除</td>
		        </tr>	
				<c:forEach items="${requestScope.fenleiList}" var="fenlei" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF">
					<td bgcolor="#FFFFFF" align="center">${sta.index+1}</td>
					<td bgcolor="#FFFFFF" align="center">${fenlei.fenleiName}</td>

					<td bgcolor="#FFFFFF" align="center">
			
						<form action="<%=path %>/fenlei?type=fenleiid&id=${fenlei.id}" method="post">
						    <input type="submit" value="修改"/>
						    </form>
						    </td>
						    	<td bgcolor="#FFFFFF" align="center">
				           	<input type="button" value="删除" onclick="fenleiDel(${fenlei.id})" value="删除"/>
						    </td>
						
			
						
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
