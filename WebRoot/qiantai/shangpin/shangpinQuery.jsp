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
  
    
    
 
  </head>
  <body>
<!-- head如果图片高度不合适。请修改Common.ces里面的".Header .HeaderTop"的高度。和".Header"的高度-->
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
<!-- head-->	
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
			 <jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include> 
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">
						     <span style="float:left">兑换商品</span>
						</div>
					</div>
					<div class="Slot">
					  <TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
								<TR align="left" height="100%">
									<TD>
									    <table cellspacing="5" cellpadding="2">
									          <tr>
									               <c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
									                  <c:if test="${sta.index%4==0}">
									                     </tr><tr>
									                  </c:if>
									                  <td align="center">
														   <a href="<%=path %>/goods?type=goodsDetailQian&id=${goods.id }">  
														      <img width="180" height="200" src="<%=path %>/${goods.fujian }" style="border:1px solid #ccc; padding:3px;"/>
														   </a>
														   <br>
									                       ${goods.mingcheng }
									                       <br>
									                       (${goods.jifen}积分)
									                  </td>
									                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									              </c:forEach>
									          </tr>
						                  </table>
									</TD>
								</TR>
								<TR align="left">
									<TD height="5"></TD>
								</TR>
						</TABLE>
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