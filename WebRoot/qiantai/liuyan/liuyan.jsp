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
    	function liuyancheck()
    	{
    		
    		 <c:if test="${sessionScope.user==null}">
                  alert("留言请先登录");
                   return;
            </c:if>
    		 if(document.form1.title.value=="")
		        {
		            alert("请输入留言标题");
		            return false;
		        }
		       
    		document.form1.submit();
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
						<div class="BoxHeader-center MarginTop10">社区留言</div>
					</div>
					<div class="Slot">
                <c:forEach items="${requestScope.liuyanList}" var="liuyan" varStatus="sta">
	     <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="100%"  borderColorLight=#e0e0e0 border=1>
	        <TR bgColor=#f0f0f0 height=30>
		          <TD style="TEXT-INDENT: 5px" width="12%" style="font-size: 11px;">${sta.index+1 }楼</TD>
		          <TD colSpan=2 style="font-size: 11px;">
		                <span style="float:left">【标题】${liuyan.title } </span>
		                <span style="float:right">${liuyan.shijian }&nbsp;&nbsp;&nbsp;&nbsp;</span>
		          </TD>
	        </TR> 
	   
	        <TR height=20>
		          <TD style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		     
		          </TD>
		           <TD style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; PADDING-BOTTOM: 6px; PADDING-TOP: 6px" vAlign=top style="font-size: 11px;">
		           留言内容：    ${liuyan.content }
		           <br/>     回复内容：    ${liuyan.huifu }
		          </TD>
	        </TR>
	    </TABLE>
	    </c:forEach>
	    <TABLE style="MARGIN-TOP: 8px; WORD-BREAK: break-all" borderColor=#e3e3e3 cellSpacing=0 borderColorDark=white cellPadding=0 rules=all width="100%"  borderColorLight=#e0e0e0 border=1>
	    	        <TR bgColor=#f9f9f9>
		          <TD vAlign=top align=middle rowSpan=3>
			          <TABLE style="MARGIN-TOP: 3px" height=110 cellSpacing=0 cellPadding=0 width="95%" border=0>
				              <TR height="35%">
					                <TD align=middle width="30%">
					                </TD>
				              </TR>
			          </TABLE>
		          </TD>
	        </TR>
	        <TR height=20>
		          <TD>
			            <form action="<%=path %>/liuyan?type=liuyanAdd" name="form1" method="post">
			            <table border="0">
						     <tr>
						         <td style="font-size: 11px;">标题:</td>
						         <td><input type="text" name="title" size="50"/></td>
						     </tr>
						     <tr>
						         <td style="font-size: 11px;">内容:</td>
						         <td>
						              <FCK:editor instanceName="content"  basePath="/fckeditor" width="500" height="200" value="请输入内容" toolbarSet="Basic">
				                      </FCK:editor>
				                 </td>
						     </tr>
						     <tr>
						         <td style="font-size: 11px;">&nbsp;</td>
						         <td>
						         <input type="button" value="提交 " onclick="liuyancheck();"/>
		
				                 </td>
						     </tr>
						</table>
						</form>
		          </TD>
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