<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link href="<%=path %>/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
    <script type="text/javascript">
    	function check()
    	{
    		
    		 if(document.formAdd.zhanghao.value=="")
		        {
		            alert("请输入账号");
		            return false;
		        }
		        if(document.formAdd.mima.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		       if(document.formAdd.mima1.value=="")
		        {
		            alert("请输入确认密码");
		            return false;
		        }
		        if(document.formAdd.mima1.value!=document.formAdd.mima.value)
		        {
		            alert("两次输入的密码必须一致");
		            return false;
		        }
		        if(document.formAdd.xingming.value=="")
		        {
		            alert("请输入姓名");
		            return false;
		        }
		         if(document.formAdd.dianhua.value=="")
		        {
		            alert("请输入联系电话");
		            return false;
		        }
		         if(document.formAdd.weixin.value=="")
		        {
		            alert("请输入微信号码");
		            return false;
		        }
    		document.formAdd.submit();
    	}
    	
    </script>
    
    
 
  </head>
  
<body>
<!-- head如果图片高度不合适。请修改Common.ces里面的".Header .HeaderTop"的高度。和".Header"的高度-->
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
<!-- head-->	
	
	
	
	
<!--body-->
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
			 <jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include> 
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">我的新闻</div>
					</div>
					<div class="Slot">
						<table width="99%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
							<tr align="center" bgcolor="#FAFAF1" height="22">
								<td width="40%">新闻标题</td>
								<td width="30%">发布时间</td>
								<td width="30%">给予积分</td>
		
					        </tr>	
							 <c:forEach items="${requestScope.gonggaoList}" var="gonggao" varStatus="sta">
							<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
								<td bgcolor="#FFFFFF" align="center">
								      ${gonggao.title}
								</td>
								<td bgcolor="#FFFFFF" align="center">
								      ${gonggao.shijian}
								</td>
								<td bgcolor="#FFFFFF" align="center">
							 <c:if test="${gonggao.jifen=='0'}">
					        未给予积分
					     </c:if>
					     <c:if test="${gonggao.jifen!='0'}">
					   ${gonggao.jifen}
					     </c:if>
								</td>
						</tr>
							    </c:forEach>
						</table>
					 <a href="<%=path%>/qiantai/xinwen/xinwenAdd.jsp">新闻添加</a>
                    </div>
				</div>
		 </div>
</div>
</div>
<!--body-->
	
	
	
<!--foot -->	
<div align="center" class="Wrapper">
	<div id="footer" align="center" class="Footer">
		 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</div>
</div>
<!--foot -->	
</body>
</html>