<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    		 if(document.formAdd.title.value=="")
		        {
		            alert("请输入新闻标题");
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
						<div class="BoxHeader-center MarginTop10">新闻添加</div>
					</div>
					<div class="Slot">
                <form name="formAdd" method="post" action="<%=path %>/gonggao?type=gonggaoAdd">
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                   新闻标题：<input style="width: 200px;" name="title" type="text" />
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                新闻内容： <FCK:editor instanceName="content"  basePath="/fckeditor" width="500" height="200" value="请输入内容" toolbarSet="Basic">
	                            </FCK:editor>
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                    <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 100px;">
                                        <input type="submit" value="添加" style="width: 100px;height: 24px;"/>
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  </form>
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