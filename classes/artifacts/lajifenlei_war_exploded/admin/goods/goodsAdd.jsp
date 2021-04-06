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
           var i=0;
           function catelogAll()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           
           
           function up()
	       {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
	       }
           
           function check()
           {
               if(document.formAdd.bianhao.value=="")
               { 
                   alert("请输入商品编号");
                   return false;
               }
                if(document.formAdd.mingcheng.value=="")
               { 
                   alert("请输入商品名称");
                   return false;
               }
                 if(document.formAdd.jifen.value=="")
               { 
                   alert("请输入商品积分");
                   return false;
               }
                 if(document.formAdd.kcun.value=="")
               { 
                   alert("请输入库存数量");
                   return false;
               }
               return true;
           }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/img/allbg.gif'>
			<form action="<%=path %>/goods?type=goodsAdd" name="formAdd" method="post">
				     <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
						<tr bgcolor="#E7E7E7">
							<td height="14" colspan="4" background="<%=path %>/img/tbg.gif">商品添加&nbsp;</td>
						</tr>
			
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         商品编号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="bianhao" size="40"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        商品名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="mingcheng" size="40"/>
						    </td>
						</tr>
					
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         介绍：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="jieshao"  basePath="/fckeditor" width="420" height="150" value="请输入内容" toolbarSet="Basic">
	                            </FCK:editor>
						    </td>
						</tr>
					
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        图片：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="fujian" id="fujian" size="30" readonly="readonly"/>
						        <input type="button" value="上传" onclick="up()"/>
						        <input type="hidden" name="fujian" id="fujian"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         所需积分：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="jifen" size="40" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						       库存数量：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="kucun"  size="40" onpropertychange="onchange1(this.value)" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
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
