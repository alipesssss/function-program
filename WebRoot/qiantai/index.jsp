<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	
	
	
	
<!--body-->
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
			 <jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include> 
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">垃圾分类知识</div>
					</div>
					<div class="Slot"><font size="3px">
                垃圾主要分为可回收物、厨余垃圾，有害垃圾和其他垃圾四类。<br/>
                1、可回收物：包括废纸、塑料、玻璃、金属和布料五大类，需要注意的是纸巾和厕所纸由于水溶性太强不可回收。<br/>
            2、    厨余垃圾：在上海又称为湿垃圾，包括剩菜剩饭、骨头、菜根菜叶、果皮等食品类废物。<br/>
                3、有害垃圾：指的是含有对人体健康有害额重金属，有毒的物质或者对环境造成危害的废弃物。<br/>
有害垃圾包括电池、灯泡、水银温度计、油漆桶、过期药品、过期化妆品等，这些垃圾一般使用单独回收或者填埋处理。<br/>
4、其他垃圾：是指除上述外的砖瓦陶瓷、渣土、卫生间废纸、纸巾等难以回收的废弃物，果壳、尘土、食品袋（盒），采取卫生填埋可有效减少对地下水、地表水、土壤和空气的污染。
               </font>     </div>
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