<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

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
	
	<link href="css/Common.css" rel="stylesheet" type="text/css" />
    <link href="css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
	        function duihuan(kucun)
	        {
	            <c:if test="${sessionScope.user==null}">
	                alert("请先登录");
	            </c:if>
	              <c:if test="${sessionScope.userType==2}">
		            if(document.buy.quantity.value=="")
		            {
		                alert("请输入兑换数量");
		                return false;
		            }
		              if(document.buy.quantity.value>kucun)
		            {
		                alert("兑换数量不能大于库存数量");
		                return false;
		            }
		            document.buy.submit();
	            </c:if>
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
						<div class="BoxHeader-center MarginTop10">
						     <span style="float:left">商品详情</span>
						</div>
					</div>
					<div class="Slot">
							<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%" border=0>
					
								<TR align="left">
									<TD height="5"></TD>
								</TR>
								<TR align="left" height="100%">
									<TD align="center">
									    <form action="<%=path %>/goods?type=duihuan" method="post" name="buy">
			                                  <table width="100%" border="0" cellpadding="9" cellspacing="9">
												    <tr>
												       <td align="left"><img width="220" height="180" src="<%=path %>/${requestScope.goods.fujian }" style="border:1px solid #ccc; padding:3px;"/></td>
												    </tr>
												    <tr>
												       <td align="left">商品编号：${requestScope.goods.bianhao }</td>
												    </tr>
												    <tr>
												       <td align="left">商品名称：${requestScope.goods.mingcheng }</td>
												    </tr>
											
												    <tr>
												       <td align="left">商品描述：<c:out value="${requestScope.goods.jieshao }" escapeXml="false"></c:out></td>
												    </tr>
												  
												    <tr>
												       <td align="left">所需积分：${requestScope.goods.jifen}</td>
												    </tr>
												    <tr>
												       <td align="left">
												           <hr>
												             兑换数量：<input type="text" name="quantity" value="1" size="8" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
												           <input type="hidden" name="goods_id" value="${requestScope.goods.id }"/>
												            <input type="hidden" name="jifen" value="${requestScope.goods.jifen }"/>
												          <input type="button" value="兑换" onclick="duihuan(${requestScope.goods.kucun })" style="width: 70px;height: 24px;" />
				 
												       </td>
												    </tr>
						                      </table>
			                            </form>
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
