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
           function xiajia(id)
           {
               if(confirm('您确定下架吗？'))
               {
                   window.location.href="<%=path %>/goods?type=xiajia&id="+id;
               }
           }
            function shangjia(id)
           {
               if(confirm('您确定上架吗？'))
               {
                   window.location.href="<%=path %>/goods?type=shangjia&id="+id;
               }
           }
          
           function over(picPath)
	       {
			  if (picPath=="")picPath="/img/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }
		   
		   function goodsDetailHou(id)
           {
                 var url="<%=path %>/goods?type=goodsDetailHou&id="+id;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="42" background="<%=path %>/img/tbg.gif">&nbsp;商品管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="20%">商品编号</td>
					<td width="20%">商品名称</td>
					<td width="10%">图片</td>
					<td width="10%">所需积分</td>
				   <td width="10%">库存数量</td>
				   	<td width="5%">状态</td>
					<td width="5%">修改</td>
					<td width="15%">上架/下架</td>
		        </tr>	
				<c:forEach items="${requestScope.goodsList}" var="goods" varStatus="sta">
				<tr align='center' bgcolor="#FFFFFF">
					<td bgcolor="#FFFFFF" align="center">${sta.index+1}</td>
					<td bgcolor="#FFFFFF" align="center">${goods.bianhao}</td>
					<td bgcolor="#FFFFFF" align="center">${goods.mingcheng}</td>
					<td bgcolor="#FFFFFF" align="center"><div onmouseover = "over('<%=path %>/${goods.fujian}')" onmouseout = "out()" style="cursor:hand;">图片</div></td>
					<td bgcolor="#FFFFFF" align="center">${goods.jifen}</td>
					<td bgcolor="#FFFFFF" align="center">${goods.kucun}</td>
					<td bgcolor="#FFFFFF" align="center">${goods.flag}</td>
					<td bgcolor="#FFFFFF" align="center">
			
						<form action="<%=path %>/goods?type=goodsManaid&id=${goods.id}" method="post">
						    <input type="submit" value="修改"/>
						    </form>
						    </td>
						    	<td bgcolor="#FFFFFF" align="center">
						        <c:if test="${goods.flag=='上架'}">
					<input type="button" value="下架" onclick="xiajia(${goods.id})" value="下架"/>
					     </c:if>
						   <c:if test="${goods.flag=='下架'}">
					<input type="button" value="上架" onclick="shangjia(${goods.id})" value="上架"/>
					     </c:if>
						    </td>
						
			
						
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
