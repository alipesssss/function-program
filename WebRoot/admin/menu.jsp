<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
<STYLE type=text/css>BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; BACKGROUND-COLOR: #2a8dc8
}
BODY {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana
}
TD {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana
}
DIV {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana
}
P {
	FONT-SIZE: 12px; COLOR: #003366; FONT-FAMILY: Verdana
}
.mainMenu {
	FONT-WEIGHT: bold; FONT-SIZE: 15px; CURSOR: hand; COLOR: #000000
}
A.style2:link {
	PADDING-LEFT: 4px; COLOR: #0055bb; FONT-SIZE: 15px;TEXT-DECORATION: none
}
A.style2:visited {
	PADDING-LEFT: 4px; COLOR: #0055bb; TEXT-DECORATION: none
}
A.style2:hover {
	PADDING-LEFT: 4px; COLOR: #ff0000; TEXT-DECORATION: none
}
A.active {
	PADDING-LEFT: 4px; COLOR: #ff0000; TEXT-DECORATION: none
}
.span {
	COLOR: #ff0000;
	FONT-SIZE: 3px
}
</STYLE>

<SCRIPT language=javascript>
		function displayAll()
		{
		    for(var i=1;i<=5;i++)
		    {
		        document.getElementById('table_'+i).style.display='block';
				document.getElementById('table_'+i+'Span').innerText='-';
		    }		
		}

		function MenuDisplay(obj)
		{
		    /*for(var i=1;i<=4;i++)
		    {
		        document.getElementById('table_'+i).style.display='block';
				document.getElementById('table_'+i+'Span').innerText='-';
		    }*/
		    
			if(document.getElementById(obj).style.display=='none')
			{
				document.getElementById(obj).style.display='block';
				document.getElementById(obj+'Span').innerText='－';
			}
			else
			{
				document.getElementById(obj).style.display='none';
				document.getElementById(obj+'Span').innerText='＋';
			}
		}
		
		function MenuDisplay2(obj)
		{
		    for(var i=1;i<=3;i++)
		    {
		        document.getElementById('table_'+i).style.display='none';
				document.getElementById('table_'+i+'Span').innerText='＋';
		    }
			if(document.getElementById(obj).style.display=='none')
			{
				document.getElementById(obj).style.display='block';
				document.getElementById(obj+'Span').innerText='－';
			}
			else
			{
				document.getElementById(obj).style.display='none';
				document.getElementById(obj+'Span').innerText='＋';
			}
		}
		   function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path %>/login.jsp";
		   }
		}
    </SCRIPT>	 

  </head>
  <body onload="displayAll()">

<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="<%=path %>/admin/images/new_005.jpg" border=0></TD>
    <TD align=middle width=180 background=images/new_006.jpg 
      height=35><B>功能菜单</B> </TD>
    <TD width=15><IMG src="<%=path %>/admin/images/new_007.jpg" 
border=0></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <TBODY>
  <TR>
    <TD width=15 background="<%=path %>/admin/images/new_008.jpg"></TD>
    <TD vAlign=top width=180 bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=3 width=165 align=center border=0>
        <TBODY>
            <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_0');"><SPAN 
            class=span id=table_0Span>＋</SPAN>垃圾分类知识管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_0  cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                
                  <TR>
                <TD class=menuSmall><A class=style2 
                   href='<%=path %>/admin/fenlei/fenleiAdd.jsp' target='I2'>－垃圾分类知识添加</A></TD></TR>
                   <TR>
                <TD class=menuSmall><A class=style2 
                   href='<%=path %>/fenlei?type=fenleiMana' target='I2'>－垃圾分类知识管理</A></TD></TR>
                   
                  </TBODY></TABLE></TD></TR>
         <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_1');"><SPAN 
            class=span id=table_1Span>＋</SPAN>登记信息管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_1  cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                
                  <TR>
                <TD class=menuSmall><A class=style2 
                   href='<%=path %>/user?type=userdengji' target='I2'>－登记信息管理</A></TD></TR>
                   
                   
                  </TBODY></TABLE></TD></TR>
                     <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
        <TR>
         <TD class=mainMenu onClick="MenuDisplay('table_2');">
            <SPAN class=span id=table_2Span>＋</SPAN>商城管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_2 cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
       
             <TR>
    
                <TD class=menuSmall><A class=style2 
                 href='<%=path %>/admin/goods/goodsAdd.jsp' target='I2'>－商品添加</A></TD></TR>
                <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/goods?type=goodsMana' target='I2'>－商品管理</A></TD></TR>
              <TR>
			 </TBODY></TABLE></TD></TR>
       

        <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_3');"><SPAN 
            class=span id=table_3Span>＋</SPAN>新闻管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_3 style="DISPLAY: none" cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                  <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/gonggao?type=gonggaoMana2' target='I2'>－给予积分</A></TD></TR>
        <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/gonggao?type=gonggaoMana1' target='I2'>－新闻删除</A></TD></TR>
   
                  </TBODY></TABLE></TD></TR>
                  
                                        
                   
                   
                    <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_4');"><SPAN 
            class=span id=table_4Span>＋</SPAN>留言管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_4         
            
            cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                  <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/liuyan?type=liuyanMana' target='I2'>－留言管理</A></TD></TR>
      
   
                  </TBODY></TABLE></TD></TR>
              
                           
                    <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_6');"><SPAN 
            class=span id=table_6Span>＋</SPAN>用户管理</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_6         
            
            cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                  <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/user?type=userMana' target='I2'>－会员设置</A></TD></TR>
      
           <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/user?type=userMana1' target='I2'>－管理员任命</A></TD></TR>
                  </TBODY></TABLE></TD></TR>     
                    

                    <TR>
                    
                    
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_5');"><SPAN 
            class=span id=table_5Span>＋</SPAN>修改密码</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_5 
            
            
            cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                  <TR>
                <TD class=menuSmall><A class=style2 
                  href='<%=path %>/admin/userinfo/userPw1.jsp' target='I2'>－修改密码</A></TD></TR>
      
   
                  </TBODY></TABLE></TD></TR>
                   <TR>
                   <TR>
          <TD background=images/new_027.jpg height=1></TD></TR>
        <TR>
          <TD class=mainMenu onClick="MenuDisplay('table_9');"><SPAN 
            class=span id=table_9Span>＋</SPAN>退出系统</TD></TR>
        <TR>
          <TD>
            <TABLE id=table_9  cellSpacing=0 cellPadding=2 
            width=155 align=center border=0>
              <TBODY>
                  <TR>
                <TD class=menuSmall><A class=style2 
                  href="<%=path %>/login.jsp" 
                  target="_parent">－退出系统</A></TD></TR>
      
            
                  </TBODY></TABLE></TD></TR>
                   <TR>
                   
                   
          <TD background=images/new_027.jpg height=1></TD></TR>
    
       
       
                  
                  
                  
                  
 
</TBODY></TABLE></TD>
    <TD width=15 background=images/new_009.jpg></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=210 align=center border=0>
  <TBODY>
  <TR>
    <TD width=15><IMG src="images/new_010.jpg" border=0></TD>
    <TD align=middle width=180 background=images/new_011.jpg 
    height=15></TD>
    <TD width=15><IMG src="images/new_012.jpg" 
border=0></TD></TR></TBODY></TABLE>

  </body>
</html>
