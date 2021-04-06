<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
        <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script language="javascript">         
           function check()
           {
               if(document.formAdd.fenleiName.value=="")
               { 
                   alert("请输入分类名称);
                   return false;
               }
               return true;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/fenlei?type=fenleiUpdate" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">&nbsp;垃圾分类知识修改&nbsp;</td>
						</tr>
					
					<c:forEach items="${requestScope.fenleixx}" var="fenlei" varStatus="sta">
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						      垃圾分类名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="fenleiName" size="40" value="${fenlei.fenleiName }"/>
						    </td>
						</tr>
			
							
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         垃圾分类内容：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="fenleiNeirong"  basePath="/fckeditor" width="600" value="${fenlei.fenleiNeirong}" height="400" toolbarSet="Basic">
	                            </FCK:editor>
	                            	     <input type="hidden" name="id" value="${fenlei.id}"/>
						    </td>
						</tr>
						</c:forEach>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
					
						       <input type="submit" value="提交" onclick="return check()"/>&nbsp; 
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
